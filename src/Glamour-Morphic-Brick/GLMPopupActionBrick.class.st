"
I am a special popup brick designed to work with GLMPopupAction
"
Class {
	#name : #GLMPopupActionBrick,
	#superclass : #GLMEmptyPopupBrick,
	#instVars : [
		'onCreatedBlock'
	],
	#category : #Glamour-Morphic-Brick-Widgets-UI-Popup,
	#timestamp : 'AliakseiSyrel 2/28/2017 08:58'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupActionBrick>>initialize [
	super initialize.
	
	self themer: self themer actionThemer.
	onCreatedBlock := [  ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupActionBrick>>onCreated [
	| theContentBricks |
	
	theContentBricks := onCreatedBlock brickValue: self withEnoughArguments: { self triggerBrick }.
	theContentBricks := theContentBricks asOrderedCollection select: #isNotNil.
	self contentBrick addAllBricks: theContentBricks
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupActionBrick>>onCreated: aBlock [
	onCreatedBlock := aBlock
]
