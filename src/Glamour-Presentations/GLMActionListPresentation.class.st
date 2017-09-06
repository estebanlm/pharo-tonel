"
The goal of a GLMActionListPresentation is to group together and display a set of actions.  Actions should be added using the normal API from GLMPresentation.

The rendred will decide the actual way in which the actions are displayed (usually using a set of buttons).

For an example see GLMBasicExamples>>#simpleActionList
"
Class {
	#name : #GLMActionListPresentation,
	#superclass : #GLMFormatedPresentation,
	#instVars : [
		'isHorizontal'
	],
	#category : #Glamour-Presentations,
	#timestamp : 'AndreiChis 10/3/2014 18:20'
}

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMActionListPresentation>>beVertical [
	self isHorizontal: false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMActionListPresentation>>hasActions [
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMActionListPresentation>>isHorizontal [
	^ isHorizontal ifNil: [isHorizontal := true]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMActionListPresentation>>isHorizontal: anObject [
	isHorizontal := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMActionListPresentation>>isVertical [
	^ self isHorizontal not
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMActionListPresentation>>renderGlamorouslyOn: aRenderer [
	self registerAnnouncements.
	^ aRenderer renderActionListPresentation: self
]
