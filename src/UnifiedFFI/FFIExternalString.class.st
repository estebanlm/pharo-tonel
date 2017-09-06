"
String type.
Represented as char* on C side.
"
Class {
	#name : #FFIExternalString,
	#superclass : #FFIExternalType,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalString class>>externalType [
	^ ExternalType string
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalString class>>externalTypeAlignment [
	^ self pointerSize
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalString>>basicHandle: aHandle at: index [
	| data |
	data := ExternalData 
		fromHandle: (aHandle pointerAt: index) 
		type: ExternalType string.
	data isNull ifTrue: [ ^ nil ].
	^ data fromCString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalString>>basicHandle: aHandle at: index put: value [
	self error: 'Not sure I want to do this.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalString>>externalTypeSize [
	^ self pointerSize "i am live and die as a pointer (a char*)"
]

{
	#category : #'stack parameter classification',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalString>>stackValueParameterClass [
	^ #integer
]
