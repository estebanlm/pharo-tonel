"
I am test object used for a WeakRegistry test.
I add myself to a given WeakRegistry and on finalization I modify the very same registry by removing myself from it.
"
Class {
	#name : #VileFinalizer,
	#superclass : #Object,
	#instVars : [
		'weakRegistry'
	],
	#category : #Collections-Tests-Weak,
	#timestamp : '<historical>'
}

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 05:26:28'
}
VileFinalizer>>finalize [
	weakRegistry remove: self ifAbsent: [].
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:28'
}
VileFinalizer>>initialize: registry [
	weakRegistry := registry.
	weakRegistry add: self.
]
