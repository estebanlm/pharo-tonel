"

"
Class {
	#name : #GLMPhlowListBrick,
	#superclass : #GLMPhlowBrick,
	#instVars : [
		'scrollList'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Phlow,
	#timestamp : ''
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowListBrick class>>example [
	
	^ GLMCompositeBrick gtExampleList
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowListBrick class>>example2 [
	
	^ GLMCompositeBrick gtExampleListWithCustomItems
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowListBrick>>display: anObject [

	self setProperty: #phlowDisplay toValue: anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowListBrick>>displayLogic [

	^ self valueOfProperty: #phlowDisplay ifAbsent: [ #yourself ]
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowListBrick>>entity: anObject [

	super entity: anObject.
	self setAdaptor
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowListBrick>>format: anObject [

	self setProperty: #phlowFormat toValue: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowListBrick>>formatLogic [

	^ self valueOfProperty: #phlowFormat ifAbsent: [ #yourself ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowListBrick>>initialize [
	super initialize.
		
	self listBrick: self newScrollList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowListBrick>>listBrick [

	^ scrollList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowListBrick>>listBrick: aBrick [

	scrollList := aBrick.
	self listBrick
		vSpaceFill;
		hSpaceFill.
		
	self addBrickBack: self listBrick
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowListBrick>>newScrollList [

	^ GLMFallbackScrollListBrick"GLMScrollListBrick" new
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowListBrick>>setAdaptor [
	| adaptor |
	adaptor := (GLMBrickListModel on: self entity)
		morphAtLogic: [ :index :morph |
			self styledLogic
				phlowValue: (self formatLogic phlowValue: (self displayLogic phlowValue: (self entity at: index))) asBrick ].
	self listBrick model: adaptor
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowListBrick>>styled: anObject [
	
	self setProperty: #phlowStyled toValue: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPhlowListBrick>>styledLogic [
	
	^ self valueOfProperty: #phlowStyled ifAbsent: [ #yourself ]
]
