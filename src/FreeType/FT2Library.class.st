"
This is a wrapper for the global 'library' in the plugin.
It is provided for the use of Cairo APIs that take an FT_Library argument.
"
Class {
	#name : #FT2Library,
	#superclass : #FT2Handle,
	#category : #FreeType-Base,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2Library class>>current [
	^[ (self basicNew)
		current ] on: FT2Error do: [ :ex | ex return: nil ].
]

{
	#category : #private-primitives,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2Library>>current [
	^[self primCurrentLibrary] on: Error do: [:e | nil]
]

{
	#category : #private-primitives,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2Library>>destroyHandle [
	"This is not a managed handle, but a global. Do nothing."
]

{
	#category : #private-primitives,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2Library>>primCurrentLibrary [
	<primitive: 'primitiveLibraryHandle' module: 'FT2Plugin'>
	^self primitiveFailed
]
