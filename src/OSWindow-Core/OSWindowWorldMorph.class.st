"
I am a morphic world that uses OSWindow.

For opening a World in a external window, the following script can be used:

world := OSWindowWorldMorph new.
world open.

"
Class {
	#name : #OSWindowWorldMorph,
	#superclass : #WorldMorph,
	#instVars : [
		'display',
		'closeCallback',
		'isResizeable'
	],
	#category : #OSWindow-Core-Morphic,
	#timestamp : 'RonieSalgado 9/4/2016 22:31'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>addMorph: aMorph frame: rectangle [
	"For compatibility with SystemWindow."
	^ self addMorph: aMorph fullFrame: rectangle 


]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>closeCallback [
	^ closeCallback
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>closeCallback: anObject [
	self flag: 'Do something better than just storing a closure.'.
	closeCallback := anObject
]

{
	#category : #submorphs-add/remove,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>delete [
	closeCallback value.
	self class removeExtraWorld: self.
	osWindow destroy.
	super delete
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>display [
	self updateDisplay.
	^ display
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>initialize [
	super initialize.
	self color: Color veryLightGray.
	isResizeable := true.
	self extent: 640@480.
	worldState := OSWindowWorldState new.
	self addHand: HandMorph new.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>isResizeable [
	^ isResizeable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>isResizeable: anObject [
	isResizeable := anObject
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>open [
	self osWindow.
	self changed.
	self class addExtraWorld: self.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>openInWorld [
	^ self open
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>osWindowCloseButtonPressed [
	self delete
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>osWindowRenderer [
	^ self osWindow renderer ifNil: [
		self osWindow newFormRenderer: self display.
		self osWindow renderer
	].
	
]

{
	#category : #'session management',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>recreateOSWindow [
	| attributes driver |
	session := Smalltalk session.
	attributes := OSWindowAttributes new.
	attributes
		extent: self extent;
		title: Smalltalk shortImageName;
		icon: (self iconNamed: #pharoIcon);
		resizable: isResizeable.
	self updateDisplay.
	driver := self pickMostSuitableWindowDriver.
	attributes preferableDriver: driver.
	osWindow := OSWindow createWithAttributes: attributes.
	osWindow newFormRenderer: display.
	osWindow eventHandler: (OSWindowMorphicEventHandler for: self)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>title: aTitle [
	self flag: 'ToDo'
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorph>>updateDisplay [
	display isNil ifTrue: [
		display := Form extent: self extent depth: 32.
		worldState display: display
	]
]
