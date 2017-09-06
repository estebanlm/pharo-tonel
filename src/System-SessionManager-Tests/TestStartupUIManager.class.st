"
I'm an startup UI manager used for test purposes.
I provide a way to not use the default session manager.

"
Class {
	#name : #TestStartupUIManager,
	#superclass : #StartupUIManager,
	#instVars : [
		'sessionManager'
	],
	#category : #System-SessionManager-Tests,
	#timestamp : 'ChristopheDemarey 10/13/2015 09:38'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestStartupUIManager>>sessionManager [
	^ sessionManager
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestStartupUIManager>>sessionManager: aSessionManager [
	sessionManager := aSessionManager
]
