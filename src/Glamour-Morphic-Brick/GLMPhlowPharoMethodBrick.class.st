"

"
Class {
	#name : #GLMPhlowPharoMethodBrick,
	#superclass : #GLMPhlowTextBrick,
	#category : #Glamour-Morphic-Brick-Widgets-Phlow,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowPharoMethodBrick>>getText [
	^ self displayLogic phlowValue: self entity
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowPharoMethodBrick>>installEntity [
	self textBrick model: self.
	self textBrick classOrMetaClass: (self smalltalkClassLogic phlowValue: self entity).
	self textBrick setTextWith: (self displayLogic phlowValue: self entity).
	self textBrick selectionInterval: (self selectionInterval phlowValue: self entity)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowPharoMethodBrick>>interactionModel [
	^ self
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowPharoMethodBrick>>smalltalkClass: anObject [
	
	self setProperty: #phlowSmalltalkClass toValue: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowPharoMethodBrick>>smalltalkClassLogic [

	^ self valueOfProperty: #phlowSmalltalkClass ifAbsent: [ #yourself ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowPharoMethodBrick>>textBrick: aBrick [

	super textBrick: aBrick.
	self textBrick beForSmalltalkCode beReadOnly.
]
