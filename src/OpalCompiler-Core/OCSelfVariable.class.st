"
I model self variables 
"
Class {
	#name : #OCSelfVariable,
	#superclass : #OCSpecialVariable,
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : 'DenisKudryashov 12/18/2015 16:44'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSelfVariable class>>semanticNodeClass [

	^RBSelfNode 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSelfVariable>>initialize [
	super initialize.
	
	name := 'self'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSelfVariable>>isSelf [
	^true
]
