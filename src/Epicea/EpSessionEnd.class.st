"
When an image is launched, a session starts. When it is quit, the session ends. I represent the end of a session.
"
Class {
	#name : #EpSessionEnd,
	#superclass : #EpSessionEvent,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:54'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpSessionEnd>>accept: aVisitor  [
	^ aVisitor visitSessionEnd: self
]
