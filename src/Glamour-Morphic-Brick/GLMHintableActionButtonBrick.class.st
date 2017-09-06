"

"
Class {
	#name : #GLMHintableActionButtonBrick,
	#superclass : #GLMActionButtonBrick,
	#instVars : [
		'hintTitle',
		'hintText',
		'hintDelay',
		'hintModifier'
	],
	#classInstVars : [
		'asyncTask',
		'hintBrick'
	],
	#category : #Glamour-Morphic-Brick-Widgets-UI,
	#timestamp : ''
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick class>>asyncTaskUniqueInstance [

	^ asyncTask ifNil: [ asyncTask := GLMAsyncTask new ]
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick class>>cleanUp [

	self closeHint.
	self reset.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick class>>closeHint [

	self asyncTaskUniqueInstance ifNotNil: #terminate.
	self hintBrickUniqueInstance ifNotNil: #close
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick class>>hintBrickUniqueInstance [

	^ hintBrick
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick class>>openHint: aHintString title: aTitleString type: aTypeSymbol for: aBrick [
	|brick|
	
	self closeHint.
	brick :=  GLMPopupBrick new
		beUpward;
		hintText: aHintString;
		titleText: aTitleString;
		perform: aTypeSymbol withEnoughArguments: {  };
		openOn: aBrick.
		
	hintBrick := brick
		
	
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick class>>reset [

	self closeHint.
	asyncTask := nil.
	hintBrick := nil.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>beError [

	self beMode: #beError
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>beHelp [

	self beMode: #beHelp
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>beMode: aMode [

	self hoverAction: [ :aBrick :evt |
			self class asyncTaskUniqueInstance
				perform: [ self isInWorld ifTrue: [ self class openHint: self hintText title: self hintTitle type: aMode for: self ] ]
				delay: ((self isModifierPressed: evt) ifTrue: [ 0 ] ifFalse: [ self hintDelay ]) ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>beNormal [

	self beMode: #beNormal
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>beSuccess [

	self beMode: #beSuccess
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>click: evt [
	|result|
	result := super click: evt.
	self class asyncTaskUniqueInstance terminate.
	self class reset.
	^ result
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>hintDelay [

	^ hintDelay ifNil: [ hintDelay := 700 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>hintDelay: anObject [
	hintDelay := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>hintModifier [

	^ hintModifier ifNil: [ hintModifier := #shift ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>hintModifier: anObject [

	hintModifier := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>hintText [

	^ hintText ifNil: [ hintText := 'Need help?' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>hintText: anObject [

	hintText := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>hintTitle [

	^ hintTitle ifNil: [ hintTitle := 'Hi,' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>hintTitle: anObject [
	hintTitle := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>initialize [
	super initialize.
	
	self beHelp.
	self unhoverAction: [ :aBrick :anEvent |
		self class asyncTaskUniqueInstance terminate.
		(aBrick globalBounds containsPoint: anEvent position)
			ifFalse: [ self class 
				closeHint;
				reset ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>isModifierPressed: anEvent [

	self hintModifier ifNil: [ ^ false ].
	self hintModifier = #shift ifTrue: [ ^ anEvent shiftPressed ].
	self hintModifier = #option ifTrue: [ ^ anEvent optionKeyPressed ].
	self hintModifier = #alt ifTrue: [ ^ anEvent altKeyPressed ].
	self hintModifier = #command ifTrue: [ ^ anEvent commandKeyPressed ].
	self hintModifier = #control ifTrue: [ ^ anEvent controlKeyPressed ].
	^ false
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHintableActionButtonBrick>>press [
	super press.
	
	self class asyncTaskUniqueInstance terminate.
	self class reset.
]
