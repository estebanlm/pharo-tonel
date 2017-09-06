"
I'm in charge to style an ast when there are watchpoints
"
Class {
	#name : #WatchpointIconStyler,
	#superclass : #IconStyler,
	#category : #Reflectivity-Tools-Watchpoints,
	#timestamp : 'mcamp 11/23/2015 13:17'
}

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
WatchpointIconStyler>>highlightColor [
	^(Color purple alpha: 0.1)
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
WatchpointIconStyler>>iconBlock: aNode [
	^[ WatchpointWindow openOn: aNode watchpoint]
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
WatchpointIconStyler>>iconFor: aNode [
	^aNode watchpoint isRecording
		ifTrue: [ self iconNamed: #testGreen]
		ifFalse: [ self iconNamed: #testNotRunIcon ]
	
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
WatchpointIconStyler>>iconLabel: aNode [

	^ aNode watchpoint asString.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
WatchpointIconStyler>>shouldStyleNode: aNode [
	^aNode hasWatchpoint
]
