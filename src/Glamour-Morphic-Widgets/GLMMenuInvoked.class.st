"

"
Class {
	#name : #GLMMenuInvoked,
	#superclass : #GLMActionAnnouncement,
	#instVars : [
		'menuMorph'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMenuInvoked class>>action: anAction on: aMenuMorph  [
	^self new initializeAction: anAction on: aMenuMorph
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMenuInvoked>>initializeAction: anAction on: aMenuMorph  [
	self action: anAction.
	menuMorph := aMenuMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMenuInvoked>>menuMorph [
	^menuMorph
]
