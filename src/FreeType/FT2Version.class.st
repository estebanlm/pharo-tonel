"
Do not rearrange these fields!

This is used to report FT2 version information. Its fields must remain unchanged, or you must change FT2Plugin>>primitiveVersion.
"
Class {
	#name : #FT2Version,
	#superclass : #Object,
	#instVars : [
		'major',
		'minor',
		'patch'
	],
	#category : #FreeType-Base,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2Version class>>current [
	"
	FT2Version current
	"
	^ [(self new)
		libraryVersion;
		yourself] on: Error do: [:ex | ex return: nil]
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2Version>>libraryVersion [
	<primitive: 'primitiveVersion' module: 'FT2Plugin'>
	^self primitiveFailed.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2Version>>major [
	^major
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2Version>>minor [
	^minor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2Version>>patch [
	^patch
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2Version>>printOn: aStream [
	aStream print: major; nextPut: $.; print: minor; nextPut:$.; print: patch.
]
