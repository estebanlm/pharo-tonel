"
Pop into instance variable.
"
Class {
	#name : #IRPopIntoInstVar,
	#superclass : #IRInstVarAccess,
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ClementBer 10/14/2014 14:47'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPopIntoInstVar>>accept: aVisitor [
	^ aVisitor visitPopIntoInstVar: self
]
