"

"
Class {
	#name : #SessionCreationTest,
	#superclass : #TestCase,
	#category : #System-SessionManager-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionCreationTest>>testNewSession [
	| manager session |
	manager := SessionManager new.
	session := manager newSession.
	session stop: false.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionCreationTest>>testShutdown [
	| manager session executed |
	executed := false.
	manager := SessionManager new.
	
	manager register: (TestSessionHandler onShutdown: [ executed := true ]).
	
	session := manager newSession.
	self deny: executed.
	
	session stop: false.
	self assert: executed.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionCreationTest>>testStartup [
	| manager session executed |
	executed := false.
	manager := SessionManager new.
	
	manager register: (TestSessionHandler onStartup: [ executed := true ]).
	
	session := manager newSession.
	session start: false.
	
	self assert: executed
]
