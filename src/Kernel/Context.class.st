"
Instance variables:
	receiver: <Object> (self)
	closureOrNil: <BlockClosure|nil> 
		nil if I'm a method context
		the blockClosure being executed if I'm a block context
	method <CompiledMethod> 
		method being executed if I'm a method context
		method holding the block if I'm a block context
	variable fields: <Object> temporary variables (including arguments)

My instances hold all the dynamic state associated with the execution of either a method activation resulting from a message send or a block activation resulting from a block evaluation.
	
MethodContexts, though normal in their variable size, are actually only used in two sizes, small and large, which are determined by the temporary space required by the method being executed.

MethodContexts must only be created using the method newForMethod:.  Note that it is impossible to determine the real object size of a MethodContext except by asking for the frameSize of its method.  Any fields above the stack pointer (stackp) are truly invisible -- even (and especially!) to the garbage collector.  Any store into stackp other than by the primitive method stackp: is potentially fatal.
"
Class {
	#name : #Context,
	#superclass : #InstructionStream,
	#type : #variable,
	#instVars : [
		'stackp',
		'method',
		'closureOrNil',
		'receiver'
	],
	#classVars : [
		'PrimitiveFailToken',
		'QuickStep',
		'SpecialPrimitiveSimulators',
		'TryNamedPrimitiveTemplateMethod'
	],
	#category : #Kernel-Methods,
	#timestamp : '<historical>'
}

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>allInstances [
	"Answer all instances of the receiver."
	<primitive: 177>
	"The primitive can fail because memory is low.  If so, fall back on the old
	 enumeration code, which gives the system a chance to GC and/or grow.
	 Because aBlock might change the class of inst (for example, using become:),
	 it is essential to compute next before aBlock value: inst.
	 Only count until thisContext since this context has been created only to
	 compute the existing instances."
	| inst insts next |
	insts := WriteStream on: (Array new: 64).
	inst := self someInstance.
	[inst == thisContext or: [inst == nil]] whileFalse:
		[next := inst nextInstance.
		 insts nextPut: inst.
		 inst := next].
	^insts contents
]

{
	#category : #hacks,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>allInstancesDo: aBlock [
	"Evaluate aBlock with each of the current instances of the receiver."
	| instances inst next |
	instances := self allInstancesOrNil.
	instances ifNotNil:
		[instances do: aBlock.
		 ^self].
	"allInstancesOrNil can fail because memory is low.  If so, fall back on the old
	 enumeration code.  Because aBlock might change the class of inst (for example,
	 using become:), it is essential to compute next before aBlock value: inst.
	 Only count until thisContext since evaluation of aBlock will create new contexts."
	inst := self someInstance.
	[inst == thisContext or: [inst == nil]] whileFalse:
		[next := inst nextInstance.
		 aBlock value: inst.
		 inst := next]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>basicNew: size [
	self error: 'Contexts must only be created with newForMethod:'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>carefullyPrint: anObject on: aStream [
	aStream nextPutAll: ([anObject printString]
		on: Error
		do: ['unprintable ' , anObject class name])
]

{
	#category : #'special context creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>contextEnsure: block [
	"Create an #ensure: context that is ready to return from executing its receiver"

	| ctxt chain |
	ctxt := thisContext.
	[chain := thisContext sender cut: ctxt. ctxt jump] ensure: block.
	"jump above will resume here without unwinding chain"
	^ chain
]

{
	#category : #'special context creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>contextOn: exceptionClass do: block [
	"Create an #on:do: context that is ready to return from executing its receiver"

	| ctxt chain |
	ctxt := thisContext.
	[chain := thisContext sender cut: ctxt. ctxt jump] on: exceptionClass do: block.
	"jump above will resume here without unwinding chain"
	^ chain
]

{
	#category : #simulation,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>initialize [

	"A unique object to be returned when a primitive fails during simulation"
	PrimitiveFailToken := Object new.
	self initializeTryNamedPrimitiveTemplateMethod.
	SpecialPrimitiveSimulators := nil.
	QuickStep := nil.
]

{
	#category : #simulation,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>initializePrimitiveSimulators [
	"extra primitive simulators can be registered by implementing
	#registerPrimitiveSimulators method in class side of your class."
	<ignoreUnimplementedCalls: #(#registerPrimitiveSimulators)>
	
	SpecialPrimitiveSimulators := Dictionary new.

	Class allSubclassesDo: [:metaclass |
		(metaclass includesSelector: #registerPrimitiveSimulators) ifTrue: [
			metaclass theNonMetaClass registerPrimitiveSimulators.
			]
		].
]

{
	#category : #simulation,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>initializeTryNamedPrimitiveTemplateMethod [
	| source method |
	source := 'tryNamedPrimitive
	"This method is a template that the Smalltalk simulator uses to 
	execute primitives. See Object documentation whatIsAPrimitive."
	<primitive:'' module:'' error: errorCode>
	^ Context primitiveFailTokenFor: errorCode'.
	method := Smalltalk compiler
				class: UndefinedObject;
				source: source;
				compile.
	TryNamedPrimitiveTemplateMethod := method copyWithSource: source.



	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>isContextClass [
	^true
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>new [

	self error: 'Contexts must only be created with newForMethod:'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>new: size [

	self error: 'Contexts must only be created with newForMethod:'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>newForMethod: aMethod [
	"This is the only method for creating new contexts, other than primitive cloning.
	Any other attempts, such as inherited methods like shallowCopy, should be
	avoided or must at least be rewritten to determine the proper size from the
	method being activated.  This is because asking a context its size (even basicSize!)
	will not return the real object size but only the number of fields currently
	accessible, as determined by stackp."

	^ super basicNew: aMethod frameSize
]

{
	#category : #simulation,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>primitiveFailToken [

	^ self primitiveFailTokenFor: nil
]

{
	#category : #simulation,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>primitiveFailTokenFor: errorCode [

	^ { PrimitiveFailToken. errorCode }

]

{
	#category : #simulation,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>runSimulated: aBlock [
	"Simulate the execution of the argument, current. Answer the result it 
	returns."

	^ thisContext sender
		runSimulated: aBlock
		contextAtEachStep: [:ignored |]

	"Context runSimulated: [Pen new defaultNib: 5; go: 100]"
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>sender: s receiver: r method: m arguments: args  [
	"Answer an instance of me with attributes set to the arguments."

	^(self newForMethod: m) setSender: s receiver: r method: m arguments: args
]

{
	#category : #'registering simulated primitives',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>simulatePrimitive: primName module: moduleName with: simulator [
	^ self specialPrimitiveSimulators at: {primName. moduleName} put: simulator
]

{
	#category : #'registering simulated primitives',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>simulatePrimitiveNumber: num with: simulator [
	^ self specialPrimitiveSimulators at: num put: simulator
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>specialPrimitiveSimulators [
	SpecialPrimitiveSimulators ifNil: [ self initializePrimitiveSimulators ].
	^ SpecialPrimitiveSimulators
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>tallyInstructions: aBlock [
	"This method uses the simulator to count the number of occurrences of
	each of the Smalltalk instructions executed during evaluation of aBlock.
	Results appear in order of the byteCode set."
	| tallies |
	tallies := Bag new.
	thisContext sender
		runSimulated: aBlock
		contextAtEachStep:
			[:current | tallies add: current nextByte].
	^tallies sortedElements

	"Context tallyInstructions: [3.14159 printString]"
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>tallyMethods: aBlock [
	"This method uses the simulator to count the number of calls on each method
	invoked in evaluating aBlock. Results are given in order of decreasing counts."
	| prev tallies |
	tallies := Bag new.
	prev := aBlock.
	thisContext sender
		runSimulated: aBlock
		contextAtEachStep:
			[:current |
			current == prev ifFalse: "call or return"
				[prev sender ifNotNil: "call only"
					[tallies add: current printString].
				prev := current]].
	^ tallies sortedCounts

	"Contex tallyMethods: [3.14159 printString]"
]

{
	#category : #'special context creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>theReturnMethod [

	| meth |
	meth := self lookupSelector: #return:.
	meth isPrimitive ifTrue: [^ self error: 'expected #return: to not be a primitive'].
	^ meth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context class>>tryNamedPrimitiveTemplateMethod [
	^ TryNamedPrimitiveTemplateMethod
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>aboutToReturn: result through: firstUnwindContext  [
	"Called from VM when an unwindBlock is found between self and its home.
	 Return to home's sender, executing unwind blocks on the way."

	self methodReturnContext return: result through: firstUnwindContext
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>activateMethod: newMethod withArgs: args receiver: rcvr class: class  [
	"Answer a Context initialized with the arguments."

	^Context 
		sender: self
		receiver: rcvr
		method: newMethod
		arguments: args
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>activateReturn: aContext value: value [
	"Activate 'aContext return: value' in place of self, so execution will return to aContext's sender"

	^ self
		activateMethod: Context theReturnMethod
		withArgs: {value}
		receiver: aContext
		class: aContext class
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>activeHome [
	"If executing closure, search senders for the activation of the original
	 (outermost) method that (indirectly) created my closure (the closureHome).
	 If the closureHome is not found on the sender chain answer nil."

	| methodReturnContext |
	self isBlockContext ifFalse: [^self].
	self sender ifNil: [^nil].
	methodReturnContext := self methodReturnContext.
	^self sender findContextSuchThat: [:ctxt | ctxt = methodReturnContext]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>activeOuterContext [
	"If executing closure, search senders for the activation in which the receiver's
	 closure was created (the receiver's outerContext).  If the outerContext is not
	 found on the sender chain answer nil."

	| outerContext |
	self isBlockContext ifFalse: [^self].
	self sender ifNil: [^nil].
	outerContext := self outerContext.
	^self sender findContextSuchThat: [:ctxt | ctxt = outerContext]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>arguments [
	"returns the arguments of a message invocation"
	
	| arguments numargs |
	numargs :=  self method numArgs.
	arguments := Array new: numargs.
	1 to: numargs do: [ :i | arguments at: i put: (self tempAt: i) ].
	^ arguments
]

{
	#category : #'closure support',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>asContext [

	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>at: index [
	"Primitive. Assumes receiver is indexable. Answer the value of an
	 indexable element in the receiver. Fail if the argument index is not an
	 Integer or is out of bounds. Essential. See Object documentation
	 whatIsAPrimitive.  Override the default primitive to give latitude to
	 the VM in context management."

	<primitive: 210>
	index isInteger ifTrue:
		[self errorSubscriptBounds: index].
	index isNumber
		ifTrue: [^self at: index asInteger]
		ifFalse: [self errorNonIntegerIndex]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>at: index put: value [
	"Primitive. Assumes receiver is indexable. Answer the value of an
	 indexable element in the receiver. Fail if the argument index is not
	 an Integer or is out of bounds. Essential. See Object documentation
	 whatIsAPrimitive.  Override the default primitive to give latitude to
	 the VM in context management."

	<primitive: 211>
	index isInteger ifTrue:
		[self errorSubscriptBounds: index].
	index isNumber
		ifTrue: [^self at: index asInteger put: value]
		ifFalse: [self errorNonIntegerIndex]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>basicAt: index [
	"Primitive. Assumes receiver is indexable. Answer the value of an
	 indexable element in the receiver. Fail if the argument index is not an
	 Integer or is out of bounds. Essential. See Object documentation
	 whatIsAPrimitive.  Override the default primitive to give latitude to
	 the VM in context management."

	<primitive: 210>
	index isInteger ifTrue:
		[self errorSubscriptBounds: index].
	index isNumber
		ifTrue: [^self at: index asInteger]
		ifFalse: [self errorNonIntegerIndex]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>basicAt: index put: value [
	"Primitive. Assumes receiver is indexable. Answer the value of an
	 indexable element in the receiver. Fail if the argument index is not
	 an Integer or is out of bounds. Essential. See Object documentation
	 whatIsAPrimitive.  Override the default primitive to give latitude to
	 the VM in context management."

	<primitive: 211>
	index isInteger ifTrue:
		[self errorSubscriptBounds: index].
	index isNumber
		ifTrue: [^self at: index asInteger put: value]
		ifFalse: [self errorNonIntegerIndex]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>basicSize [
	"Primitive. Answer the number of indexable variables in the receiver. 
	This value is the same as the largest legal subscript. Essential. Do not 
	override in any subclass. See Object documentation whatIsAPrimitive.  Override the default primitive to give latitude to
	 the VM in context management."

	<primitive: 212>
	"The number of indexable fields of fixed-length objects is 0"
	^self primitiveFail
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>blockReturnConstant: value  [
	"Simulate the interpreter's action when a ReturnConstantToCaller
	bytecode is 
	encountered in the receiver. This should only happen in a closure
	activation. "
	self assert: closureOrNil isClosure.
	^ self return: value from: self

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>blockReturnTop [
	"Simulate the interpreter's action when a ReturnTopOfStackToCaller bytecode is 
	 encountered in the receiver.  This should only happen in a closure activation."
	[closureOrNil isClosure] assert.
	^self return: self pop from: self
]

{
	#category : #query,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>bottomContext [
	"Return the last context (the first context invoked) in my sender chain"

	^ self findContextSuchThat: [ :context | context sender isNil]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>callChainAnySatisfy: aBlock [

	(aBlock value: self) ifTrue: [ ^ true ].
	self sender ifNil: [ ^ false ].
	^ self sender callChainAnySatisfy: aBlock.
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>callPrimitive: primNumber [
	| res |
	res := receiver tryPrimitive: primNumber withArgs: self arguments.
	primNumber >= (1 << 15) ifTrue: [ "inlined primitive, cannot fail" ^ self push: res ].  
	"regular primitive. Always at the beginning of methods."
	(self isFailToken: res) ifTrue: [ "keeps interpreting the method" ^ self ].
	self push: res.
	self methodReturnTop
]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>canHandleSignal: exception [
	"Sent to handler (on:do:) contexts only.  If my exception class (first arg) handles exception then return true, otherwise forward this message to the next handler context.  If none left, return false (see nil>>canHandleSignal:)"

	^ (self exceptionClass handles: exception)
		or: [ self nextHandlerContext canHandleSignal: exception ].

]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>cannotReturn: result [
	closureOrNil ifNotNil: [ 
		^BlockCannotReturn result: result from: self home].
	Processor activeProcess 
		debug: thisContext 
		title: 'computation has been terminated'
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>cannotReturn: result to: aContext [
	"The receiver tried to return result to homeContext that no longer exists."

	^ ContextCannotReturn result: result to: aContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>client [
	"Answer the client, that is, the object that sent the message that created this context."

	^sender receiver
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>closure [
	^closureOrNil
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>closureCopy: numArgs copiedValues: anArray [
	"Distinguish a block of code from its enclosing method by 
	creating a BlockClosure for that block. The compiler inserts into all 
	methods that contain blocks the bytecodes to send the message 
	closureCopy:copiedValues:. Do not use closureCopy:copiedValues: in code that you write! Only the 
	compiler can decide to send the message closureCopy:copiedValues:. Fail if numArgs is 
	not a SmallInteger. Optional. No Lookup. See Object documentation 
	whatIsAPrimitive."

	<primitive: 200>
	^BlockClosure 
		outerContext: self
		startpc: pc + 2
		numArgs: numArgs
		copiedValues: anArray
]

{
	#category : #'system simulation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>completeCallee: aContext [
	"Simulate the execution of bytecodes until a return to the receiver."
	| context current nextContext |
	context := aContext.
	[ context == current or: [ context hasSender: self ] ]
		whileTrue: [
			current := context.
			nextContext := context quickStep.
			nextContext ifNil: [ self halt ].
			context := nextContext ].
	^ self stepToSendOrReturn
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>contextClass [
"The context class of a message send should be the one of the method to be evaluated, because if that method has some super sends, the method lookup won't work as expected'"

	^self method methodClass
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>contextStack  [
	"Answer an Array of the contexts on the receiver's sender chain."

	^self stackOfSize: 100000
]

{
	#category : #'closure support',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>contextTag [
	"Context tags may be used for referring to contexts instead of contexts themselves as they can be copied and will continue to work in other processes (continuations). By default, we use the context itself to as its tag."
	^self
]

{
	#category : #query,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>copyStack [

	^ self copyTo: nil
]

{
	#category : #query,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>copyTo: aContext [
	"Copy self and my sender chain down to, but not including, aContext.  End of copied chain will have nil sender."

	| copy |
	self == aContext ifTrue: [^ nil].
	copy := self copy.
	self sender ifNotNil: [
		copy privSender: (self sender copyTo: aContext)].
	^ copy
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>cut: aContext [
	"Cut aContext and its senders from my sender chain"

	| context callee |
	context := self.
	[ context == aContext ] whileFalse: [
		callee := context.
		context := context sender.
		context ifNil: [
			aContext ifNotNil: [
				self error: 'aContext not a sender' ]]].
	callee privSender: nil.

]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>debugStack: stackSize on: aStream [
	"print a condensed version of the stack up to stackSize on aStream"

	(self stackOfSize: stackSize)
		do: [ :item | 
			item printDebugOn: aStream.
			aStream cr ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>debugStackOn: aStream [
	"print the top ten contexts on my sender chain."
	^ self debugStack: 100 on: aStream
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>depthBelow: aContext [
	"Answer how many calls there are between this and aContext."

	| context depth |
	context := self.
	depth := 0.
	[ context == aContext or: [ context == nil ]]
		whileFalse: [
			context := context sender.
			depth := depth + 1 ].
	^ depth
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>doDup [
	"Simulate the action of a 'duplicate top of stack' bytecode."

	self push: self top
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>doNop [

	"do nothing"
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>doPop [
	"Simulate the action of a 'remove top of stack' bytecode."

	self pop
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>"protocol: private"
doPrimitive: primitiveIndex method: meth receiver: aReceiver args: arguments  [
	"Simulate a primitive method whose index is primitiveIndex.  The simulated receiver and
	 arguments are given as arguments to this message. If successful, push result and return
	 resuming context, else ^ {errCode, PrimitiveFailToken}. Any primitive which provokes
	 execution needs to be intercepted and simulated to avoid execution running away."

	| value |
	"Judicious use of primitive 19 (a null primitive that doesn't do anything) prevents
	 the debugger from entering various run-away activities such as spawning a new
	 process, etc.  Injudicious use results in the debugger not being able to debug
	 interesting code, such as the debugger itself.  hence use primitive 19 with care :-)"
	"SystemNavigation new browseAllSelect: [:m| m primitive = 19]"
	"primitiveIndex = 19 ifTrue:	[ | debugSession | 
			debugSession := Processor activeProcess newDebugSessionNamed: 'Code simulation error' startedAt: self.
			Smalltalk tools debugger openOn: debugSession withFullView: true]."

	((primitiveIndex between: 201 and: 222)
	 and: [(self objectClass: aReceiver) includesBehavior: BlockClosure]) ifTrue:
		[((primitiveIndex between: 201 and: 205)			 "BlockClosure>>value[:value:...]"
		  or: [primitiveIndex between: 221 and: 222]) ifTrue: "BlockClosure>>valueNoContextSwitch[:]"
			[^aReceiver simulateValueWithArguments: arguments caller: self].
		 primitiveIndex = 206 ifTrue:						"BlockClosure>>valueWithArguments:"
			[^aReceiver simulateValueWithArguments: arguments first caller: self]].
	
	((primitiveIndex between: 207 and: 209) "FullBlockClosure primitives"
	  and: [(self objectClass: aReceiver) includesBehavior: FullBlockClosure]) ifTrue: 
		[^primitiveIndex = 208 
			ifTrue: [aReceiver simulateValueWithArguments: arguments first caller: self]
			ifFalse: [aReceiver simulateValueWithArguments: arguments caller: self]].

	primitiveIndex = 83 ifTrue: "afr 9/11/1998 19:50" "Object>>perform:[with:...]"
		[^self send: arguments first to: aReceiver with: arguments allButFirst super: false].
	primitiveIndex = 84 ifTrue: "afr 9/11/1998 19:50 & eem 8/18/2009 17:04" "Object>>perform:withArguments:"
		[^self send: arguments first to: aReceiver with: (arguments at: 2) lookupIn: (self objectClass: aReceiver)].
	primitiveIndex = 100 ifTrue: "eem 8/18/2009 16:57" "Object>>perform:withArguments:inSuperclass:"
		[arguments size = 3 
			ifTrue: [ ^self send: arguments first to: aReceiver with: (arguments at: 2) lookupIn: (arguments at: 3)]
			ifFalse: [ ^self send: (arguments at: 2) to: (arguments at: 1) with: (arguments at: 3) lookupIn: (arguments at: 4) ]
		].


	"Mutex>>primitiveEnterCriticalSection
	 Mutex>>primitiveTestAndSetOwnershipOfCriticalSection"
	(primitiveIndex = 186 or: [primitiveIndex = 187]) ifTrue:
		[| active effective |
		 active := Processor activeProcess.
		 effective := active effectiveProcess.
		 "active == effective"
		 value := primitiveIndex = 186
					ifTrue: [aReceiver primitiveEnterCriticalSectionOnBehalfOf: effective]
					ifFalse: [aReceiver primitiveTestAndSetOwnershipOfCriticalSectionOnBehalfOf: effective].
		 ^(self isPrimFailToken: value)
			ifTrue: [value]
			ifFalse: [self push: value]].

	primitiveIndex = 188 ifTrue: "eem 5/27/2008 11:10 Object>>withArgs:executeMethod:"
		[arguments size = 2 
			ifTrue: "normal primitive"
				[^Context
					sender: self
					receiver: aReceiver
					method: (arguments at: 2)
					arguments: (arguments at: 1)]
			ifFalse: "mirror primitive"
				[^Context
					sender: self
					receiver: (arguments at: 1)
					method: (arguments at: 3)
					arguments: (arguments at: 2)]
		].
	"Closure primitives"
	(primitiveIndex = 200 and: [self == aReceiver]) ifTrue:
		"ContextPart>>closureCopy:copiedValues:; simulated to get startpc right"
		[^self push: (BlockClosure
						outerContext: aReceiver
						startpc: pc + 2
						numArgs: arguments first
						copiedValues: arguments last)].

	primitiveIndex = 118 ifTrue: "tryPrimitive:withArgs:; avoid recursing in the VM"
		[(arguments size = 2
		 and: [arguments first isInteger
		 and: [(self objectClass: arguments last) == Array]]) ifFalse:
			[^Context primitiveFailTokenFor: nil].
		 ^self doPrimitive: arguments first method: meth receiver: aReceiver args: arguments last].

	value := primitiveIndex = 120 "FFI method"
				ifTrue: [(meth literalAt: 1) tryInvokeWithArguments: arguments]
				ifFalse:
					[primitiveIndex = 117 "named primitives"
						ifTrue: [self tryNamedPrimitiveIn: meth for: aReceiver withArgs: arguments]
						ifFalse: [aReceiver tryPrimitive: primitiveIndex withArgs: arguments]].

	^(self isPrimFailToken: value)
		ifTrue: [value]
		ifFalse: [self push: value]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>endPC [
	^closureOrNil
		ifNil:	[self method endPC]
		ifNotNil: [closureOrNil endPC]
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>errorReportOn: stream [
	"Write a detailed error report on the stack (above me) on a  
	stream.  For both the error file, and emailing a bug report.   
	Suppress any errors while getting printStrings.  Limit the length."
	
	| stackDepth aContext |
	stream print: Date today; space; print: Time now; cr.
	stream cr.
	stream nextPutAll: 'VM: ';
		nextPutAll: Smalltalk os name asString;
		nextPutAll: ' - ';	
		nextPutAll: Smalltalk os subtype asString;
		nextPutAll: ' - ';
		nextPutAll: Smalltalk os version asString;
		nextPutAll: ' - ';
		nextPutAll: Smalltalk vm version asString;
		cr.	
	stream nextPutAll: 'Image: ';
		nextPutAll:  SystemVersion current version asString;
		nextPutAll: ' [';
		nextPutAll: Smalltalk lastUpdateString asString;
		nextPutAll: ']';
		cr.
	stream cr.
	"Note: The following is an open-coded version of  Context>>stackOfSize: since this method may be called during a  low space condition and we might run out of space for allocating the  full stack."	
	stackDepth := 0.  
	aContext := self.
	[ aContext notNil and: [ (stackDepth := stackDepth + 1) < 40 ]] 
		whileTrue: [
			"variable values"
			aContext printDetails: stream.
			stream cr.
			aContext := aContext sender ].
	stream cr; nextPutAll: '--- The full stack ---'; cr.
	aContext := self.	
	stackDepth := 0.
	[ aContext == nil ] whileFalse:	[
		stackDepth := stackDepth + 1.	
		stackDepth = 40 ifTrue: [ stream nextPutAll: ' - - - - - - - - - - - - - - -  
			- - - - - - - - - - - - - - - - - -'; cr ].
		"just class>>selector"	
		stream print: aContext; cr. 		
		stackDepth > 200 ifTrue: [
			stream nextPutAll: '-- and more not shown --'.
			^  self ].
		aContext := aContext sender ].
]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>evaluateSignal: exception [
	"The following primitive is just a marker used to find the evaluation context. 
	See MethodContext>>#isHandlerOrSignalingContext. "

	<primitive: 199>
	| value |
	exception privHandlerContext: self contextTag.
	value := self exceptionHandlerBlock cull: exception.	
	"return from self if not otherwise directed in handle block"
	self return: value
]

{
	#category : #'special context access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>exception [
	"signaling context (Context>>evaluateSignal:) only. Access the exception argument."
	^self tempAt: 1

]

{
	#category : #'special context access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>exceptionClass [
	"handlercontext only. access temporaries from BlockClosure>>#on:do:"
	^self tempAt: 1

]

{
	#category : #'special context access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>exceptionHandlerBlock [
	"handlercontext only. access temporaries from BlockClosure>>#on:do:"
	^self tempAt: 2

]

{
	#category : #'system simulation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>failPrimitiveWith: maybePrimFailToken [
	"The receiver is a freshly-created context on a primitive method.  Skip the callPrimitive:
	 bytecode and store the primitive fail code if there is one and the method consumes it."
	self skipCallPrimitive.
	((self isPrimFailToken: maybePrimFailToken)
	  and: [method encoderClass isStoreAt: pc in: method]) ifTrue:
		[self at: stackp put: maybePrimFailToken last]
]

{
	#category : #query,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>findContextSuchThat: testBlock [
	"Search self and my sender chain for first one that satisfies testBlock.  Return nil if none satisfy"

	| context |
	context := self.
	[ context isNil ] whileFalse: [
		(testBlock value: context) 
			ifTrue: [ ^ context ].
		context := context sender ].
	^ nil
]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>findNextHandlerContext [
	"Return the next handler marked context, returning nil if there is none.  Search starts with self and proceeds up to nil."

	| context |
	context := self findNextHandlerOrSignalingContext.
	context isNil
		ifTrue: [ ^ nil ].
	context isHandlerContext
		ifTrue: [ ^ context ].	"If it isn't a handler context, it must be a signaling context.
	When we reach a signaling context we must skip over any handlers
	that might be on the stack between the signaling context and the handler
	context for that signal."
	^ context exception privHandlerContext nextHandlerContext
]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>findNextHandlerOrSignalingContext [
	"Return the next handler/signaling marked context, answering nil if there is none. 
	Search starts with self and proceeds up to nil."

	<primitive: 197>
	| context |
	context := self.
	[ 
	context isHandlerOrSignalingContext
		ifTrue: [ ^ context ].
	(context := context sender) == nil ] whileFalse.
	^ nil
]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>findNextUnwindContextUpTo: aContext [
	"Return the next unwind marked above the receiver, returning nil if there is none.  Search proceeds up to but not including aContext."

	| context |
	<primitive: 195>
	context := self.
	[
		(context := context sender) == nil
		or: [ context == aContext ]
	] whileFalse: [
		context isUnwindContext
			ifTrue: [ ^context ]].
	^nil
]

{
	#category : #query,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>findSecondToOldestSimilarSender [
	"Search the stack for the second-to-oldest occurance of self's method.  Very useful for an infinite recursion.  Gets back to the second call so you can see one complete recursion cycle, and how it was called at the beginning."

	| secondContext context lastContext |
	secondContext := self.
	context := self.
	[	lastContext := context findSimilarSender.
		lastContext isNil
	] whileFalse: [
		secondContext := context.
		context := lastContext.
	].
	^ secondContext

]

{
	#category : #query,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>findSimilarSender [
	"Return the closest sender with the same method, return nil if none found"

	^ self sender findContextSuchThat: [ :context | 
		context method == method ]
]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>handleSignal: exception [
	"Sent to handler (on:do:) contexts only.  If my exception class (first arg) handles exception then execute my handle block (second arg), otherwise forward this message to the next handler context.  If none left, execute exception's defaultAction (see nil>>handleSignal:)."

	(self exceptionClass handles: exception)
		ifFalse: [ ^ self nextHandlerContext handleSignal: exception ].
	self evaluateSignal: exception
]

{
	#category : #query,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>hasContext: aContext  [
	"Answer whether aContext is me or one of my senders"

	^ (self findContextSuchThat: [ :context | context == aContext ]) notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>hasInstVarRef [
	"Answer whether the receiver references an instance variable."

	^self method hasInstVarRef.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>hasMethodReturn [
	^closureOrNil hasMethodReturn
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>hasSender: context  [
	"Answer whether the receiver is strictly above context on the stack."

	| senderContext |
	self == context 
		ifTrue: [^false].
	senderContext := sender.
	[senderContext == nil]
		whileFalse: [
			senderContext == context
				ifTrue: [^true].
			senderContext := senderContext sender].
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>home  [
	"Answer the context in which the receiver was defined."

	closureOrNil == nil ifTrue:
		[^self].
	^closureOrNil outerContext home
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>insertSender: aContext [
	"Insert aContext and its sender chain between me and my sender.  Return new callee of my original sender."

	| context |
	context := aContext bottomContext.
	context privSender: self sender.
	self privSender: aContext.
	^ context
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>instVarAt: index put: value [
	index = 3 
		ifTrue: [
			self stackp: value. 
			^ value].
	^ super instVarAt: index put: value
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>isBlockContext [
	"Is this executing a block versus a method?  In the new closure
	 implemetation this is true if closureOrNil is not nil, in which case
	 it should be holding a BlockClosure."

	^closureOrNil isClosure
]

{
	#category : #query,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>isBottomContext [
	"Answer if this is the last context (the first context invoked) in my sender chain"

	^sender isNil
]

{
	#category : #query,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>isContext [
	^true
]

{
	#category : #query,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>isDead [
	"Has self finished"

	^ pc isNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>isExecutingBlock [
	"for compatibility"
	^self isBlockContext 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>isFailToken: anObject [
	^ (self objectClass: anObject) == Array 
			and: [ anObject size = 2 and: [(anObject at: 1) == PrimitiveFailToken]]
]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>isHandlerContext [
	"is this context for #on:do:?"
	^self isHandlerOrSignalingContext and: [ self selector == #on:do: ]
]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>isHandlerOrSignalingContext [
	"Both BlockClosure>>on:do: (handler) and Context>>evaluateSignal: (signaling) 
	are marked with primitive 199."
	^method primitive = 199
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>isPrimFailToken: anObject [
	^ (self objectClass: anObject) == Array
		  and: [anObject size = 2
		  and: [anObject first == PrimitiveFailToken]]
]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>isUnwindContext [
	"is this context for  method that is marked?"
	^method primitive = 198
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>jump [
	"Abandon thisContext and resume self instead (using the same current process).  You may want to save thisContext's sender before calling this so you can jump back to it.
	Self MUST BE a top context (ie. a suspended context or a abandoned context that was jumped out of).  A top context already has its return value on its stack (see Interpreter>>primitiveSuspend and other suspending primitives).
	thisContext's sender is converted to a top context (by pushing a nil return value on its stack) so it can be jump back to."

	| top |
	"Make abandoned context a top context (has return value (nil)) so it can be jumped back to"
	thisContext sender push: nil.

	"Pop self return value then return it to self (since we jump to self by returning to it)"
	stackp = 0 ifTrue: [self stepUntilSomethingOnStack].
	stackp = 0 ifTrue: [self push: nil].  "must be quick return self/constant"
	top := self pop.
	thisContext privSender: self.
	^ top
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>jump: distance  [
	"Simulate the action of a 'unconditional jump' bytecode whose offset is 
	the argument, distance."

	pc := pc + distance
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>jump: distance if: condition  [
	"Simulate the action of a 'conditional jump' bytecode whose offset is the 
	argument, distance, and whose condition is the argument, condition."

	| bool |
	bool := self pop.
	(bool == true or: [bool == false]) ifFalse: [
		^self
			send: #mustBeBoolean
			to: bool
			with: {}
			super: false].
	(bool eqv: condition) ifTrue: [self jump: distance]
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>longStack [
	"Answer a String showing the top 100 contexts on my sender chain."

	^ String streamContents: [ :stream |
		(self stackOfSize: 100) do: [ :item | 
			stream print: item; cr ]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>method [

	^method
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>methodClass  [
	"Answer the class in which the receiver's method was found."
	
	^self method methodClass ifNil:[self receiver class].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>methodNode [
	^ self method methodNode.
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>methodReturnConstant: value [
	"Simulate the action of a 'return constant' bytecode whose value is the
	 argument, value. This corresponds to a source expression like '^0'."

	^self return: value from: self methodReturnContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>methodReturnContext [
	"Answer the context from which an ^-return should return from."

	closureOrNil == nil ifTrue:
		[^self].
	^closureOrNil outerContext methodReturnContext
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>methodReturnReceiver [
	"Simulate the action of a 'return receiver' bytecode. This corresponds to
	 the source expression '^self'."

	^self return: self receiver from: self methodReturnContext
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>methodReturnTop [
	"Simulate the action of a 'return top of stack' bytecode. This corresponds
	 to source expressions like '^something'."

	^self return: self pop from: self methodReturnContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>methodSelector [
	^ self method selector
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>namedTempAt: index [
	"Answer the value of the temp at index in the receiver's sequence of tempNames."
	^self debuggerMap namedTempAt: index in: self
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>namedTempAt: index put: aValue [
	"Set the value of the temp at index in the receiver's sequence of tempNames.
	 (Note that if the value is a copied value it is also set out along the lexical chain,
	  but alas not in along the lexical chain.)."
	^self debuggerMap namedTempAt: index put: aValue in: self
]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>nextHandlerContext [

	^ self sender findNextHandlerContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>numArgs [
	"Answer the number of arguments for this activation."
	^closureOrNil
		ifNil: [method numArgs]
		ifNotNil: [closureOrNil numArgs]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>numTemps [
	"Answer the number of temporaries for this activation; this includes
	 the number of arguments, and for blocks, the number of copied values."
	^closureOrNil
		ifNil: [method numTemps]
		ifNotNil: [closureOrNil numTemps]
]

{
	#category : #'mirror primitives',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>object: anObject basicAt: index  [
	"Answer the value of an indexable element in the argument anObject without sending
	 it a message. Fail if the argument index is not an Integer or is out of bounds, or if
	 anObject is not indexable. This mimics the action of the VM when it indexes an object.
	 Used to simulate the execution machinery by, for example, the debugger.
	 Primitive.  See Object documentation whatIsAPrimitive."

	<primitive: 60>
	index isInteger ifTrue: [self errorSubscriptBounds: index].
	index isNumber
		ifTrue: [^self object: anObject basicAt: index asInteger]
		ifFalse: [self errorNonIntegerIndex]
]

{
	#category : #'mirror primitives',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>object: anObject basicAt: index put: value  [
	"Store the last argument 
	 value in the indexable element of the argument anObject indicated by index without sending
	 anObject a message. Fail if the argument index is not an Integer or is out of bounds, or if
	 anObject is not indexable, or if value is an inappropriate value for anObject's indexable slots.
	 This mimics the action of the VM when it indexes an object.
	 Used to simulate the execution machinery by, for example, the debugger.
	 Primitive.  See Object documentation whatIsAPrimitive."

	<primitive: 61>
	index isInteger
		ifTrue: [(index >= 1 and: [index <= (self objectSize: anObject)])
					ifTrue: [self errorImproperStore]
					ifFalse: [self errorSubscriptBounds: index]].
	index isNumber
		ifTrue: [^self object: anObject basicAt: index asInteger put: value]
		ifFalse: [self errorNonIntegerIndex]
]

{
	#category : #'mirror primitives',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>object: anObject eqeq: anOtherObject  [
	"Answer whether the first and second arguments are the same object (have the
	 same object pointer) without sending a message to the first argument.  This
	 mimics the action of the VM when it compares two object pointers.  Used to
	 simulate the execution machinery by, for example, the debugger.
	 Primitive.  See Object documentation whatIsAPrimitive."

	<primitive: 110>
	self primitiveFailed
]

{
	#category : #'mirror primitives',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>object: anObject instVarAt: anIndex [
	"Primitive. Answer a fixed variable in an object. The numbering of the 
	 variables corresponds to the named instance variables. Fail if the index 
	 is not an Integer or is not the index of a fixed variable. Essential for the
	 debugger. See  Object documentation whatIsAPrimitive."

	<primitive: 73>
	"Access beyond fixed variables."
	^self object: anObject basicAt: anIndex - (self objectClass: anObject) instSize
]

{
	#category : #'mirror primitives',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>object: anObject instVarAt: anIndex put: aValue  [
	"Primitive. Store a value into a fixed variable in the argument anObject.
	 The numbering of the variables corresponds to the named instance
	 variables.  Fail if the index is not an Integer or is not the index of a
	 fixed variable.  Answer the value stored as the result. Using this
	 message violates the  principle that each object has sovereign control
	 over the storing of values into its instance variables. Essential for the
	 debugger. See Object documentation whatIsAPrimitive."

	<primitive: 74>
	"Access beyond fixed fields"
	^self object: anObject basicAt: anIndex - (self objectClass: anObject) instSize put: aValue
]

{
	#category : #'mirror primitives',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>object: anObject perform: selector withArguments: argArray inClass: lookupClass [
	"Send the selector, aSymbol, to anObject with arguments in argArray.
	 Fail if the number of arguments expected by the selector 
	 does not match the size of argArray, or if lookupClass
	 cannot be found among the anObject's superclasses.
	 Primitive. Essential for the debugger."

	<primitive: 100 error: error>
	(selector isSymbol) ifFalse:
		[^self error: 'selector argument must be a Symbol'].
	(argArray isMemberOf: Array) ifFalse:
		[^self error: 'argArray must be an Array'].
	(selector numArgs = argArray size)
		ifFalse: [^self error: 'incorrect number of arguments'].
	((self objectClass: anObject) == lookupClass
	 or: [(self objectClass: anObject) inheritsFrom: lookupClass]) ifFalse:
		[^self error: 'lookupClass is not in anObject''s inheritance chain'].
	self primitiveFailed
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>objectClass: aReceiver [
	<primitive: 111>
	self primitiveFailed
]

{
	#category : #'mirror primitives',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>objectSize: anObject [
	"Answer the number of indexable variables in the argument anObject without sending
	 it a message. This mimics the action of the VM when it fetches an object's variable size.
	 Used to simulate the execution machinery by, for example, the debugger.
	 Primitive.  See Object documentation whatIsAPrimitive."

	<primitive: 62>
	"The number of indexable fields of fixed-length objects is 0"
	^0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>outerContext [
	"Answer the context within which the receiver is nested."

	^closureOrNil ifNotNil:
		[closureOrNil outerContext]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>outerMostContext [
	^ self outerContext 
		ifNil: [ self ]
		ifNotNil: [ self outerContext ]
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>pop [
	"Answer the top of the receiver's stack and remove the top of the stack."
	| value |
	value := self at: stackp.
	self stackp: stackp - 1.
	^ value
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>popIntoLiteralVariable: value  [
	"Simulate the action of bytecode that removes the top of the stack and 
	stores it into a literal variable of my method."

	value value: self pop
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>"protocol: instruction decoding"
popIntoReceiverVariable: offset  [
	"Simulate the action of bytecode that removes the top of the stack and 
	stores it into an instance variable of my receiver."

	self object: self receiver instVarAt: offset + 1 put: self pop
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>popIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex [
	"Simulate the action of bytecode that removes the top of the stack and  stores
	 it into an offset in one of my local variables being used as a remote temp vector."

	(self at: tempVectorIndex + 1) at: remoteTempIndex + 1 put: self pop
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>popIntoTemporaryVariable: offset  [
	"Simulate the action of bytecode that removes the top of the stack and 
	stores it into one of my temporary variables."

	self at: offset + 1 put: self pop
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>print: anObject on: aStream [
	"Safely print anObject in the face of direct ProtoObject subclasses"
	| title |
	(anObject class canUnderstand: #printOn:)
		ifTrue: [ ^ anObject printOn: aStream ].
	title := anObject class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>printDebugOn: aStream	 [
	"print a condensed for of the stack.
		For methods simply print Class >> selector
		For blocks only print the first line"
	| blockSource blockSourceSize |
	
	self printOn: aStream.
	self outerContext ifNil: [ ^ self ].
	"print the block..."
	aStream 
		nextPutAll: ' in Block: '.
	
	blockSource := closureOrNil printStringLimitedTo: 50.
	blockSourceSize := blockSource size.
	blockSource := blockSource copyUpTo: Character cr.
	
	aStream nextPutAll: blockSource.
	blockSource size < blockSourceSize
		ifTrue: [ aStream nextPutAll: '...' ].
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>printDetails: stream [
	"Put my class>>selector and instance variables and arguments and temporaries on the stream.  Protect against errors during printing."

	| errorMessage string |
	self printOn: stream.
	stream cr.
	stream tab; nextPutAll: 'Receiver: '.
	errorMessage := '<<error during printing>>'.
	stream nextPutAll: ([receiver printStringLimitedTo: 90] ifError: [errorMessage]).

	stream cr; tab; nextPutAll: 'Arguments and temporary variables: '; cr.
	string := [(self tempsAndValuesLimitedTo: 80 indent: 2) 
				padRightTo:1 with: $x] ifError: [errorMessage].
	stream nextPutAll: (string allButLast).

	stream cr; tab; nextPutAll: 'Receiver''s instance variables: '; cr.
	receiver class allInstVarNames isEmpty ifTrue: [ 
		stream nextPutAll: ([receiver printStringLimitedTo: 90] ifError: [ errorMessage ]).
	] ifFalse: [
		[receiver longPrintOn: stream limitedTo: 80 indent: 2] ifError: [ stream nextPutAll: errorMessage ].
	].
	stream cr
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>printOn: aStream [
	self outerContext
		ifNil:
			[ | selector class mclass |
			self method == nil
				ifTrue: [ ^ super printOn: aStream ].
			class := self receiver class.
			mclass := self methodClass.
			selector := self selector ifNil: [ self method defaultSelector ].
			aStream nextPutAll: class name.
			mclass == class
				ifFalse:
					[ aStream nextPut: $(.
					aStream nextPutAll: mclass name.
					aStream nextPut: $) ].
			aStream nextPutAll: '>>'.
			aStream nextPutAll: selector.
			selector = #doesNotUnderstand:
				ifTrue:
					[ aStream space.
					(self tempAt: 1) selector printOn: aStream ] ]
		ifNotNil:
			[ :outerContext | 
			aStream nextPutAll: closureOrNil printString , ' in '.
			outerContext printOn: aStream ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>privRefresh [
	"Reinitialize the receiver so that it is in the state it was at its creation."
	 closureOrNil
		ifNotNil:
			[pc := closureOrNil startpc.
			self stackp: closureOrNil numArgs + closureOrNil numCopiedValues.
			1 to: closureOrNil numCopiedValues do:
				[:i | self tempAt: closureOrNil numArgs + i put: (closureOrNil at: i)]]
		ifNil:
			[pc := method initialPC.
			self stackp: method numTemps.
			method numArgs+1 to: method numTemps do:
				[:i | self tempAt: i put: nil]]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>privRefreshWith: aCompiledMethod  [
	"Reinitialize the receiver as though it had been for a different method. 
	 Used by a Debugger when one of the methods to which it refers is 
	 recompiled."

	aCompiledMethod isCompiledMethod ifFalse:
		[self error: 'method can only be set to aCompiledMethod'].
	method := aCompiledMethod.
	[closureOrNil == nil] assert.
	"was: receiverMap := nil."
	self privRefresh
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>privSender: aContext  [

	sender := aContext
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>push: value  [
	"Push value on the receiver's stack."

	self stackp: stackp + 1.
	self at: stackp put: value
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>pushActiveContext [
	"Simulate the action of bytecode that pushes the the active context on the 
	top of its own stack."

	self push: self
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>pushActiveProcess [
	"Simulate the action of bytecode that pushes the the active Process on the 
	top of its own stack."

	self push: Processor activeProcess
]

{
	#category : #'system simulation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>pushArgs: arguments from: senderContext [
	"Helps simulate action of the value primitive for closures.
	 This is used by Context>>runSimulated:contextAtEachStep:"

	closureOrNil
		ifNil: [self error: 'context needs a closure!']
		ifNotNil: [
			"See BlockClosure>>asContextWithSender:"
			 stackp ~= (closureOrNil numArgs + closureOrNil numCopiedValues) 
				ifTrue: [ self error: 'stack pointer is incorrect!' ]].

	1 to: closureOrNil numArgs do: [:i |
		self at: i put: (arguments at: i)].
	sender := senderContext
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>pushClosureCopyNumCopiedValues: numCopied numArgs: numArgs blockSize: blockSize [
	"Simulate the action of a 'closure copy' bytecode whose result is the
	 new BlockClosure for the following code"
	| copiedValues |
	numCopied > 0
		ifTrue: [
			copiedValues := Array new: numCopied.
			numCopied to: 1 by: -1 do: [ :i |
				copiedValues at: i put: self pop ]]
		ifFalse: [ copiedValues := nil ].
	self push: (BlockClosure
				outerContext: self
				startpc: pc
				numArgs: numArgs
				copiedValues: copiedValues).
	self jump: blockSize
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>pushClosureTemps: numTemps [
	numTemps timesRepeat: [ self push: nil ]
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>pushConsArrayWithElements: numElements  [
	| array |
	array := Array new: numElements.
	numElements to: 1 by: -1 do: [ :i |
		array at: i put: self pop ].
	self push: array
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>pushConstant: value  [
	"Simulate the action of bytecode that pushes the constant, value, on the 
	top of the stack."

	self push: value
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>pushFullClosure: compiledBlock numCopied: numCopied receiverOnStack: onStack ignoreOuterContext: ignore [
	| copiedValues cls |
	copiedValues := (1 to: numCopied) collect: [ :i | self pop ].
	self push: (cls := (FullBlockClosure new: numCopied) 
		outerContext: (ignore ifFalse: [self]);
		receiver: (onStack ifTrue: [ self pop ] ifFalse: [ receiver ]);
		numArgs: compiledBlock numArgs;
		compiledBlock: compiledBlock;
		yourself).
	copiedValues size to: 1 by: -1 do: [ :i |
		 cls at: copiedValues size - i + 1 put: (copiedValues at: i) ]
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>pushLiteralVariable: value  [
	"Simulate the action of bytecode that pushes the contents of the literal 
	variable whose index is the argument, index, on the top of the stack."

	self push: value value
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>pushNewArrayOfSize: arraySize  [
	self push: (Array new: arraySize)
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>pushReceiver [
	"Simulate the action of bytecode that pushes the active context's receiver 
	on the top of the stack."

	self push: self receiver
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>"protocol: instruction decoding"
pushReceiverVariable: offset  [
	"Simulate the action of bytecode that pushes the contents of the receiver's 
	instance variable whose index is the argument, index, on the top of the 
	stack."

	self push: (self object: self receiver instVarAt: offset + 1)
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex [
	"Simulate the action of bytecode that pushes the value at remoteTempIndex
	 in one of my local variables being used as a remote temp vector."
	self push: ((self at: tempVectorIndex + 1) at: remoteTempIndex + 1)
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>pushTemporaryVariable: offset  [
	"Simulate the action of bytecode that pushes the contents of the 
	temporary variable whose index is the argument, index, on the top of 
	the stack."

	self push: (self at: offset + 1)
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>"protocol: controlling"
quickSend: selector to: aReceiver with: arguments super: superFlag [
	"Send the given selector with arguments in an environment which closely resembles the non-simulating environment, with an interjected unwind-protected block to catch nonlocal returns.
	Attention: don't get lost!"
	| lookupClass contextToReturnTo result |
	contextToReturnTo := self.
	lookupClass := superFlag
					ifTrue: [(self method literalAt: self method numLiterals) value superclass]
					ifFalse: [self objectClass: aReceiver].
	[ | oldSender |
	oldSender := thisContext sender swapSender: self.
	result := self object: aReceiver perform: selector withArguments: arguments inClass: lookupClass.
	thisContext sender swapSender: oldSender] ifCurtailed: [
		contextToReturnTo := thisContext sender receiver.	"The block context returning nonlocally"
		contextToReturnTo jump: -1.	"skip to front of return bytecode causing this unwind"
		contextToReturnTo nextByte = 16r7C ifTrue: [
			"If it was a returnTop, push the value to be returned.
			Otherwise the value is implicit in the bytecode"
			contextToReturnTo push: (thisContext sender tempAt: 1)].
		thisContext swapSender: thisContext home sender.	"Make this block return to the method's sender"
		contextToReturnTo].
	contextToReturnTo push: result.
	^contextToReturnTo
]

{
	#category : #'system simulation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>quickStep [
	"If the next instruction is a send, just perform it.
	Otherwise, do a normal step."

	self willSend ifTrue: [ QuickStep := self ].
	^self step
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>receiver  [

	^receiver
]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>receiver: anObject [

	receiver := anObject
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>release [
	"Remove information from the receiver and all of the contexts on its 
	sender chain in order to break circularities."

	self releaseTo: nil
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>releaseTo: caller  [
	"Remove information from the receiver and the contexts on its sender 
	chain up to caller in order to break circularities."

	| contex senderContext |
	contex := self.
	[ contex == nil or: [ contex == caller ]]
		whileFalse: [
			senderContext := contex sender.
			contex singleRelease.
			contex := senderContext ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>removeSelf [
	"Nil the receiver pointer and answer its former value."

	| tempSelf |
	tempSelf := receiver.
	receiver := nil.
	^tempSelf
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>respondsToUnknownBytecode [
	"This method is triggerred by the VM when the interpreter tries to execute an unknown bytecode"
	
	| unknownBytecode |
	unknownBytecode := self method at: self pc.
	self error: 'VM cannot run unknown bytecode ', unknownBytecode printString
	

]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>restart [
	"Unwind thisContext to self and resume from beginning.  Execute unwind blocks when unwinding.  ASSUMES self is a sender of thisContext"

	| context unwindBlock |
	self isDead ifTrue: [self cannotReturn: nil to: self].
	self privRefresh.
	context := thisContext.
	[	context := context findNextUnwindContextUpTo: self.
		context isNil 
	] whileFalse: [
		context unwindComplete ifNil:[
			context unwindComplete: true.
			unwindBlock := context unwindBlock.
			thisContext terminateTo: context.
			unwindBlock value ]].
	
	thisContext terminateTo: self.
	self jump.

]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>restartWithNewReceiver: obj [

	self
		swapReceiver: obj;
		restart
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>resume [
	"Roll back thisContext to self and resume.  Execute unwind blocks when rolling back.  ASSUMES self is a sender of thisContext"

	self resume: nil
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>resume: value [
	"Unwind thisContext to self and resume with value as result of last send.  Execute unwind blocks when unwinding.  ASSUMES self is a sender of thisContext"
	
	self resume: value through: (thisContext findNextUnwindContextUpTo: self)
	
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>resume: value through: firstUnwindContext [
	"Unwind thisContext to self and resume with value as result of last send.
	 Execute any unwind blocks while unwinding.
	 ASSUMES self is a sender of thisContext."

	| context unwindBlock |
	self isDead 
		ifTrue: [ self cannotReturn: value to: self ].
	context := firstUnwindContext.
	[ context isNil ] whileFalse: [	
		context unwindComplete ifNil:[
			context unwindComplete: true.
			unwindBlock := context unwindBlock.
			thisContext terminateTo: context.
			unwindBlock value].
		context := context findNextUnwindContextUpTo: self].
	thisContext terminateTo: self.
	^value

]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>return [
	"Unwind until my sender is on top"

	self return: self receiver
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>return: value [
	"Unwind thisContext to self and return value to self's sender.  Execute any unwind blocks while unwinding.  ASSUMES self is a sender of thisContext"

	sender ifNil: [^self cannotReturn: value to: sender].
	sender resume: value
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>return: value from: aSender  [
	"For simulation.  Roll back self to aSender and return value from it.  Execute any unwind blocks on the way.  ASSUMES aSender is a sender of self"

	| newTop context |
	aSender isDead ifTrue: [
		^ self send: #cannotReturn: to: self with: {value} super: false ].
	newTop := aSender sender.
	context := self findNextUnwindContextUpTo: newTop.
	context ifNotNil: [
		^ self send: #aboutToReturn:through: to: self with: {value. context} super: false] .
	self releaseTo: newTop.
	newTop ifNotNil: [ newTop push: value ].
	^ newTop

]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>return: value through: firstUnwindContext [
	"Unwind thisContext to self and return value to self's sender.
	 Execute any unwind blocks while unwinding.
	 ASSUMES self is a sender of thisContext."

	sender ifNil: [self cannotReturn: value to: sender].
	sender resume: value through: firstUnwindContext
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>return: value to: aSender [
	"Simulate the return of value to aSender."

	self releaseTo: aSender.
	aSender ifNil: [^ nil].
	^ aSender push: value
]

{
	#category : #'system simulation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>runSimulated: aBlock contextAtEachStep: block2 [
	"Simulate the execution of the argument, aBlock, until it ends. aBlock 
	MUST NOT contain an '^'. Evaluate block2 with the current context 
	prior to each instruction executed. Answer the simulated value of aBlock."
	| current returnContext exception |
	
	aBlock hasMethodReturn
		ifTrue: [ self error: 'simulation of blocks with ^ can run loose' ].
		
	current := [ aBlock
					on: Exception
					do: [ :ex | SimulationExceptionWrapper signalForException: ex  ] ] asContext.
	
	returnContext := Context
			sender: nil
			receiver: self home receiver
			method: self home method
			arguments: self home arguments.
	
	current pushArgs: Array new from: returnContext.
	
	[current == returnContext]
		whileFalse: [ 
			block2 value: current.
			current := current step ].
	
	exception := returnContext pop.
	exception class == SimulationExceptionWrapper
		ifTrue: [ ^ exception exception signal ].
	^ exception
	
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>runUntilErrorOrReturnFrom: aSender  [
	"ASSUMES aSender is a sender of self.  Execute self's stack until aSender returns or an unhandled exception is raised.  Return a pair containing the new top context and a possibly nil exception.  The exception is not nil if it was raised before aSender returned and it was not handled.  The exception is returned rather than openning the debugger, giving the caller the choice of how to handle it."
	"Self is run by jumping directly to it (the active process abandons thisContext and executes self).  However, before jumping to self we insert an ensure block under aSender that jumps back to thisContext when evaluated.  We also insert an exception handler under aSender that jumps back to thisContext when an unhandled exception is raised.  In either case, the inserted ensure and exception handler are removed once control jumps back to thisContext."

	| error context here topContext |
	here := thisContext.

	"Insert ensure and exception handler contexts under aSender"
	error := nil.
	context := aSender insertSender: (Context
		contextOn: UnhandledError, Halt do: [:ex |
			error ifNil: [
				"this is ugly but it fixes the side-effects of not sending an Unhandled error on Halt"
				error := (ex isKindOf: Halt) ifTrue: [ ex ] ifFalse: [ ex exception ].
				topContext := thisContext.
				ex resumeUnchecked: here jump ]
			ifNotNil: [ ex pass ]]).
	context := context insertSender: (Context
		contextEnsure: [error ifNil: [
				topContext := thisContext.
				here jump]
		]).
	self jump.  "Control jumps to self"

	"Control resumes here once above ensure block or exception handler is executed"
	^ error ifNil: [
		"No error was raised, remove ensure context by stepping until popped"
		[context isDead] whileFalse: [topContext := topContext stepToCallee].
		{topContext. nil}

	] ifNotNil: [
		"Error was raised, remove inserted above contexts then return signaler context"
		aSender terminateTo: context sender.  "remove above ensure and handler contexts"
		{topContext. error}
	].

]

{
	#category : #query,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>secondFromBottom [
	"Return the second from bottom of my sender chain"

	self sender ifNil: [ ^ nil ].
	^ self findContextSuchThat: [ :context |
		context sender sender isNil]
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>selector [
	"Answer the selector of the method that created the receiver."

	^self method selector ifNil: [self method defaultSelector].
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>send: selector super: superFlag numArgs: numArgs [
	"Simulate the action of bytecodes that send a message with selector, 
	selector. The argument, superFlag, tells whether the receiver of the 
	message was specified with 'super' in the source method. The arguments 
	of the message are found in the top numArgs locations on the stack and 
	the receiver just below them."

	| currentReceiver arguments  |
	arguments := Array new: numArgs.
	numArgs to: 1 by: -1 do: [ :i | 
		arguments at: i put: self pop ].
	currentReceiver := self pop.
"	selector == #doPrimitive:method:receiver:args:
		ifTrue: [answer := receiver 
					doPrimitive: (arguments at: 1)
					method: (arguments at: 2)
					receiver: (arguments at: 3)
					args: (arguments at: 4).
				self push: answer.
				^self]. "
	QuickStep == self ifTrue: [
		QuickStep := nil.
		^ self quickSend: selector to: currentReceiver with: arguments super: superFlag].
	^ self send: selector to: currentReceiver with: arguments super: superFlag
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>send: selector to: rcvr with: arguments lookupIn: lookupClass [
	"Simulate the action of sending a message with selector and arguments
	 to rcvr. The argument, lookupClass, is the class in which to lookup the
	 message.  This is the receiver's class for normal messages, but for super
	 messages it will be some specific class related to the source method."

	| meth primIndex val ctxt |
	(meth := lookupClass lookupSelector: selector) ifNil:
		[^self send: #doesNotUnderstand:
				to: rcvr
				with: {Message selector: selector arguments: arguments}
				lookupIn: lookupClass].
	(primIndex := meth primitive) > 0 ifTrue:
		[val := self doPrimitive: primIndex method: meth receiver: rcvr args: arguments.
		 (self isPrimFailToken: val) ifFalse:
			[^val]].
	(selector == #doesNotUnderstand: and: [lookupClass == ProtoObject]) ifTrue:
		[^self error: 'Simulated message ', arguments first selector, ' not understood'].
	ctxt := Context sender: self receiver: rcvr method: meth arguments: arguments.
	primIndex > 0 ifTrue:
		[ctxt failPrimitiveWith: val].
	^ctxt
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>send: selector to: aReceiver with: arguments super: superFlag  [
	"Simulate the action of sending a message with selector, selector, and 
	arguments, args, to receiver. The argument, superFlag, tells whether the 
	receiver of the message was specified with 'super' in the source method."

	| class aMethod value context |
	class := superFlag
			ifTrue: [(self method literalAt: self method numLiterals) value superclass]
			ifFalse: [self objectClass: aReceiver].
	aMethod := class lookupSelector: selector.
	aMethod == nil
		ifTrue: [ ^ self
				send: #doesNotUnderstand:
				to: aReceiver
				with: (Array with: (Message selector: selector arguments: arguments))
				super: superFlag ].
	aMethod isCompiledMethod
		ifFalse: [ ^ self
				send: #run:with:in:
				to: aMethod
				with: (Array with: selector with: arguments with: aReceiver)
				super: superFlag ].
	
	value := self tryPrimitiveFor: aMethod receiver: aReceiver args: arguments.

	"primitive runs without failure?"
	(self isFailToken: value) ifFalse: [^ value].
	
	(selector == #doesNotUnderstand: and: [ (class canUnderstand: #doesNotUnderstand: ) not ]) 
		ifTrue: [
			^self error: 'Simulated message ', (arguments at: 1) selector, ' not understood'].
	
	"failure.. lets activate the method"
	context := self activateMethod: aMethod withArgs: arguments receiver: aReceiver class: class.
	
	"check if activated method handles the error code (a first bytecode will be store into temp)"
	"long store temp" 
	 (context method at: context pc ) = 129 
		ifTrue: [ context at: context stackPtr put: value last ].
	^ context
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>sender [
	"Answer the context that sent the message that created the receiver."

	^sender
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>setNamedPrimitiveInformationFrom: fromMethod toMethod: toMethod [
	"For named primitives, the first literal contains a special object that has information of the primitive. Example:
(StandardFileStream >> #primOpen:writable:) literalAt: 1 ----->>>>   #(#FilePlugin #primitiveFileOpen 0 147).
In this method we cope such information from one to another one."
	| spec |	
	spec := toMethod literalAt: 1.	
	spec replaceFrom: 1 to: spec size with: (fromMethod literalAt: 1) startingAt: 1.
	

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>setSender: newSender receiver: newReceiver method: newMethod arguments: arguments  [
	"Create the receiver's initial state."

	sender := newSender.
	receiver := newReceiver.
	method := newMethod.
	closureOrNil := nil.
	pc := method initialPC.
	self stackp: method numTemps.
	1 to: arguments size do: [ :i | 
		self at: i put: (arguments at: i)]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>setSender: newSender receiver: newReceiver method: newMethod closure: newClosure startpc: startpc [
	"Create the receiver's initial state."

	sender := newSender.
	receiver := newReceiver.
	method := newMethod.
	closureOrNil := newClosure.
	pc := startpc.
	stackp := 0
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>shortDebugStack [
	"Answer a String showing the top ten contexts on my sender chain."

	^ String streamContents: [ :stream | self debugStack: 10 on: stream ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>shortDebugStackOn: aStream [
	"print the top 30 contexts on my sender chain."

	^ self debugStack: 30 on: aStream
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>shortStack [
	"Answer a String showing the top ten contexts on my sender chain."

	^ String streamContents: [ :stream |
		(self stackOfSize: 10) do: [ :item |
			stream print: item; cr]]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>simulatePrimitive: primitiveIndex in: aMethod receiver: aReceiver arguments: arguments [
	| key simulator |
	
	key := primitiveIndex = 117 
		ifTrue: [ | literal |
			literal := aMethod literalAt: 1.
			"primitive name, module name"
			{literal second. literal first}] 
		ifFalse: [ primitiveIndex ].
	
	simulator := self class specialPrimitiveSimulators at: key ifAbsent: [
		 "named primitives"
		^  primitiveIndex = 117
				ifTrue: [
					self withoutPrimitiveTryNamedPrimitiveIn: aMethod for: aReceiver withArgs: arguments.
					"this uses primitive 218, which doesn't works as expected... 
					self tryNamedPrimitiveIn: method for: receiver withArgs: arguments " ]
				ifFalse: [ aReceiver tryPrimitive: primitiveIndex withArgs: arguments ]]. 
	
	^ simulator 
		simulatePrimitiveFor: aMethod
		receiver: aReceiver
		arguments: arguments
		context: self
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>singleRelease [
	"Remove information from the receiver in order to break circularities."

	stackp ifNotNil: [
		1 to: stackp do: [ :i |
			self at: i put: nil ]].
	sender := nil.
	pc := nil.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>size [
	"Primitive. Answer the number of indexable variables in the receiver. 
	This value is the same as the largest legal subscript. Essential. See Object 
	documentation whatIsAPrimitive.  Override the default primitive to give latitude to
	 the VM in context management."

	<primitive: 212>
	"The number of indexable fields of fixed-length objects is 0"
	^self primitiveFail
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>sourceCode [
	^self method sourceCode.
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>stack  [
	"Answer an Array of the contexts on the receiver's sender chain."

	^self stackOfSize: 9999
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>stackOfSize: limit  [
	"Answer an OrderedCollection of the top 'limit' contexts
	 on the receiver's sender chain."

	| stack context |
	stack := OrderedCollection new.
	stack addLast: (context := self).
	[(context := context sender) ~~ nil
	 and: [stack size < limit]] whileTrue: [
		stack addLast: context ].
	^ stack
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>stackPtr   [
	"For use only by the SystemTracer and the Debugger, Inspectors etc"
	^ stackp
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>stackp: newStackp [
	"Storing into the stack pointer is a potentially dangerous thing.
	This primitive stores nil into any cells that become accessible as a result,
	and it performs the entire operation atomically."
	"Once this primitive is implemented, failure code should cause an error"

	<primitive: 76>
	self error: 'stackp store failure'.
"
	stackp == nil ifTrue: [stackp := 0].
	newStackp > stackp  'effectively checks that it is a number'
		ifTrue: [oldStackp := stackp.
				stackp := newStackp.
				'Nil any newly accessible cells'
				oldStackp + 1 to: stackp do: [:i | self at: i put: nil]]
		ifFalse: [stackp := newStackp]
"
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>startpc [
	^closureOrNil
		ifNil:	[self method initialPC]
		ifNotNil: [closureOrNil startpc]
]

{
	#category : #'system simulation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>step [
	"Simulate the execution of the receiver's next bytecode. Answer the 
	context that would be the active context after this bytecode."

	^self interpretNextInstructionFor: self
]

{
	#category : #'system simulation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>stepToCallee [
	"Step to callee or sender"

	| context |
	context := self.
	[ (context := context step) == self ] whileTrue.
	^ context
]

{
	#category : #'system simulation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>stepToHome: aContext  [
	"Resume self until the home of top context is aContext.  Top context may be a block context."

	| home ctxt here error topContext context |
	
	here := thisContext.
	ctxt := self step.
	ctxt = self ifFalse: [ 
		"Insert ensure and exception handler contexts under aSender"
		error := nil.
		context := aContext insertSender: (Context
			contextOn: UnhandledError do: [:ex |
				error ifNil: [
					"this is ugly but it fixes the side-effects of not sending an Unhandled error on Halt"
					error := (ex isKindOf: Halt) ifTrue: [ ex ] ifFalse: [ ex exception ].
					topContext := thisContext.
					ex resumeUnchecked: here jump ]
						ifNotNil: [ ex pass ]]).
	].
	home := aContext home.
	home == ctxt home ifTrue: [ ^{ctxt. nil} ].
	
	[ctxt := ctxt step.
	error ifNotNil: [
		"Error was raised, remove inserted above contexts then return signaler context"
			"aContext terminateTo: context sender."  "remove above ensure and handler contexts"
			^ {ctxt. error}].
	
	home == ctxt home] whileFalse: [
		home isDead ifTrue: [^ {ctxt. nil}]
	].

	^ {ctxt. nil}
]

{
	#category : #'system simulation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>stepToSendOrReturn [
	"Simulate the execution of bytecodes until either sending a message or 
	returning a value to the receiver (that is, until switching contexts)."

	| context |
	[ self willSend or: [  self willReturn or: [ self willStore or: [self willCreateBlock ] ] ] ]
		whileFalse: [
			self isDead ifTrue: [ ^ self ].
			context := self step.
			context == self ifFalse: [
				"Caused by mustBeBoolean handling"
				^context ]]
]

{
	#category : #'system simulation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>stepUntilSomethingOnStack [
	"Simulate the execution of bytecodes until either sending a message or 
	returning a value to the receiver (that is, until switching contexts)."

	| context |
	[ stackp = 0 ]
		whileTrue: [
			self isDead ifTrue: [ ^ self ].
			context := self step.
			context == self ifFalse: [
				"Caused by mustBeBoolean handling"
				^context ]]
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>storeIntoLiteralVariable: value  [
	"Simulate the action of bytecode that stores the top of the stack into a 
	literal variable of my method."

	value value: self top
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>"protocol: instruction decoding"
storeIntoReceiverVariable: offset  [
	"Simulate the action of bytecode that stores the top of the stack into an 
	instance variable of my receiver."

	self object: self receiver instVarAt: offset + 1 put: self top
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>storeIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex [
	"Simulate the action of bytecode that stores the top of the stack at
	 an offset in one of my local variables being used as a remote temp vector."

	(self at: tempVectorIndex + 1) at: remoteTempIndex + 1 put: self top
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>storeIntoTemporaryVariable: offset  [
	"Simulate the action of bytecode that stores the top of the stack into one 
	of my temporary variables."

	self at: offset + 1 put: self top
]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>swapReceiver: newReceiver [

	receiver := newReceiver
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>swapSender: coroutine  [
	"Replace the receiver's sender with coroutine and answer the receiver's 
	previous sender. For use in coroutining."

	| oldSender |
	oldSender := sender.
	sender := coroutine.
	^oldSender
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>tempAt: index  [
	"Answer the value of the temporary variable whose index is the 
	 argument, index.  Primitive. Assumes receiver is indexable. Answer the
	 value of an indexable element in the receiver. Fail if the argument index
	 is not an Integer or is out of bounds. Essential. See Object documentation
	 whatIsAPrimitive.  Override the default at: primitive to give latitude to the
	 VM in context management."

	<primitive: 210>
	^self at: index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>tempAt: index put: value  [
	"Store the argument, value, as the temporary variable whose index is the 
	 argument, index.  Primitive. Assumes receiver is indexable. Answer the
	 value of an indexable element in the receiver. Fail if the argument index
	 is not an Integer or is out of bounds. Essential. See Object documentation
	 whatIsAPrimitive.  Override the default at:put: primitive to give latitude to
	 the VM in context management."

	<primitive: 211>
	^self at: index put: value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>tempNamed: aName [
	"Returns the value of the temporaries, aName."

	"Implementation notes: temporary initialization in blocks simply uses pushNil to allocate and initialize each temp.  So if one inspects [|a|a:=2] and sends it self method symbolic you get:

	13 <8F 00 00 05> closureNumCopied: 0 numArgs: 0 bytes 17 to 21
	17 	<73> pushConstant: nil
	18 	<77> pushConstant: 2
	19 	<81 40> storeIntoTemp: 0
	21 	<7D> blockReturn
	22 <7C> returnTop

	And when we check self asContext pc we get 17, which is *before* the nil is pushed. Therefore we should pay attention when querying a temporary if the temporary allocation was executed."

	| index |
	index := self tempNames indexOf: aName.
	^ self namedTempAt: index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>tempNamed: aName put: anObject [
	^self namedTempAt: (self tempNames indexOf: aName) put: anObject
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>tempNames [
	"Answer a SequenceableCollection of the names of the receiver's temporary 
	 variables, which are strings."

	^ self debuggerMap tempNamesForContext: self
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>tempsAndValues [
	"Return a string of the temporary variabls and their current values"
	
	^ String streamContents: [ :aStream |
		self tempNames doWithIndex: [ :title :index |
			 aStream nextPutAll: title; nextPut: $:; space; tab.
			 self print: (self namedTempAt: index) on: aStream.
			 aStream cr ]].
]

{
	#category : #'debugger access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>tempsAndValuesLimitedTo: sizeLimit indent: indent [
	"Return a string of the temporary variabls and their current values"

	^ String streamContents: [ :aStream |
		self tempNames doWithIndex: [ :title :index |
			indent timesRepeat: [ aStream tab ].
			aStream nextPutAll: title; nextPut: $:; space; tab.
			aStream nextPutAll: 
				((self namedTempAt: index) printStringLimitedTo: (sizeLimit -3 -title size max: 1)).
			aStream cr ]].
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>terminate [
	"Make myself unresumable."

	sender := nil.
	pc := nil.

]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>terminateTo: previousContext [
	"Terminate all the Contexts between me and previousContext, if previousContext is on my Context stack. Make previousContext my sender."

	| currentContext sendingContext |
	<primitive: 196>
	(self hasSender: previousContext) ifTrue: [
		currentContext := sender.
		[currentContext == previousContext] whileFalse: [
			sendingContext := currentContext sender.
			currentContext terminate.
			currentContext := sendingContext ]].
	sender := previousContext
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>top [
	"Answer the top of the receiver's stack."

	^self at: stackp
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>tryNamedPrimitiveIn: aCompiledMethod for: aReceiver withArgs: arguments [
	<primitive: 218 error: errorCode>
	errorCode ifNotNil: [
		"If errorCode is an integer other than -1 there was a problem with primitive 218,
		 not with the external primitive itself.  -1 indicates a generic failure (where
		 errorCode should be nil) but errorCode = nil means primitive 218 is not implemented.  So
		 interpret -1 to mean the external primitive failed with a nil error code."
		errorCode isInteger 
			ifTrue: [
				errorCode = -1
					ifTrue: [ errorCode := nil ]
					ifFalse: [ self primitiveFailed ]].
				^  self class primitiveFailTokenFor: errorCode ].
	"Assume a nil error code implies the primitive is not implemented and fall back on the old code."
	
	"The primitive doesn't exist or there was an error. Hence, we follow another solution without the primitive"
	^ self 
		withoutPrimitiveTryNamedPrimitiveIn: aCompiledMethod
		for: aReceiver
		withArgs: arguments

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>tryPrimitiveFor: aMethod receiver: aReceiver args: arguments  [
	"If this method has a primitive index, then run the primitive and return its result.
	Otherwise (and also if the primitive fails) return PrimitiveFailToken,
	as an indication that the method should be activated and run as bytecodes."
	| primIndex |
	(primIndex := aMethod primitive) = 0 
		ifTrue: [ ^ self class primitiveFailToken ].
	^ self doPrimitive: primIndex method: aMethod receiver: aReceiver args: arguments
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>unusedBytecode [
	^ self respondsToUnknownBytecode 
]

{
	#category : #'special context access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>unwindBlock [
	"unwindContext only. access temporaries from BlockClosure>>#ensure: and BlockClosure>>#ifCurtailed:"
	^self tempAt: 1

]

{
	#category : #'special context access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>unwindComplete [
	"unwindContext only. access temporaries from BlockClosure>>#ensure: and BlockClosure>>#ifCurtailed:"
	^self tempAt: 2

]

{
	#category : #'special context access',
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>unwindComplete: aBoolean [
	"unwindContext only. access temporaries from BlockClosure>>#ensure: and BlockClosure>>#ifCurtailed:"
	self tempAt: 2 put: aBoolean

]

{
	#category : #private-exceptions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>unwindTo: aContext [

	| context unwindBlock |
	context := self.
	[ (context := context findNextUnwindContextUpTo: aContext) isNil ] whileFalse: [
		(context unwindComplete) ifNil: [
			context unwindComplete: true.
			unwindBlock := context unwindBlock.
			unwindBlock value ]].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Context>>withoutPrimitiveTryNamedPrimitiveIn: aCompiledMethod for: aReceiver withArgs: arguments [
"When using the debugger we want to run a method step by step. What what happens when we do a step into a CompiledMethod which has a primitive? If such a method is executed form outside the Debugger (normal scenario) the VM knows that such CompiledMethod has a primitive declaration and hence executes it. If it fails then it continues executing all the bytecode of the method. Otherwise, it just returns. 

Now, what is the problem with the Debugger? The problem is that if the primitive fail, we don't want that the VM directly executes all the remaining bytecodes of the method. Instead, we would like to go step by step witht he Debugger, just as happens with normal methods. 

To solve the mentioned problem, we use the following trick: We have the orignal compiled method (the one that has a primitive invokation), the receiver and the arguments. So the idea is to use a template compiled method that ONLY contains the primitive delcaration (it doesn't include all the smalltalk code after the primitive). #tryNamedPrimitiveTemplateMethod answers such a template method which looks like:

tryNamedPrimitive
	<primitive:'' module:''>
	^ Context primitiveFailToken'

 Since this method does not change its bytecodes for every invokation, we can reuse it for all methods with primitives. There are only 2 things we have to change in the template: the number of arguments and the primitive declaration (to use the correct primitive name and module name).

Then what we do is to run that compiled method with the receiver and arguments we have. The result is that we will be invoking almost the same original method but a slighly different version that does not have the smalltalk part after the primitive and that in contrast is sends #primitiveFailToken. If this method invokation does not fail, then the Debugger continues debugging the sender of the primitive method. In this case, the step in is the same as step over. If the primitive fails, then the debugger continues executing the smalltalk part after the primitive method. In this case, step in is a real step in.  "	
	| theMethod  |
	arguments size > 8 
		ifTrue: [ ^ self class primitiveFailToken ].
	theMethod := self class tryNamedPrimitiveTemplateMethod.
	theMethod prepareForSimulationWith: arguments size.
	theMethod == nil 
		ifTrue: [ ^ self class primitiveFailToken ].
	self setNamedPrimitiveInformationFrom: aCompiledMethod toMethod: theMethod.
	theMethod flushCache.
	
	^ theMethod valueWithReceiver: aReceiver arguments: arguments
]
