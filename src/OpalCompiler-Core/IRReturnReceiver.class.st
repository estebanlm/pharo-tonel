"
specific node when returning self
"
Class {
	#name : #IRReturnReceiver,
	#superclass : #IRReturn,
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ClementBer 10/14/2014 15:23'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRReturnReceiver>>accept: aVisitor [
	^ aVisitor visitReturnReceiver: self
]
