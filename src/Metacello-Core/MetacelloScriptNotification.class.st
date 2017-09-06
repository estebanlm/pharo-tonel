"

"
Class {
	#name : #MetacelloScriptNotification,
	#superclass : #Notification,
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptNotification>>handleResolutionFor: aScriptEngine [
    self subclassResponsibility
]
