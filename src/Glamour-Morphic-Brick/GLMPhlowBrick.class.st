"

"
Class {
	#name : #GLMPhlowBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'entity',
		'titleBrick'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Phlow,
	#timestamp : ''
}

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowBrick>>display: aBlockOrSymbol [

	self subclassResponsibility
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowBrick>>entity [

	^ entity
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowBrick>>entity: anObject [

	entity := anObject.
	self setTitle: (self titleLogic phlowValue: self entity)
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowBrick>>initialize [
	super initialize.
		
	self
		useVerticalLinearLayout;
		titleBrick: self newTitleBrick;
		hSpaceFill;
		vSpaceFill
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowBrick>>newTitleBrick [

	^ GLMLabelBrick new
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowBrick>>onThemerChanged [
	super onThemerChanged.
	
	self titleBrick textColor: self themer textLightColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowBrick>>setTitle: aString [

	self titleBrick text: aString.
	
	titleBrick height: (
		(aString isEmpty | aString isNil)
			ifFalse: [ 30 ]
			ifTrue: [ 0 ])
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowBrick>>title: anObject [
	
	self setProperty: #phlowTitle toValue: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowBrick>>titleBrick [
	^ titleBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowBrick>>titleBrick: aBrick [

	titleBrick := aBrick
		textPosition: #center;
		height: 0;
		hSpaceFill.
	self addBrickBack: titleBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowBrick>>titleLogic [

	^ self valueOfProperty: #phlowTitle ifAbsent: [ '' ]
]
