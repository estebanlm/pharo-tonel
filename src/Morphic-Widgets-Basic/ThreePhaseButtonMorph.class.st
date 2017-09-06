"
A button morph with separate images for on, off, and pressed with the mouse. 

When the event actWhen occurs, send actionSelector with 'arguments' to target.  For other events, default to my eventHandler.  The current event is not supplied in the arguments to the actionSelector.  

image (a.k.a. onImage) may not be nil.  offImage and pressedImage may be nil.  nil there means be transparent and show the underlying object.  

Tools for debugging:
Display the images momentarily under program control (for positioning) (self is an instance).
	self state: #on.  self state: #off.
	self state: #pressed.  self state: #off.
Display a rectangle where the button is.
	Display fillWithColor: bounds + (self world viewBox origin).
	self invalidRect: bounds.
"
Class {
	#name : #ThreePhaseButtonMorph,
	#superclass : #ImageMorph,
	#instVars : [
		'offImage',
		'pressedImage',
		'state',
		'target',
		'actionSelector',
		'arguments',
		'actWhen'
	],
	#category : #Morphic-Widgets-Basic-Buttons,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph class>>checkBox [
	"Answer a button pre-initialized with checkbox images."

	| f |
	^ self new
		onImage: (f := self iconNamed: #checkBoxOnIcon);
		pressedImage: (self iconNamed: #checkBoxPressedIcon);
		offImage: (self iconNamed: #checkBoxOffIcon);
		extent: f extent + (2 @ 0);
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph class>>radioButton [
	"Answer a button pre-initialized with radiobutton images."

	| f |
	^ self new
		onImage: (f := self iconNamed: #radioButtonOnIcon);
		pressedImage: (self iconNamed: #radioButtonPressedIcon);
		offImage: (self iconNamed: #radioButtonOffIcon);
		extent: f extent + (2 @ 0);
		yourself
]

{
	#category : #submorphs-add/remove,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>actWhen: condition [
	"Accepts symbols:  #buttonDown, #buttonUp, and #whilePressed"
	actWhen := condition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>actionSelector [

	^ actionSelector

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>actionSelector: aSymbolOrString [

	(nil = aSymbolOrString or:
	 ['nil' = aSymbolOrString or:
	 [aSymbolOrString isEmpty]])
		ifTrue: [^ actionSelector := nil].

	actionSelector := aSymbolOrString asSymbol.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>arguments [
	^ arguments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>arguments: aCollection [

	arguments := aCollection asArray copy.

]

{
	#category : #button,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>doButtonAction [
	"Perform the action of this button. Subclasses may override this method. The default behavior is to send the button's actionSelector to its target object with its arguments."

	(target notNil and: [actionSelector notNil]) 
		ifTrue: 
			[Cursor normal 
				showWhile: [target perform: actionSelector withArguments: arguments].
			target isMorph ifTrue: [target changed]]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>doButtonAction: evt [
	
	"Perform the action of this button. Subclasses may override this method. The default behavior is to send the button's actionSelector to its target object with its arguments."

	target ifNil: [^self].
	actionSelector ifNil: [^self].
	Cursor normal showWhile: [ | moreArgs |
		moreArgs := actionSelector numArgs > arguments size ifTrue: [
			arguments copyWith: evt
		] ifFalse: [
			arguments
		].
		target perform: actionSelector withArguments: moreArgs
	]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>drawOn: aCanvas [

	state == #off ifTrue: [
		offImage ifNotNil: [aCanvas translucentImage: offImage at: bounds origin]].
	state == #pressed ifTrue: [
		pressedImage ifNotNil: [aCanvas translucentImage: pressedImage at: bounds origin]].
	state == #on ifTrue: [
		image ifNotNil: [aCanvas translucentImage: image at: bounds origin]].
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>extent: aPoint [
	"Do it normally"
	
	self changed.
	bounds := bounds topLeft extent: aPoint.
	self layoutChanged.
	self changed.

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>handlesMouseDown: evt [

	^ true

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>handlesMouseStillDown: evt [
	^actWhen == #whilePressed
]

{
	#category : #balloon,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>helpText [
	
	^self balloonText
]

{
	#category : #balloon,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>helpText: aString [

	self setBalloonText: aString
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>initialize [

	super initialize.
	state := #off.
	target := nil.
	actionSelector := #flash.
	arguments := EmptyArray.
	actWhen := #buttonUp.

	"self on: #mouseStillDown send: #dragIfAuthoring: to: self."
		"real move should include a call on dragIfAuthoring: "
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>isOn [
	^ state == #on
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>mouseDown: evt [
	| now dt |
	self state: #pressed.
	actWhen == #buttonDown
		ifTrue:
			[self doButtonAction]
		ifFalse:
			[now := Time millisecondClockValue.
			super mouseDown: evt.
			"Allow on:send:to: to set the response to events other than actWhen"
			dt := Time millisecondClockValue - now max: 0.  "Time it took to do"
			dt < 200 ifTrue: [(Delay forMilliseconds: 200-dt) wait]].
	self mouseStillDown: evt.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>mouseMove: evt [
	(self containsPoint: evt cursorPoint)
		ifTrue: [self state: #pressed.
				super mouseMove: evt]
				"Allow on:send:to: to set the response to events other than actWhen"
		ifFalse: [self state: #off].

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>mouseStillDown: evt [
	actWhen == #whilePressed ifFalse:[^self].
	(self containsPoint: evt cursorPoint) ifTrue:[self doButtonAction].
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>mouseUp: evt [
	"Allow on:send:to: to set the response to events other than actWhen"
	actWhen == #buttonUp ifFalse: [^super mouseUp: evt].

	(self containsPoint: evt cursorPoint) ifTrue: [
		self state: #on.
		self doButtonAction: evt
	] ifFalse: [
		self state: #off.
	].
	"Allow owner to keep it selected for radio buttons"

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>offImage [
	^ offImage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>offImage: aForm [
	offImage := aForm.
	self invalidRect: self bounds.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>onImage [
	^ image
]

{
	#category : #button,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>onImage: aForm [
	"The main image is used when on.
	Go through ImageMorph method to set extent."
	
	self image: aForm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>pressedImage [
	^ pressedImage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>pressedImage: aForm [
	pressedImage := aForm.
	self invalidRect: self bounds.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>printOn: aStream  [
	| string |
	aStream nextPutAll: '3PButton'.
	arguments notEmpty 
		ifTrue: [string := arguments at: (2 min: arguments size)].
	aStream nextPutAll: '('.
	(string notNil and: [string ~~ self]) 
		ifTrue: 
			[aStream
				print: string;
				space]
		ifFalse: 
			[aStream
				print: actionSelector;
				space].
	aStream
		print: self identityHash;
		nextPutAll: ')'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>state: newState [
	"Change the image and invalidate the rect."

	newState == state ifTrue: [^ self].
	state := newState.
	self invalidRect: bounds.	"All three images must be the same size"
]

{
	#category : #'stepping and presenter',
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>step [
	(self hasProperty: #doesButtonAction) ifTrue:[
		self doButtonAction.
		self setProperty: #didButtonAction toValue: true.
	].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>stepTime [
	(self hasProperty: #doesButtonAction) ifTrue:[^1].
	^super stepTime
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>target [

	^ target

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>target: anObject [

	target := anObject

]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>veryDeepFixupWith: deepCopier [
	"If target and arguments fields were weakly copied, fix them here.  If they were in the tree being copied, fix them up, otherwise point to the originals!!"

super veryDeepFixupWith: deepCopier.
target := deepCopier references at: target ifAbsent: [target].
arguments := arguments collect: [:each |
	deepCopier references at: each ifAbsent: [each]].

]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>veryDeepInner: deepCopier [
	"Copy all of my instance variables.  Some need to be not copied at all, but shared.  	Warning!!  Every instance variable defined in this class must be handled.  We must also implement veryDeepFixupWith:.  See DeepCopier class comment."

super veryDeepInner: deepCopier.
offImage := offImage veryDeepCopyWith: deepCopier.
pressedImage := pressedImage veryDeepCopyWith: deepCopier.
state := state veryDeepCopyWith: deepCopier.
"target := target.		Weakly copied"
"actionSelector := actionSelector.		Symbol"
"arguments := arguments.		Weakly copied"
actWhen := actWhen.		"Symbol"
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ThreePhaseButtonMorph>>wantsSteps [
	^self hasProperty: #doesButtonAction
]
