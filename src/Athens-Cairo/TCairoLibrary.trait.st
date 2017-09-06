"
a simple trait used for NB callouts to cairo library functions
"
Trait {
	#name : #TCairoLibrary,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Athens-Cairo,
	#timestamp : '<historical>'
}

{
	#category : #'library path',
	#timestamp : ' 8/31/2017 05:26:26'
}
TCairoLibrary classSide>>ffiLibraryName [
	^ CairoLibrary
]

{
	#category : #'library path',
	#timestamp : ' 8/31/2017 05:26:26'
}
TCairoLibrary>>ffiLibraryName [
	^ self class ffiLibraryName
]
