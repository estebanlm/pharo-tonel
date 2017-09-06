Extension {
	#name : #RBProgramNode
}

{
	#category : #'*Reflectivity-Tools-Watchpoints',
	#timestamp : ' 8/31/2017 05:26:28'
}
RBProgramNode>>counter [
	
	self hasExecutionCounter ifFalse:[^nil].
	^(self beforeLinks detect: [ :link | link metaObject class = ExecutionCounter]) metaObject
]

{
	#category : #'*Reflectivity-Tools',
	#timestamp : ' 8/31/2017 05:26:28'
}
RBProgramNode>>hasBreakpoint [
	
	self hasMetalinkBefore ifFalse: [ ^false ].
	^self beforeLinks anySatisfy: [ :link | link metaObject = Break ]
]

{
	#category : #'*Reflectivity-Tools-Watchpoints',
	#timestamp : ' 8/31/2017 05:26:28'
}
RBProgramNode>>hasExecutionCounter [
	
	self hasMetalinkBefore ifFalse: [ ^false ].
	^self beforeLinks anySatisfy: [ :link | link metaObject class = ExecutionCounter ]
]

{
	#category : #'*Reflectivity-Tools-Watchpoints',
	#timestamp : ' 8/31/2017 05:26:28'
}
RBProgramNode>>hasWatchpoint [
	
	self hasMetalinkAfter ifFalse: [ ^false ].
	^self afterLinks anySatisfy: [ :link | link metaObject class = Watchpoint ]
]

{
	#category : #'*Reflectivity-Tools-Watchpoints',
	#timestamp : ' 8/31/2017 05:26:28'
}
RBProgramNode>>watchpoint [
	
	self hasWatchpoint ifFalse:[^nil].
	^(self afterLinks detect: [ :link | link metaObject class = Watchpoint ]) metaObject
]
