"
I model thisContext variables
"
Class {
	#name : #OCThisContextVariable,
	#superclass : #OCSpecialVariable,
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : 'DenisKudryashov 12/18/2015 16:44'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCThisContextVariable class>>semanticNodeClass [

	^RBThisContextNode 
]

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCThisContextVariable>>emitValue: methodBuilder [

	methodBuilder pushThisContext
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCThisContextVariable>>initialize [
	super initialize.
	
	name := 'thisContext'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCThisContextVariable>>isThisContext [
	^true
]
