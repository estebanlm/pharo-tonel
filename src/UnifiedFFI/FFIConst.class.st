"

"
Class {
	#name : #FFIConst,
	#superclass : #FFIExternalType,
	#instVars : [
		'value',
		'externalType'
	],
	#category : #UnifiedFFI-Types,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConst class>>value: aValue [
	^ self new value: aValue
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConst class>>value: anObject type: anExternalType [
	^ self new 
		value: anObject;
		externalType: anExternalType;
		yourself
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConst>>emitArgument: aBuilder context: aContext  [
	aBuilder pushLiteral: self value
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConst>>emitReturn: aBuilder resultTempVar: resultVar context: aContext  [
	self error: 'Literals cannot be used as return'
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConst>>emitReturnArgument: builder context: aContext [
	"Nothing to do here"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConst>>externalType  [
	^ externalType
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConst>>externalType: anExternalType  [
	externalType := anExternalType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConst>>externalTypeAlignment [
	^ externalType externalTypeAlignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConst>>externalTypeSize [
	^ externalType byteSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConst>>loader  [
	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConst>>pointerArity: additionalArity [
	additionalArity > 0 ifTrue: [ self error: 'passing pointer to constant' ]
]

{
	#category : #'stack parameter classification',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConst>>stackValueParameterClass [
	^ value isFloat ifTrue: [#float] ifFalse: [#integer]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConst>>value [
	^ value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConst>>value: anObject [
	value := anObject
]
