"
specific node when returning an inst var
"
Class {
	#name : #IRReturnInstVar,
	#superclass : #IRReturn,
	#instVars : [
		'index'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ClementBer 10/14/2014 15:23'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRReturnInstVar>>accept: aVisitor [
	^ aVisitor visitReturnInstVar: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRReturnInstVar>>index [
	^ index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRReturnInstVar>>index: anObject [
	index := anObject
]
