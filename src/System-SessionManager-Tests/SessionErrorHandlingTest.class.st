"

"
Class {
	#name : #SessionErrorHandlingTest,
	#superclass : #TestCase,
	#instVars : [
		'manager',
		'session'
	],
	#category : #System-SessionManager-Tests,
	#timestamp : ''
}

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionErrorHandlingTest>>newTestSessionfor: aManager [
	^ TestWorkingSession new
		manager: aManager;
		yourself
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionErrorHandlingTest>>setUp [
	manager := SessionManager new.
	session := self newTestSessionfor: manager.
	manager installSession: session.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionErrorHandlingTest>>testErrorCaughtAndDefferedIfExceptionSignaledAtStartupWhenStartupUiManagerActive [
	manager register: (TestSessionHandler onStartup: [ Halt now ]).	
	session errorHandler: 
		(TestStartupUIManager new
			sessionManager: manager;
			yourself).
	
	self 
		shouldnt: [ session start: false ]
		raise: Halt.
	self
		assert: (session instVarNamed: 'deferredStartupActions') size 
		equals: 1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionErrorHandlingTest>>testErrorCaughtIfExceptionSignaledAtShutdownWhenDefaultUiManagerActive [
	"session errorHandler will be TestWorkingSession that will register caught errors"
	manager register: (TestSessionHandler onShutdown: [ Halt now ]).

	"ensure error handled"
	self 
		shouldnt: [ session stop: false ]
		raise: Halt.
	self
		assert: session errorHandler errors size
		equals: 1.
	
	"ensure no defered actions"
	self assert:
		(session instVarNamed: 'deferredStartupActions') isEmpty
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionErrorHandlingTest>>testErrorHandledIfExceptionSignaledAtShutdownWhenStartupUiManagerActive [
	manager register: (TestSessionHandler onShutdown: [ Halt now ]).	
	session errorHandler: 
		(TestStartupUIManager new
			sessionManager: manager;
			yourself).
	
	self 
		shouldnt: [ session stop: false ]
		raise: Halt.
	self
		assert: (session instVarNamed: 'deferredStartupActions') size 
		equals: 1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionErrorHandlingTest>>testErrorHandledIfExceptionSignaledAtStartupWhenDefaultUiManagerActive [
	"session errorHandler will be TestWorkingSession that will register caught errors"
	manager register: (TestSessionHandler onStartup: [ Halt now ]).

	"ensure error handled"
	self 
		shouldnt: [ session start: false ]
		raise: Halt.
	self
		assert: session errorHandler errors size
		equals: 1.
	
	"ensure no defered actions"
	self assert:
		(session instVarNamed: 'deferredStartupActions') isEmpty
]
