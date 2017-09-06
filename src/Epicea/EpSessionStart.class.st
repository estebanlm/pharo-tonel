"
When an image is launched, a session starts. I represent the start of a session.
"
Class {
	#name : #EpSessionStart,
	#superclass : #EpSessionEvent,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:54'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpSessionStart>>accept: aVisitor  [
	^ aVisitor visitSessionStart: self
]
