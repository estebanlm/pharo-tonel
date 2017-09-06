"
Character type.
Represented as single byte on C side.
"
Class {
	#name : #FFICharacterType,
	#superclass : #FFIExternalType,
	#category : #UnifiedFFI-Types,
	#timestamp : 'EstebanLorenzano 9/2/2015 16:11'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICharacterType class>>externalType [
	^ ExternalType char
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICharacterType class>>externalTypeAlignment [
	^ 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICharacterType class>>externalTypeSize [
	^ 1
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICharacterType>>basicHandle: aHandle at: index [
	^ aHandle signedCharAt: index
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICharacterType>>basicHandle: aHandle at: index put: value [
	^ aHandle signedCharAt: index put: value
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICharacterType>>needsArityPacking [
	">1 because it can be a 'char *', then just roll when is 'char**' or bigger"
	^ self pointerArity > 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICharacterType>>needsArityUnpacking [
	"'char **' or bigger need to be unpacked"
	^ self needsArityPacking
]

{
	#category : #'stack parameter classification',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICharacterType>>stackValueParameterClass [
	^ #integer
]
