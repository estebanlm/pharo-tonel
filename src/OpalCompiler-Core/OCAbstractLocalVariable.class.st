"
I am an argument or temporary variable of a method or block.

index is not the index in the bytecode but just used for sorting
(see tempVars). to be fixed...
"
Class {
	#name : #OCAbstractLocalVariable,
	#superclass : #OCAbstractVariable,
	#instVars : [
		'name'
	],
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractLocalVariable>>isLocal [

	^true
]

{
	#category : #'read/write usage',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractLocalVariable>>isUninitialized [

	^ self isWrite not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractLocalVariable>>name [

	^ name
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractLocalVariable>>name: string [
	name := string
]
