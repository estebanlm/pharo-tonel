"

"
Class {
	#name : #MetacelloScriptEnsureProjectLoadedForDevelopment,
	#superclass : #MetacelloScriptNotification,
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEnsureProjectLoadedForDevelopment>>defaultAction [
    "Go ahead and download a new copy of configuration because blessing is #development"

    ^ true
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEnsureProjectLoadedForDevelopment>>handleResolutionFor: aScriptEngine [
    ^ aScriptEngine handleEnsureProjectLoadedForDevelopment: self
]
