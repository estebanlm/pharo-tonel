"
I'm a session handler used for tests purposes.
You can provide me blocks to be executed at startup or shutdown.
"
Class {
	#name : #TestSessionHandler,
	#superclass : #AbstractSessionHandler,
	#instVars : [
		'startupHandler',
		'shutdownHandler'
	],
	#category : #System-SessionManager-Tests,
	#timestamp : 'ChristopheDemarey 10/12/2015 16:45'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestSessionHandler class>>onShutdown: aBlockClosure  [
	
	^ self new
		shutdownHandler: aBlockClosure;
		yourself
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestSessionHandler class>>onStartup: aBlockClosure  [
	
	^ self new
		startupHandler: aBlockClosure;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestSessionHandler>>handledId [
	^ 'testSessionHandler'
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestSessionHandler>>printOn: aStream [
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."

	| title |
	title := self class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestSessionHandler>>shutdown: isImageQuitting [
	shutdownHandler value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestSessionHandler>>shutdownHandler: aBlockClosure [
	shutdownHandler := aBlockClosure
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestSessionHandler>>startup: isImageStarting [
	startupHandler value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestSessionHandler>>startupHandler: aBlockClosure [
	startupHandler := aBlockClosure
]
