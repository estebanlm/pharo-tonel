Extension {
	#name : #SpecDebugger
}

{
	#category : #'*GT-Debugger',
	#timestamp : ' 8/31/2017 05:26:36'
}
SpecDebugger class>>availableAutomatically [

	^ false
]

{
	#category : #'*GT-Debugger',
	#timestamp : ' 8/31/2017 05:26:36'
}
SpecDebugger class>>handlesContext: aContext [

	^ true
]

{
	#category : #'*GT-Debugger',
	#timestamp : ' 8/31/2017 05:26:36'
}
SpecDebugger class>>spanNewSessionFrom: anotherSession [

	^ self sessionClass 
		named: anotherSession name 
		on: anotherSession interruptedProcess 
		startedAt: anotherSession interruptedContext
]
