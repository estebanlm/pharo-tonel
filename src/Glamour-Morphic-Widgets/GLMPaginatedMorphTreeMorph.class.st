"

"
Class {
	#name : #GLMPaginatedMorphTreeMorph,
	#superclass : #PaginatedMorphTreeMorph,
	#instVars : [
		'stopStepping'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPaginatedMorphTreeMorph>>step [

	self window ifNil: [ ^ self ].
	self window isActive ifFalse: [ ^ self ].
	(self wantsSteps and: [ self model shouldDoStep ]) ifFalse: [ ^ self ].
	(self window boundsInWorld containsRect: self boundsInWorld) ifFalse: [ ^ self ].
	self model updateRoots.
	self updateList
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPaginatedMorphTreeMorph>>stepTime [
	^ self model stepTime
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPaginatedMorphTreeMorph>>wantsSteps [
	^ self model wantsSteps
]
