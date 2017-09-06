"
I am a non interactive UI manager that is used only during image startup, where parts of the system are not fully initialized yet.
"
Class {
	#name : #StartupUIManager,
	#superclass : #NonInteractiveUIManager,
	#category : #System-SessionManager,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:58'
}
StartupUIManager class>>isValidForCurrentSystemConfiguration [

	^ false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:58'
}
StartupUIManager>>activate [
	"override to exclude the superclass' behavior"
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:16:58'
}
StartupUIManager>>handleError: anError log: shouldLog [
	"We should log only the first time that the error is handled. Then, the deferred startup action never asks to log: either we never were asked to log (shouldLog=true) or we logged in the super send."

	self flag: 'TODO'. "Maybe we should only catch Errors and not Exceptions in WorkingSession>>#runList:do:"
	
	super handleError: anError log: shouldLog.
	(anError isKindOf: Notification) 
		ifTrue:  [ anError resume ] 
		ifFalse: [ anError freeze.
						self sessionManager
						addDeferredStartupAction: [ self uiManager handleError: anError log: false ]].
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:58'
}
StartupUIManager>>inform: aString [
	(ProvideAnswerNotification signal: aString) 
		ifNotNil: [:answer | ^true].
	self sessionManager 
		addDeferredStartupAction: [ UIManager default inform: aString ].
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:16:58'
}
StartupUIManager>>sessionManager [
	^ SessionManager default
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:16:58'
}
StartupUIManager>>uiManager [
	^ UIManager default
]
