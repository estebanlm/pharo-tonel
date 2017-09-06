"
specific node when returning a constant
"
Class {
	#name : #IRReturnLiteral,
	#superclass : #IRReturn,
	#instVars : [
		'literal'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ClementBer 10/14/2014 14:48'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRReturnLiteral>>accept: aVisitor [
	^ aVisitor visitReturnLiteral: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRReturnLiteral>>literal [
	^ literal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRReturnLiteral>>literal: anObject [
	literal := anObject
]
