"
Common things for all SDL2 structs
"
Class {
	#name : #SDL2Structure,
	#superclass : #FFIExternalStructure,
	#pools : [
		'SDL2Constants',
		'SDL2Types'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'IgorStasenko 7/30/2014 18:30'
}

{
	#category : #native,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL2Structure class>>ffiLibraryName [
	^ SDL2 ffiLibraryName
]

{
	#category : #native,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL2Structure>>ffiLibraryName [
	^self class ffiLibraryName
]
