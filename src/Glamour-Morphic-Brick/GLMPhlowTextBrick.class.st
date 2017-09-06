"

"
Class {
	#name : #GLMPhlowTextBrick,
	#superclass : #GLMPhlowBrick,
	#instVars : [
		'textBrick'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Phlow,
	#timestamp : ''
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTextBrick class>>example [
	
	^ GLMCompositeBrick gtExamplePharoMethod
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTextBrick>>display: anObject [

	self setProperty: #phlowDisplay toValue: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTextBrick>>displayLogic [

	^ self valueOfProperty: #phlowDisplay ifAbsent: [ #yourself ]
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTextBrick>>entity: anObject [
	super entity: anObject.
	
	self installEntity
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTextBrick>>initialize [
	super initialize.
	
	self textBrick: self newTextBrick.
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTextBrick>>installEntity [
	self textBrick setTextWith: (self displayLogic phlowValue: self entity).
	self textBrick selectionInterval: (self selectionInterval phlowValue: self entity)
	
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTextBrick>>newTextBrick [

	^ GLMRubScrolledTextBrick new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTextBrick>>selectionInterval [
	
	^ self valueOfProperty: #phlowSelectionInterval ifAbsent: [ 1 to: 0 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTextBrick>>selectionInterval: anObject [
	
	self setProperty: #phlowSelectionInterval toValue: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTextBrick>>textBrick [

	^ textBrick
	

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTextBrick>>textBrick: aBrick [

	textBrick := aBrick.
	self textBrick
		wrapped: true.
		
	self textBrick layoutProperties
		vSpaceFill;
		hSpaceFill.
	self addBrickBack: self textBrick
	

]
