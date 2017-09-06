"
I am a node in a tree of Epicea logs that represent the EpMonitor current log. Read more in my superclass comment.
"
Class {
	#name : #EpMonitorLogNode,
	#superclass : #EpLogNode,
	#instVars : [
		'theLog',
		'headReference'
	],
	#category : #EpiceaBrowsers-UI-Graph,
	#timestamp : 'MartinDias 1/20/2017 13:27'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonitorLogNode class>>for: anEpMonitor [

	self flag: #fix.
	
	^ self new
		theLog: anEpMonitor basicLog;
		headReference: anEpMonitor log headReference; 
			"note: this is a workaround given this information is needed to build the references graph,
			but it's not available from 'theLog' when it's empty"
		yourself

]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonitorLogNode>>asMorph [

	^ EpMorphFactory default emphasizedStringFor: self globalName, ' *'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonitorLogNode>>globalName [

	^ theLog store globalName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonitorLogNode>>headReference [
	^ headReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonitorLogNode>>headReference: anObject [
	headReference := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonitorLogNode>>isMonitor [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonitorLogNode>>log [
	^ theLog
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonitorLogNode>>modificationTime [

	^ DateAndTime now
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonitorLogNode>>referencedGlobalNamesIfEmptyLog [

	^ headReference isNull
		ifTrue: [ #() ] 
		ifFalse: [ { headReference globalName } ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonitorLogNode>>theLog [
	^ theLog
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonitorLogNode>>theLog: anObject [
	theLog := anObject
]
