"
subclass of Opal that takes links into account
"
Class {
	#name : #RFASTTranslator,
	#superclass : #OCASTTranslator,
	#category : #Reflectivity-Compiler,
	#timestamp : 'MarcusDenker 6/23/2015 17:38'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>classForEffect [
	^RFASTTranslatorForEffect
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>classForValue [
	^RFASTTranslatorForValue
]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>emitMessageNode: aMessageNode [
	self emitPrepareLinkAfter: aMessageNode.
	aMessageNode isCascaded
		ifFalse: [ valueTranslator visitNode: aMessageNode receiver ].
	aMessageNode arguments do: [ :each | valueTranslator visitNode: each ].
	self emitMetaLinkBefore: aMessageNode.
	aMessageNode hasMetalinkInstead
		ifTrue: [ self emitMetaLinkInstead: aMessageNode ]
		ifFalse: [ 
			aMessageNode isSuperSend
				ifTrue: [ methodBuilder send: aMessageNode selector toSuperOf: self compilationContext getClass ]
				ifFalse: [ methodBuilder send: aMessageNode selector ] ].
	self emitMetaLinkAfter: aMessageNode.
]

{
	#category : #reflectivity,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>emitMetaLinkAfter: aNode [
	aNode hasMetalinkAfter ifFalse: [ ^self ].
	aNode allAfterAreWeak ifTrue: [ ^self emitMetaLinkAfterNoEnsure: aNode ].
	
	methodBuilder blockReturnTop.
	methodBuilder jumpAheadTarget: #block.		
	valueTranslator visitNode: aNode afterHooks.
	methodBuilder send: #ensure:.
]

{
	#category : #reflectivity,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>emitMetaLinkAfterNoEnsure: aNode [

	aNode hasMetalinkAfter ifFalse: [ ^self ].
	self emitPreamble: aNode.
	aNode afterHooks do: [ :each | effectTranslator visitNode: each body ].
]

{
	#category : #reflectivity,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>emitMetaLinkBefore: aNode [
	aNode hasMetalinkBefore ifFalse: [ ^self ].
	self emitPreamble: aNode.
	aNode beforeHooks do: [ :hook | effectTranslator visitNode: hook ].
]

{
	#category : #reflectivity,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>emitMetaLinkInstead: aNode [
	self emitPreamble: aNode.
	valueTranslator visitNode: aNode insteadHooks.
]

{
	#category : #reflectivity,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>emitPreamble: aNode [
	aNode preambles do: [ :pre | valueTranslator visitNode: pre].
]

{
	#category : #reflectivity,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>emitPrepareLinkAfter: aNode [
	"We need to emit the first part of the block for the ensure: wrap here"
	| copied |
	copied := #().
	aNode hasMetalinkAfter ifFalse: [^self].
	self emitPreamble: aNode.
	aNode allAfterAreWeak ifTrue: [ ^self ].
	aNode isMethod ifTrue: [ copied := aNode argumentNames, aNode tempNames ].
	methodBuilder
		pushClosureCopyCopiedValues: copied
		args: #()
		jumpTo: #block
]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>visitArrayNode: anArrayNode  [

	| elementNodes |
	
	anArrayNode statements size > 32 ifTrue: [^ self visitLargeArrayNode: anArrayNode ].
	
	elementNodes := anArrayNode children.
	elementNodes do: [:node | valueTranslator visitNode: node].
	self emitMetaLinkBefore: anArrayNode.
	anArrayNode hasMetalinkInstead
		ifTrue: [ self emitMetaLinkInstead: anArrayNode ]
		ifFalse: [ methodBuilder pushConsArray: elementNodes size ].
	self emitMetaLinkAfterNoEnsure: anArrayNode.

]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>visitAssignmentNode: anAssignmentNode  [
	valueTranslator visitNode: anAssignmentNode value.
	self emitMetaLinkBefore: anAssignmentNode.
	self emitMetaLinkBefore: anAssignmentNode variable.
	

	anAssignmentNode hasMetalinkInstead
				ifTrue: [ self emitMetaLinkInstead: anAssignmentNode ]
				ifFalse: [
					 anAssignmentNode variable hasMetalinkInstead
						ifTrue: [ self emitMetaLinkInstead: anAssignmentNode variable]
						ifFalse: [ anAssignmentNode variable binding emitStore: methodBuilder]].
	self emitMetaLinkAfterNoEnsure: anAssignmentNode variable.
	self emitMetaLinkAfterNoEnsure: anAssignmentNode.
	
]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>visitBlockNode: aBlockNode [
	| tempNames argumentNames copiedNames |
	aBlockNode arguments size >15 ifTrue: [self backendError: 'Too many arguments' forNode: aBlockNode ].
	
	aBlockNode isInlined ifTrue: [^ self visitInlinedBlockNode: aBlockNode ].
		
	argumentNames := aBlockNode argumentNames asArray.
	tempNames := (aBlockNode scope tempVars asArray collect: [ :each | each name]) copyWithoutAll: argumentNames.
	copiedNames := (aBlockNode scope  inComingCopiedVars asArray collect: [:each | each name]).
	
	aBlockNode hasMetalinkInstead ifFalse: [  
	methodBuilder
			pushClosureCopyCopiedValues: copiedNames
			args: argumentNames
			jumpTo:  #block.
	 
	aBlockNode scope tempVector ifNotEmpty: [
		methodBuilder 
			createTempVectorNamed: aBlockNode scope tempVectorName 
			withVars: (aBlockNode scope tempVector collect: [:each| each name]) asArray.
	].
	methodBuilder addTemps: tempNames.
	self emitMetaLinkBefore: aBlockNode.
	valueTranslator visitNode: aBlockNode body.
	methodBuilder addBlockReturnTopIfRequired.
	self flag: 'why dont we just add a blockReturnTop here... it could be removed or ignored in IRTranslator'.
	methodBuilder jumpAheadTarget: #block.
	] ifTrue: [ self emitMetaLinkInstead: aBlockNode ].
	self emitMetaLinkAfterNoEnsure: aBlockNode.
	


]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>visitInlinedBlockNode: anOptimizedBlockNode [

	"We are visiting a scope that is not a block, but inlined in the outer context.
	This means: 
			- we do not create a Block
			- we call IRBuilder to add temps
	"
	
	| argumentNames tempNames  copiedNames  |
	argumentNames := anOptimizedBlockNode argumentNames asArray.
	tempNames := (anOptimizedBlockNode scope tempVars collect: [ :each | each name asSymbol]) copyWithoutAll: argumentNames.
	copiedNames := (anOptimizedBlockNode scope inComingCopiedVars collect: [:each | each name]) asArray.
	
	
	anOptimizedBlockNode scope tempVector ifNotEmpty: [
		methodBuilder 
			createTempVectorNamed: anOptimizedBlockNode scope tempVectorName 
			withVars: (anOptimizedBlockNode scope tempVector collect: [:each| each name]) asArray.
	].
	
	methodBuilder addTemps: tempNames.
	methodBuilder addTemps: copiedNames.
	methodBuilder addTemps: argumentNames.
	anOptimizedBlockNode isInlinedLoop ifTrue: [
		tempNames do: [ :tempName |
			methodBuilder pushLiteral: nil.
			methodBuilder storeTemp: tempName.
			methodBuilder popTop.
		 ]].
	self emitMetaLinkBefore: anOptimizedBlockNode.
	self visitNode: anOptimizedBlockNode body.
]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>visitLiteralArrayNode: aRBLiteralArrayNode [
	self emitMetaLinkBefore: aRBLiteralArrayNode.
	aRBLiteralArrayNode hasMetalinkInstead
		ifTrue: [ self emitMetaLinkInstead: aRBLiteralArrayNode ]
		ifFalse: [ methodBuilder pushLiteral: aRBLiteralArrayNode value ].
	self emitMetaLinkAfterNoEnsure: aRBLiteralArrayNode.
	

]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>visitLiteralNode: aLiteralNode [
	self emitMetaLinkBefore: aLiteralNode.
	aLiteralNode hasMetalinkInstead
		ifTrue: [ self emitMetaLinkInstead: aLiteralNode ]
		ifFalse: [ methodBuilder pushLiteral: aLiteralNode value ].
	self emitMetaLinkAfterNoEnsure: aLiteralNode.

	

]

{
	#category : #reflectivity,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>visitLiteralVariableNode: aLiteralVariableNode [
	 methodBuilder pushLiteralVariable: aLiteralVariableNode binding
]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>visitMethodNode: aMethodNode [
	"I ignore all links when I am primitive as ReflectiveMethod compiles a wrapper"
	
	aMethodNode arguments size > 15 ifTrue: [self backendError: 'Too many arguments' forNode: aMethodNode ].
	
	methodBuilder compilationContext: aMethodNode compilationContext.
	methodBuilder addTemps: aMethodNode scope tempVarNames.
	
	aMethodNode isPrimitive ifFalse: [self emitMetaLinkBefore: aMethodNode].

	methodBuilder properties: aMethodNode properties.
	methodBuilder irPrimitive: aMethodNode primitiveFromPragma.
	aMethodNode pragmas do: [:each | self visitPragmaNode: each].
	methodBuilder numArgs: aMethodNode arguments size.
	
	self emitPrepareLinkAfter: aMethodNode.
	
	(aMethodNode hasMetalinkInstead and: [ aMethodNode isPrimitive not ])
				ifTrue: [ self emitMetaLinkInstead: aMethodNode. methodBuilder returnTop.
						^self. ].
				
	aMethodNode scope tempVector ifNotEmpty: [
		methodBuilder 
			createTempVectorNamed: aMethodNode scope tempVectorName 
			withVars: (aMethodNode scope tempVector collect: [:each| each name]) asArray.
	].
	effectTranslator visitNode: aMethodNode body.
	aMethodNode body lastIsReturn ifFalse:  [methodBuilder pushReceiver; returnTop].
	self emitMetaLinkAfter: aMethodNode.
	aMethodNode hasMetalinkAfter ifTrue: [methodBuilder returnTop].

]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>visitReturnNode: aReturnNode  [

	valueTranslator visitNode: aReturnNode value.
	self emitMetaLinkBefore: aReturnNode.
	methodBuilder returnTop.
		

]

{
	#category : #reflectivity,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>visitStoreIntoTempNode: aNode [
	"we store the TOS into the temp defined by the reification node"

	aNode binding emitStore: methodBuilder.

]

{
	#category : #reflectivity,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>visitStorePopIntoTempNode: aNode [
	"we store the TOS into the temp defined by the reification node"

	aNode binding emitStore: methodBuilder.
	methodBuilder popTop.
]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>visitVariableNode: aVariableNode [
	self emitMetaLinkBefore: aVariableNode.
	aVariableNode hasMetalinkInstead
				ifTrue: [ self emitMetaLinkInstead: aVariableNode ]
				ifFalse: [ self visitVariableValue: aVariableNode binding variable].
	self emitMetaLinkAfterNoEnsure: aVariableNode.
	
	
]

{
	#category : #reflectivity,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTTranslator>>visitVariableValue: aVariable [
	self flag: #TBD. "needs to be extendend to other kinds of variables and cleaned"
	((aVariable isKindOf: LiteralVariable) or: [ (aVariable isKindOf: Slot) ]) ifTrue: [ self emitMetaLinkBefore: aVariable. ].
	aVariable emitValue: methodBuilder.
	((aVariable isKindOf: LiteralVariable) or: [ (aVariable isKindOf: Slot) ]) ifTrue: [self emitMetaLinkAfterNoEnsure: aVariable].
]
