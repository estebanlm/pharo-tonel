"
I am a session handler that will initialize the UIManager during startup.

This session handler makes the assumption that the current UIManager is a startup UI manager when its #startup: method gets called. Then, during startup he will install a Morphic UI manager.

During shutdown we put back a startup ui manager, so we can handle startup actions during next startup without depending in the UI. (However, we shouldnt need a UI manager during the first startup actions).
"
Class {
	#name : #UIManagerSessionHandler,
	#superclass : #AbstractSessionHandler,
	#classVars : [
		'UniqueInstance'
	],
	#category : #System-SessionManager,
	#timestamp : 'ChristopheDemarey 10/9/2015 11:51'
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:58'
}
UIManagerSessionHandler class>>initialize [
	"has to be executed at the end of the GUI category"
	SessionManager default 
		register: self uniqueInstance
		inCategory: SessionManager default guiCategory 
		atPriority: SmallInteger maxVal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:58'
}
UIManagerSessionHandler class>>uniqueInstance [
	^ UniqueInstance ifNil: [ UniqueInstance := self new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:58'
}
UIManagerSessionHandler>>handledId [
	^ self class name
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:58'
}
UIManagerSessionHandler>>shutdown: isImageQuitting [
	"Prepare the shutdown and the next startup"
	UIManager default: StartupUIManager new
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:58'
}
UIManagerSessionHandler>>startup: isImageStarting [
	"Install the right UIManager"
	UIManager default: UIManager forCurrentSystemConfiguration.
]
