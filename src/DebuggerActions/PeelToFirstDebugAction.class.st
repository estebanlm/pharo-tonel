"
A PeelToFirstDebugAction peels the stack back to the second occurance of the currently selected message.

"
Class {
	#name : #PeelToFirstDebugAction,
	#superclass : #DebugAction,
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:17'
}
PeelToFirstDebugAction class>>actionType [
	<contextMenuDebuggingAction>
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PeelToFirstDebugAction>>defaultLabel [

	^ 'Peel to first like this'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PeelToFirstDebugAction>>defaultOrder [

	^ 45
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
PeelToFirstDebugAction>>executeAction [

	self session peelToFirstLike: self currentContext 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PeelToFirstDebugAction>>id [

	^ #peelToFirst
]
