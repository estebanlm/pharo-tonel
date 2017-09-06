Extension {
	#name : #Process
}

{
	#category : #'*DebuggerModel',
	#timestamp : ' 8/31/2017 05:26:17'
}
Process>>newDebugSessionNamed: aString startedAt: aContext [

	^DebugSession named: aString on: self startedAt: aContext
]
