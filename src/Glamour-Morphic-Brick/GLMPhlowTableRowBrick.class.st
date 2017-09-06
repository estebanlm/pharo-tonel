"

"
Class {
	#name : #GLMPhlowTableRowBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'entity',
		'table'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Phlow,
	#timestamp : ''
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableRowBrick>>addColumn: aColumn [
	|brick|
	brick := (aColumn computation phlowValue: self entity) asBrick.
	brick := aColumn style phlowValue: brick.
	^ self addBrickBack: brick
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableRowBrick>>entity [

	^ entity
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableRowBrick>>entity: anObject [
	
	entity := anObject.
	self initializeColumns.
]

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableRowBrick>>in: aTableBrick [

	table := aTableBrick.
	self initializeColumns.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableRowBrick>>initialize [
	super initialize.
	
	"My height is the height of the tallest subbrick"
	self
		vShrinkWrap;
		hSpaceFill
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableRowBrick>>initializeColumns [
	"you can initialize only if entity and table both not nil"
	self removeAllBricks.
	(self entity isNil | self table isNil) ifTrue: [ ^ self ].
	self table columns do: [ :each | self addColumn: each ].
	self updateWidthPercentage
]

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableRowBrick>>table [

	^ table
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowTableRowBrick>>updateWidthPercentage [
	
	self subbricks ifEmpty: [ ^ self ].
	self subbricks do: [ :each | each hSpaceFill: (100 / self subbricksCount) ]
]
