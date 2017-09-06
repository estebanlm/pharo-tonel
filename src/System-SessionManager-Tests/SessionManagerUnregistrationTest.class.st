"

"
Class {
	#name : #SessionManagerUnregistrationTest,
	#superclass : #TestCase,
	#instVars : [
		'sessionManager'
	],
	#category : #System-SessionManager-Tests,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerUnregistrationTest>>setUp [
	sessionManager := SessionManager new
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerUnregistrationTest>>testCanUnregisterClass [
	sessionManager registerSystemClassNamed: #Foo.
	sessionManager registerSystemClassNamed: #Bar.

	sessionManager unregisterClassNamed: #Foo.
	
	self 
		assert: (sessionManager startupList collect: #handledId)
		equals: #( Bar ).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerUnregistrationTest>>testUnregisterUnknownClassDoesNotFail [
	sessionManager registerSystemClassNamed: #Foo.

	sessionManager unregisterClassNamed: #Bar.
	
	self 
		assert: (sessionManager startupList collect: #handledId)
		equals: #( Foo ).
]
