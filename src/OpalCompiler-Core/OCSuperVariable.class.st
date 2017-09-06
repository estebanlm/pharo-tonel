"
I model super variables
"
Class {
	#name : #OCSuperVariable,
	#superclass : #OCSpecialVariable,
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : 'DenisKudryashov 12/18/2015 16:44'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSuperVariable class>>semanticNodeClass [

	^RBSuperNode 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSuperVariable>>initialize [
	super initialize.
	
	name := 'super'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSuperVariable>>isSuper [
	^true
]
