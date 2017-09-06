"
A GLMLiveLabelBrick is simple extended label brick that updates text every world step. Text logic can be set by sending textLogic: message to me.

Instance Variables
	textLogic:		<BlockClosure>

textLogic
	- defines text updating logic

"
Class {
	#name : #GLMLiveLabelBrick,
	#superclass : #GLMLabelBrick,
	#instVars : [
		'textLogic'
	],
	#category : #Glamour-Morphic-Brick-Widgets-UI,
	#timestamp : 'AliakseiSyrel 3/19/2015 13:23'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLiveLabelBrick>>initialize [
	super initialize.
	textLogic := [ :x | x ]
]

{
	#category : #'stepping and presenter',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLiveLabelBrick>>step [
	|newText|
	newText := self textLogic value asString.
	self text = newText ifTrue:  [ ^ self ].
	self text: newText.
	self doLayoutForce
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLiveLabelBrick>>textLogic  [
	^ textLogic
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLiveLabelBrick>>textLogic: aBlock [
	textLogic := aBlock
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLiveLabelBrick>>wantsSteps [
	^ true
]
