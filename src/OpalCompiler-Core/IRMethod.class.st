"
I am a method in the IR (intermediate representation) language consisting of IRInstructions grouped by IRSequence (basic block).  The IRSequences form a control graph (therefore I only have to hold onto the starting sequence).  #compiledMethod will convert me to a CompiledMethod.  #methodNode will convert me back to a parse tree.

"
Class {
	#name : #IRMethod,
	#superclass : #Object,
	#instVars : [
		'sourceNode',
		'startSequence',
		'numArgs',
		'properties',
		'tempMap',
		'pragmas',
		'additionalLiterals',
		'compiledMethod',
		'compilationContext',
		'irPrimitive'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ajh 5/23/2003 11:08'
}

{
	#category : #optimizing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>absorbConstantConditionalJumps [

	startSequence absorbConstantConditionalJumps: IdentitySet new
]

{
	#category : #optimizing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>absorbJumpsToSingleInstrs [

	startSequence absorbJumpToSingleInstr: IdentitySet new
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>accept: aVisitor [
	^ aVisitor visitMethod: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>addAdditionalLiteral: aLiteral [
	additionalLiterals add: aLiteral
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>addAdditionalLiterals: literals  [
	additionalLiterals :=  literals
]

{
	#category : #inlining,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>addInstructionsAfter: aCollection [
	| returningSeqs  lastInstr |
	aCollection ifEmpty: [^self].
	returningSeqs := self allSequences select: [:each | each last isReturn].
	lastInstr := returningSeqs last last.
	lastInstr addInstructionsBefore: aCollection.
	
]

{
	#category : #inlining,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>addInstructionsBefore: aCollection [

	(self startSequence nextSequence first) addInstructionsBefore: aCollection.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>addPragma: aPragma [
	
	pragmas add: aPragma.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>additionalLiterals [
	^additionalLiterals
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>allInstructions [
	" return irNodes as a flat collection "

	| irInstructions |
	irInstructions := OrderedCollection new.
	startSequence withAllSuccessorsDo: [:seq | seq do: [:bc | irInstructions add: bc]].
	^irInstructions
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>allInstructionsMatching: aBlock [
	" return irNodes as a flat collection "

	| irInstructions |
	irInstructions := OrderedCollection new.
	startSequence withAllSuccessorsDo: [:seq | seq do: [:bc | (aBlock value: bc) ifTrue: [irInstructions add: bc]]].
	^irInstructions
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>allSequences [
	^ startSequence withAllSuccessors
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>allTempAccessInstructions [
	^self allInstructionsMatching: [:bc | bc isTemp].
]

{
	#category : #inspector,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>children [
	^self startSequence withAllSuccessors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>compilationContext [
	^ compilationContext ifNil: [ 
		"only happens when decompiling or using stand-alone"
		compilationContext := CompilationContext default]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>compilationContext: aCompilationContext [
	compilationContext := aCompilationContext
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>compiledBlock: scope [

	^compiledMethod 
		ifNil: [self generateBlock: CompiledMethodTrailer empty withScope: scope ]
		ifNotNil: [compiledMethod]
]

{
	#category : #translating,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>compiledMethod [

	^ self compiledMethodWith: CompiledMethodTrailer empty
]

{
	#category : #translating,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>compiledMethodWith: trailer [

	^compiledMethod 
		ifNil: [self generate: trailer ]
		ifNotNil: [compiledMethod]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>firstInstructionMatching: aBlock [
	" return irNodes as a flat collection "

	startSequence withAllSuccessorsDo: [:seq | seq do: [:bc | (aBlock value: bc) ifTrue: [^bc]]].
	^nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>forceLongForm [
	compilationContext ifNil: [ ^ false ].
	^compilationContext optionLongIvarAccessBytecodes
		
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>fullBlockInstructionForPC: aPC [
	| pc |
	"For a given PC, the actual instruction may start N bytes ahead."
	pc := aPC.
	[ pc >= 0 ] whileTrue: [ 
		(self firstInstructionMatching: [:ir | ir bytecodeOffset = pc ]) ifNotNil: [:it |^it].
		pc := pc - 1 ].
]

{
	#category : #translating,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>generate [
	^self generate: CompiledMethodTrailer empty
]

{
	#category : #translating,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>generate: trailer [
	
	| irTranslator |
   irTranslator := IRTranslatorV2 context: compilationContext trailer: trailer.
	irTranslator 
		visitNode: self;
		pragmas: pragmas.
	compiledMethod := irTranslator compiledMethod.
	self sourceNode 
		ifNotNil: [ 
			compiledMethod classBinding: self sourceNode methodClass binding.
			compiledMethod selector: self sourceNode selector ]
		ifNil: [ 
			compiledMethod classBinding: UndefinedObject binding.
			compiledMethod selector: #UndefinedMethod ].
	^ compiledMethod
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>generateBlock: trailer withScope: scope [
	| irTranslator |
      irTranslator := IRTranslatorV2 context: compilationContext trailer: trailer.
	irTranslator 
		pushOuterVectors: scope;
		visitNode: self;
		pragmas: pragmas.
	compiledMethod := irTranslator compiledBlock.
	^ compiledMethod
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>hasTempVector: aSymbol [
	startSequence withAllSuccessorsDo: [ :seq | (seq hasTempVector: aSymbol) ifTrue: [ ^ true ]].
	^ false
]

{
	#category : #scoping,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>indexForVarNamed: aName [

	^tempMap at: aName
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>initialize [

	irPrimitive := IRPrimitive null.
	tempMap := Dictionary new.
	pragmas := OrderedCollection new.
	additionalLiterals := OCLiteralSet new.
	numArgs := 0.
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>instructionForPC: aPC [
	| initialPC pc |
	"generates the compiledMethod and optimize the ir. 
	Removes the side-effect of optimizing the IR while looking for instruction, 
	which results in incorrect found instruction"
	initialPC := self compiledMethod initialPC.
	"For a given PC, the actual instruction may start N bytes ahead."
	pc := aPC.
	[ pc >= initialPC ] whileTrue: [ 
		(self firstInstructionMatching: [:ir | ir bytecodeOffset = pc ]) ifNotNil: [:it |^it].
		pc := pc - 1 ].
	^self "if we not found anything then this method is our target instruction"
]

{
	#category : #decompiling,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>instructionsForDecompiling [
	"return all instructions, but skip the block bodies, as the decompiler
	recurses over blocks"
	
	^startSequence instructionsForDecompiling allButFirst.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>ir [
	^self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>irPrimitive [

	^ irPrimitive
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>irPrimitive: aPrimitiveNode [

	irPrimitive := aPrimitiveNode
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>isPushClosureCopy [
	^false.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>isSend [
	^false.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>longPrintOn: stream [

	IRPrinterV2 new
		stream: stream;
		visitNode: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>method [
	^self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>numArgs [

	^ numArgs
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>numArgs: anInteger [

	numArgs := anInteger
]

{
	#category : #optimizing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>optimize [
	self removeEmptyStart.
	self compilationContext optionOptimizeIR ifFalse: [^self].
	self absorbJumpsToSingleInstrs.
	
	"This last two optimizations works but the problem 
	when you absorb conditional jumps 
	is that and: / or: chained generate explicitely 
	constant conditional jumps to tip the JIt and the 
	decompiler that they are and: or: and not conditions/loops
	
	self absorbConstantConditionalJumps.
	self absorbJumpsToSingleInstrs"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>predecessorsOf: aSequence [
	| predecessors |
	predecessors := OrderedCollection new.
	self allSequences do: [:each | (each successorSequences includes: aSequence) ifTrue: [predecessors add: each]].
	^predecessors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>properties [
	^properties
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>properties: propDict [
	properties := propDict.
]

{
	#category : #optimizing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>removeEmptyStart [

	 (startSequence size = 1 and: [ startSequence last isPushClosureCopy not ]) ifTrue: [
        "startSeq is just unconditional jump, forget it"
        startSequence := startSequence last destination].

]

{
	#category : #inlining,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>removeReturn [
	self allSequences last removeLast.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>sourceInterval [
	^self sourceNode sourceInterval
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>sourceNode [
	^sourceNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>sourceNode: aNode [
	sourceNode := aNode
]

{
	#category : #mapping,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>sourceNodeExecuted  [
	"It should not be used directly. But it is needed for fallback call from RBMethodNode>>sourceNodeExecutedForPC:. 
	Problem that IRMethod can returns itself from  instructionForPC:.
	So it should only return sourceNode without any analyzis"
	^sourceNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>startSequence [

	^ startSequence
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>startSequence: irSequence [

	startSequence := irSequence.
	irSequence method: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>tempKeys [

	^ tempMap keys
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>tempMap [
	^ tempMap
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRMethod>>tempVectorNamed: aName [
	
	^self firstInstructionMatching: [:ir | ir isTempVector and:  [ir name = aName ] ]
]
