"
I model argument variables. By definition, an argument variable is always initialized, and can't be written to.
"
Class {
	#name : #OCArgumentVariable,
	#superclass : #OCTempVariable,
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : 'DenisKudryashov 12/18/2015 16:46'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCArgumentVariable class>>semanticNodeClass [

	^RBArgumentNode 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCArgumentVariable>>isArg [

	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCArgumentVariable>>isUninitialized [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCArgumentVariable>>isWritable [

	^ false
]
