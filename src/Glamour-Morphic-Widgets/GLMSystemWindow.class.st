"
This is the window in which the Glamour browsers are rendered in Morphic.
"
Class {
	#name : #GLMSystemWindow,
	#superclass : #StandardWindow,
	#instVars : [
		'toolbarBox',
		'hasInitialStep'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : 'TudorGirba 1/27/2011 22:09'
}

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSystemWindow>>actOnWindowRequest: ann [

	ann action value: self	
]

{
	#category : #announcement,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSystemWindow>>allKeystrokeActions [
	^ self model notNil 
		ifTrue: [
			(self model allActions, self model allSelectionActions) select: [ :action | 
				action hasShortcut ]]
		ifFalse: [#()]
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSystemWindow>>delete [
	self model notNil ifTrue: [self model unregisterFromAllAnnouncements].
	super delete
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSystemWindow>>extent: aPoint  [
	super extent: aPoint.
	self fullBounds
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSystemWindow>>handleKeyStroke: anEvent [
	| action |
	action := self allKeystrokeActions detect: [:a | 
		anEvent commandKeyPressed and: [ 
			a shortcut = anEvent keyCharacter ]] ifNone: [nil].
	action ifNotNil: [ self announcer announce: (GLMKeyStroke action: action) ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSystemWindow>>initialize  [
	super initialize.
	self
		on: #keyStroke 
		send: #handleKeyStroke: 
		to: self.
	hasInitialStep := false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSystemWindow>>setLabelWidgetAllowance [
	^ labelWidgetAllowance :=  super setLabelWidgetAllowance +
		(toolbarBox
			ifNil: [ 0 ]
			ifNotNil: [ :toolbar | toolbarBox width ])
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSystemWindow>>stepAt: millisecondClockValue [
	"An alarm will also be fired the first time the window is opened, 
	even if stepTime was not reached. Ignore the very first step."
	hasInitialStep ifFalse: [ 
		hasInitialStep := true.
		^ self ].
	super stepAt: millisecondClockValue
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSystemWindow>>stepTime [
	^ self model stepTime
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSystemWindow>>toolbarBox: anObject [
	| previousToolbar |
	
	previousToolbar := toolbarBox ifNil: [ menuBox ].
	
	toolbarBox := anObject.
	self setLabelWidgetAllowance.
	self replacePane: previousToolbar with: toolbarBox
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSystemWindow>>wantsSteps [
	^ self model wantsSteps
]

{
	#category : #announcement,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSystemWindow>>when: anAnnouncement do: aBlock  [
	^ self announcer when: anAnnouncement do: aBlock
]
