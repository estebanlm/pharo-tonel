"

"
Class {
	#name : #GLMPhlowTableBrick,
	#superclass : #GLMPhlowListBrick,
	#instVars : [
		'transformedEntity',
		'columns'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Phlow,
	#timestamp : ''
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableBrick class>>example [
	
	^ GLMCompositeBrick gtExampleTable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableBrick>>addColumn: aColumn [

	self columns add: aColumn
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableBrick>>column: anObject evaluated: otherObject [

	self column: anObject evaluated: otherObject styled: nil
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableBrick>>column: anObject evaluated: otherObject styled: anotherObject [

	self addColumn: (GLMPhlowTableColumn new 
		title: anObject;
		computation: otherObject;
		style: anotherObject)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableBrick>>columns [

	^ columns ifNil: [ columns := OrderedCollection new ]
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableBrick>>display: anObject [
	
	self setProperty: #phlowDisplay toValue: anObject
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableBrick>>displayLogic [

	^ self valueOfProperty: #phlowDisplay ifAbsent: [ #yourself ]
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableBrick>>entity: anObject [

	self transformedEntity: (self displayLogic phlowValue: anObject).
	super entity: anObject.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableBrick>>setAdaptor [
	| adaptor |
	adaptor := (GLMBrickListModel on: self transformedEntity)
		morphAtLogic: [ :index | 
			GLMPhlowTableRowBrick new
				in: self;
				entity: (self transformedEntity at: index) ].
	self listBrick model: adaptor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableBrick>>transformedEntity [

	^ transformedEntity
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableBrick>>transformedEntity: anObject [

	transformedEntity := anObject
]
