"

"
Class {
	#name : #FFIOop,
	#superclass : #FFIExternalType,
	#category : #UnifiedFFI-Types,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOop class>>externalType  [
	^ ExternalType void asPointerType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOop class>>externalTypeAlignment [
	^ self pointerSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOop class>>externalTypeSize [
	^ Smalltalk wordSize
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOop class>>naturalPointerArity [
	^ 1
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOop>>basicHandle: aHandle at: index [
	^ aHandle pointerAt: index
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOop>>basicHandle: aHandle at: index put: value [
	self error: 'Not sure I want to do this.'
	"But it would be like this:
	aHandle pointerAt: index put: value"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOop>>externalTypeSize [
	^ self pointerSize  
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOop>>needsArityUnpacking [
	"this represent kind of pointers, so it will be unpacked if they are also rolled."
	^ self needsArityPacking
]

{
	#category : #'stack parameter classification',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOop>>stackValueParameterClass [
	^ #integer
]
