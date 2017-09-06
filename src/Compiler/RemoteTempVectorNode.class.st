"
I am a node for a vector of remote temps, created to share temps between closures when those temps are written to in closures other than their defining ones.
"
Class {
	#name : #RemoteTempVectorNode,
	#superclass : #TempVariableNode,
	#instVars : [
		'remoteTemps',
		'readNode',
		'writeNode'
	],
	#category : #Compiler-ParseNodes,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>accept: aVisitor [
	^aVisitor visitRemoteTempVectorNode: self
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>addRemoteTemp: aTempVariableNode encoder: encoder [
	remoteTemps ifNil:
		[remoteTemps := OrderedCollection new].
	remoteTemps addLast: aTempVariableNode.
	aTempVariableNode referenceScopesAndIndicesDo:
		[:scopeBlock "<BlockNode>" :location "<Integer>"|
		 self addReadWithin: scopeBlock at: location].
	encoder supportsClosureOpcodes ifFalse:
		[encoder encodeLiteral: remoteTemps size.
		 readNode := encoder encodeSelector: #at:.
		 writeNode := encoder encodeSelector: #at:put:]
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>emitCodeForIndexOf: aTempVariableNode stack: stack encoder: encoder [
	[encoder supportsClosureOpcodes not] assert.
	(encoder encodeLiteral: (remoteTemps indexOf: aTempVariableNode))
		emitCodeForValue: stack encoder: encoder
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>emitCodeForLoadFor: aTempVariableNode stack: stack encoder: encoder [
	encoder supportsClosureOpcodes ifTrue:
		[^self].
	"Need to generate the first half of
		tempVector at: index put: expr
	 i.e. the push of tempVector and index."
	super emitCodeForValue: stack encoder: encoder.
	self emitCodeForIndexOf: aTempVariableNode stack: stack encoder: encoder
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>emitCodeForStoreInto: aTempVariableNode stack: stack encoder: encoder [
	encoder supportsClosureOpcodes
		ifTrue:
			[encoder
				genStoreRemoteTemp: (remoteTemps indexOf: aTempVariableNode) - 1
				inVectorAt: index]
		ifFalse:
			[writeNode
				emitCode: stack
				args: 2
				encoder: encoder
				super: false]
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>emitCodeForStorePopInto: aTempVariableNode stack: stack encoder: encoder [
	encoder supportsClosureOpcodes
		ifTrue:
			[encoder
				genStorePopRemoteTemp: (remoteTemps indexOf: aTempVariableNode) - 1
				inVectorAt: index]
		ifFalse:
			[self emitCodeForStoreInto: aTempVariableNode stack: stack encoder: encoder.
			 encoder genPop].
	stack pop: 1
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>emitCodeForValueOf: aTempVariableNode stack: stack encoder: encoder [
	encoder supportsClosureOpcodes
		ifTrue:
			[encoder
				genPushRemoteTemp: (remoteTemps indexOf: aTempVariableNode) - 1
				inVectorAt: index.
			 stack push: 1]
		ifFalse:
			[self emitCodeForLoadFor: aTempVariableNode stack: stack encoder: encoder.
			 readNode
				emitCode: stack
				args: 1
				encoder: encoder
				super: false]
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>isIndirectTempVector [
	^true
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>nodeToInitialize: encoder [
	^AssignmentNode new
		variable: self
		value: (encoder supportsClosureOpcodes
					ifTrue: [NewArrayNode new numElements: remoteTemps size]
					ifFalse:
						[MessageNode new
							receiver: (encoder encodeVariable: 'Array')
							selector: #new:
							arguments: (Array with: (encoder encodeLiteral: remoteTemps size))
							precedence: 3
							from: encoder])
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>referenceScopesAndIndicesDo: aBinaryBlock [
	self shouldNotImplement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>remoteTemps [
	^remoteTemps
]

{
	#category : #decompiler,
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>remoteTemps: anArray [
	remoteTemps := anArray.
	anArray do: [:tempNode| tempNode remoteNode: self]
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>scope [
	"Answer scope of temporary variables.
	 Currently only the following distinctions are made:
		 0	outer level: args and user-declared temps
		 1	block args and doLimiT temps
		-1	a block temp that is no longer active
		-2	a block temp that held limit of to:do:
		-3	an indirect temp vector"
	^-3
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>sizeCodeForIndexOf: aTempVariableNode encoder: encoder [
	[encoder supportsClosureOpcodes not] assert.
	^(encoder encodeLiteral: (remoteTemps indexOf: aTempVariableNode)) sizeCodeForValue: encoder
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>sizeCodeForLoadFor: aTempVariableNode encoder: encoder [
	encoder supportsClosureOpcodes ifTrue:
		[^0].
	"Need to size the first half of
		tempVector at: index put: expr
	 i.e. the push of tempVector and index."
	^(super sizeCodeForValue: encoder)
	+ (self sizeCodeForIndexOf: aTempVariableNode encoder: encoder)
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>sizeCodeForStoreInto: aTempVariableNode encoder: encoder [
	encoder supportsClosureOpcodes ifTrue:
		[^encoder sizeStoreRemoteTemp: (remoteTemps indexOf: aTempVariableNode) - 1 inVectorAt: index].
	^writeNode sizeCode: encoder args: 2 super: false
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>sizeCodeForStorePopInto: aTempVariableNode encoder: encoder [
	encoder supportsClosureOpcodes ifTrue:
		[^encoder sizeStorePopRemoteTemp: (remoteTemps indexOf: aTempVariableNode) - 1 inVectorAt: index].
	^(self sizeCodeForStoreInto: aTempVariableNode encoder: encoder)
	+ encoder sizePop
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
RemoteTempVectorNode>>sizeCodeForValueOf: aTempVariableNode encoder: encoder [
	encoder supportsClosureOpcodes ifTrue:
		[^encoder sizePushRemoteTemp: (remoteTemps indexOf: aTempVariableNode) - 1 inVectorAt: index].
	^(self sizeCodeForValue: encoder)
	+ (self sizeCodeForIndexOf: aTempVariableNode encoder: encoder)
	+ (readNode sizeCode: encoder args: 1 super: false)
]
