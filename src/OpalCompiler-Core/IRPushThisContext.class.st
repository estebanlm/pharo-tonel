"
I model push thisContext bytecode
"
Class {
	#name : #IRPushThisContext,
	#superclass : #IRAccess,
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'MarcusDenker 8/11/2014 10:14'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushThisContext>>accept: aVisitor [
	^ aVisitor visitPushThisContext: self
]
