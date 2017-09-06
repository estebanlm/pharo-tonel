"
I am an instruction in the IR (intermediate representation) language.  The IR serves as the intermediary between the Smalltalk language and the bytecode language.  It is easier to optimize and translate to/from this language than it is to optimize/translate directly from Smalltalk to bytecodes.  The IR is generic and simple consisting of just twelve instructions.  They are:

	goto: labelNum
	if: boolean goto: labelNum1 otherwise: labelNum2
	label: labelNum
	popTop
	pushDup
	pushLiteral: object
	pushTemp: name
	blockReturn
	returnTop
	send: selector
	send: selector toSuperOf: behavior
	storeTemp: name

Each instruction is reified as an instance of one of my subclasses and grouped by basic block (IRSequence) into an IRMethod.  IRInterpreter visits each instruction in a IRMethod responding to the above instruction messages sent to it.

"
Class {
	#name : #IRInstruction,
	#superclass : #Object,
	#instVars : [
		'sourceNode',
		'bytecodeIndex',
		'sequence'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>blockReturnTop [
	^ IRBlockReturnTop new
		
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>createTempVectorNamed: aTempVectorName withVars: anArray   [

	^ IRTempVector new
		name: aTempVectorName;
		vars: anArray;
		yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>popTop [
	^ IRPop new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>pushClosureCopyCopiedValues: copiedValues args: arguments [
	^IRPushClosureCopy new
			copiedValues: copiedValues;
			arguments: arguments;
			yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>pushConsArray: aSize  [
	^IRPushArray new
		size: aSize;
		cons: true;
		yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>pushDup [

	^ IRPushDup new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>pushFullClosureCompiledBlock: compiledBlock copiedValues: copiedValues [
	^IRPushFullClosure new
			copiedValues: copiedValues;
			compiledBlock: compiledBlock;
			yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>pushInstVar: index [

	^ IRPushInstVar new 
			index:  index; 
			yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>pushLiteral: object [

	^ IRPushLiteral new
		literal: object
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>pushLiteralVariable: object [

	^ IRPushLiteralVariable new
		association: object;
		yourself
	 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>pushNewArray: aSize [
	
	^IRPushArray new
		size: aSize;
		cons: false;
		yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>pushReceiver [
	^ IRPushReceiver new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>pushRemoteTemp: aName inVectorAt: nameOfVector [
	^ IRPushRemoteTemp new
		name: aName;
		tempVectorName: nameOfVector;
		yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>pushTemp: aName [
	aName = 'self' ifTrue: [self error: 'use pushReceiver'].
	^ IRPushTemp new
		name: aName;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>pushThisContext [
	^ IRPushThisContext new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>returnTop [

	^ IRReturn new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>send: selector [

	^ IRSend new
		selector: selector
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>send: selector toSuperOf: behavior [

	behavior ifNil: [self error: 'super of nil does not exist'].
	^ IRSend new
		selector: selector;
		superOf: behavior;
		yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>storeInstVar: index [
	^ IRStoreInstVar new 
		index: index; 
		yourself
	
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>storeIntoLiteralVariable: object [

	^ IRStoreLiteralVariable new
		association: object;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>storeRemoteTemp: aName inVectorAt: nameOfVector [
	^ IRStoreRemoteTemp new
		name: aName;
		tempVectorName: nameOfVector;
		yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction class>>storeTemp: aName [
	^ IRStoreTemp new
		name: aName;
		yourself

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>accept: aVisitor [
	self subclassResponsibility
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>addInstructionsAfter: aCollection [
	sequence addInstructions: aCollection after: self.
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>addInstructionsBefore: aCollection [
	sequence addInstructions: aCollection before: self.
]

{
	#category : #mapping,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>bytecodeIndex [

	^ bytecodeIndex
]

{
	#category : #mapping,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>bytecodeIndex: index [

	bytecodeIndex := index
]

{
	#category : #mapping,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>bytecodeOffset [
	| startpc |
	startpc := self method compiledMethod initialPC.
	self bytecodeIndex ifNil: [^startpc].
	^self bytecodeIndex + startpc - 1.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>canBeQuickReturn [
	^ false
]

{
	#category : #inspector,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>children [
	^#()
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>delete [
	sequence ifNil: [self error: 'This node doesn''t have a sequence'].
	sequence remove: self.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isBlockReturnTop [

	^false 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isGoto [
	"is unconditional jump"
	
	^ false 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isIf [

	^ false 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isInstVarAccess [

	^false.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isJump [
	"goto or if"

	^false 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isLiteralVariable [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isPop [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isPushClosureCopy [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isPushLiteral [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isPushLiteral: valueTest [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isRead [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isReturn [

	^ false 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isSelf [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isSend [
	^false.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isStore [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isTemp [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>isTempVector [
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>method [
	^sequence method.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>nonBodySuccessorSequences [
	^self successorSequences
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>printOn: aStream [
	IRPrinterV2 new
			stream: aStream;
			visitNode: self
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>replaceNode: aNode withNode: anotherNode  [
	self error: 'I don''t store other nodes'
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>replaceWith: aNode [
	sequence ifNil: [self error: 'This node doesn''t have a sequence'].
	sequence replaceNode: self withNode: aNode
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>replaceWithInstructions: aCollection  [

	sequence ifNil: [self error: 'This node doesn''t have a sequence'].
	sequence replaceNode: self withNodes: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>sequence [
	^sequence
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>sequence: aSeq [
	sequence := aSeq
]

{
	#category : #inspector,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>sourceInterval [
	^self sourceNode sourceInterval
]

{
	#category : #mapping,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>sourceNode [

	^ sourceNode
	
]

{
	#category : #mapping,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>sourceNode: parseNode [

	sourceNode := parseNode
	
]

{
	#category : #mapping,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>sourceNodeExecuted [

	^ self sourceNode
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>successorSequences [
	"sent to last instruction in sequence which is expected to be a jump and return instruction"

	^ #()
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstruction>>transitionsToNextSequence [
	"Does the current instruction intrinsically know how to transition to the next sequence?"
	^ self isJump or: [self isReturn or: [self isPushClosureCopy ]]
]
