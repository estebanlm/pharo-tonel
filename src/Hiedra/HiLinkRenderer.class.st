"
I know how to render a ruler link in an Athens canvas.

Note: an instance of me cannot be used to render in more than one canvas.
"
Class {
	#name : #HiLinkRenderer,
	#superclass : #HiRenderer,
	#instVars : [
		'checkpoints',
		'linkBuilder',
		'rulerBuilder'
	],
	#category : #Hiedra-Rendering,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkRenderer>>addCheckpoint: aPoint [
	checkpoints add: aPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkRenderer>>checkpoints: aCollectionOfPoints [
	checkpoints := aCollectionOfPoints
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkRenderer>>initialize [
	super initialize.
	
	checkpoints := OrderedCollection new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkRenderer>>linkBuilder: aHiLinkBuilder  [
	linkBuilder := aHiLinkBuilder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkRenderer>>linkModel: aHiLinkBuilder  [
	self 
		deprecated: 'Use linkBuilder: instead'
		on: 	'17 March 2016' 
		in: 'Pharo-5.0-50571-'.
	^ self linkBuilder: aHiLinkBuilder 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkRenderer>>rulerBuilder: aHiRulerBuilder  [
	rulerBuilder := aHiRulerBuilder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkRenderer>>rulerModel: aHiRulerBuilder  [
	self 
		deprecated: 'Use rulerBuilder: instead'
		on: 	'17 March 2016' 
		in: 'Pharo-5.0-50571-'.
	^ self rulerBuilder: aHiRulerBuilder 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkRenderer>>setPaint [
"	| paint |
	paint := athensCanvas surface 
		createLinearGradient: { 0 -> linkBuilder color muchLighter.  1 -> linkBuilder color } 
		start: checkpoints first
		stop: checkpoints last.
"
	(athensCanvas setStrokePaint: linkBuilder color) 
		width: linkBuilder width.
		
	athensCanvas paint 
		dashes: linkBuilder dashes 
		offset: 0
]
