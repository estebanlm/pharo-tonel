"
When an image is launched, a session starts. After that, the session can be snapshoted multiple times. I represent the snapshot of a session.
"
Class {
	#name : #EpSessionSnapshot,
	#superclass : #EpSessionEvent,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:55'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpSessionSnapshot>>accept: aVisitor [

	^ aVisitor visitSessionSnapshot: self
]
