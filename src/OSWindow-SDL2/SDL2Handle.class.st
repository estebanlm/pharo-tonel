"
My subclasses represent various handles coming from SDL2 library
"
Class {
	#name : #SDL2Handle,
	#superclass : #FFIExternalObject,
	#pools : [
		'SDL2Constants',
		'SDL2Types'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'IgorStasenko 7/30/2014 18:26'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL2Handle class>>ffiLibraryName [
	^ SDL2 ffiLibraryName
]

{
	#category : #nb-library,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL2Handle>>ffiLibraryName [
	^self class ffiLibraryName
]
