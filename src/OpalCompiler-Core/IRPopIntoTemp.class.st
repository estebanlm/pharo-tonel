"
pop into temp
"
Class {
	#name : #IRPopIntoTemp,
	#superclass : #IRTempAccess,
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ClementBer 10/14/2014 14:48'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPopIntoTemp>>accept: aVisitor [
	^ aVisitor visitPopIntoTemp: self
]
