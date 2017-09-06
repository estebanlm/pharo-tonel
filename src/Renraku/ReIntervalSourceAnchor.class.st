"
This anchor stores the actual interval object which is set during initialization.
"
Class {
	#name : #ReIntervalSourceAnchor,
	#superclass : #ReSourceAnchor,
	#instVars : [
		'interval'
	],
	#category : #Renraku-SourceAnchors,
	#timestamp : 'YuriyTymchuk 7/10/2016 12:59'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReIntervalSourceAnchor class>>entity: anEntity interval: anInterval  [
	
	^ self basicNew
		initializeEnitity: anEntity
		interval: anInterval;
		yourself
]

{
	#category : #gt-inspector-extension,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReIntervalSourceAnchor>>gtInspectorAnchorIn: composite [
	<gtInspectorPresentationOrder: 0>

	(super gtInspectorAnchorIn: composite)
		initialize: [ :p | p selectionInterval: interval ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReIntervalSourceAnchor>>initializeEnitity: anEntiy interval: anInterval  [
	
	self initializeEnitity: anEntiy.
	interval := anInterval 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReIntervalSourceAnchor>>interval [

	^ interval 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReIntervalSourceAnchor>>providesInterval [

	^ true
]
