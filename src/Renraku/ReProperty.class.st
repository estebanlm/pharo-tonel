"
I'm an external property of some entity. I have a source anchor to it…
"
Class {
	#name : #ReProperty,
	#superclass : #Model,
	#instVars : [
		'sourceAnchor'
	],
	#category : #Renraku-Critiques,
	#timestamp : 'YuriyTymchuk 1/14/2016 15:26'
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReProperty>>actions  [

	^ #()
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReProperty>>gtInspectorActions [
	^ (self actions collect: [ :act | 
		GLMGenericAction new
			action: [ act actOnCritic: self ofEntity: self sourceAnchor entity ];
		icon: act icon;
		title: act description;
		yourself ]),
	super gtInspectorActions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReProperty>>icon [

	^ Form extent: 16@16 depth: 32
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReProperty>>initializeSourceAnchor: anAnchor [

	self initialize.
	sourceAnchor := anAnchor
]

{
	#category : #deprecated,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReProperty>>isCritic [

	self
		deprecated: 'Please use #isCritique instead'
		transformWith: '`@receiver isCritic' -> '`@receiver isCritique'.
	^ self isCritique
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReProperty>>isCritique [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReProperty>>sourceAnchor [
	^ sourceAnchor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReProperty>>title [

	^ self subclassResponsibility 
]
