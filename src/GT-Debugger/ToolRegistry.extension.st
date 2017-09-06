Extension {
	#name : #ToolRegistry
}

{
	#category : #'*GT-Debugger-Model',
	#timestamp : ' 8/31/2017 05:26:36'
}
ToolRegistry>>debuggerDispatcherFor: aContext matching: aBlock [
	| debuggers |
	debuggers := self debuggersWithRanksMatching: [ :aDebugger | 
		(aBlock value: aDebugger) and: [ 
			aDebugger handlesContext: aContext ] ].
	(debuggers size > 0) ifTrue: [ ^ (debuggers at: 1) key ].
	^ nil
]

{
	#category : #'*GT-Debugger-Model',
	#timestamp : ' 8/31/2017 05:26:36'
}
ToolRegistry>>debuggersForContext: aContext [

	^ self debuggersMatching: [ :aDebugger | aDebugger handlesContext: aContext ]
]

{
	#category : #'*GT-Debugger-Model',
	#timestamp : ' 8/31/2017 05:26:36'
}
ToolRegistry>>debuggersMatching: aBlock [

	^ (self debuggersWithRanksMatching: aBlock) 
			inject: OrderedCollection new
			into: [ :aCollection :aPair | aCollection add: aPair key; yourself ]
]

{
	#category : #'*GT-Debugger-Model',
	#timestamp : ' 8/31/2017 05:26:36'
}
ToolRegistry>>debuggersWithRanksMatching: aBlock [

	^ ((self registeredDebuggersWithRanks) 
			select: [ :aPair | aBlock value: aPair key ])
			sort: [ :pair1 :pair2 | pair1 value > pair2 value ].
]

{
	#category : #'*GT-Debugger-Model',
	#timestamp : ' 8/31/2017 05:26:36'
}
ToolRegistry>>registerDebugger: anObject withRank: anInteger [
	|debuggers|
	
	debuggers  := tools at: #debuggers ifAbsent: [
		tools at: #debuggers put: OrderedCollection new ]. 
	(debuggers anySatisfy: [:each| each key == anObject] ) ifFalse: [ 
		debuggers add: anObject -> anInteger ].
	WorldState defaultWorldMenu
]

{
	#category : #'*GT-Debugger-Model',
	#timestamp : ' 8/31/2017 05:26:36'
}
ToolRegistry>>registeredDebuggersWithRanks [
	
	^ tools at: #debuggers ifAbsent: [
		tools at: #debuggers put: OrderedCollection new ]
]
