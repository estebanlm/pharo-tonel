"
Use me in case something went wrong on production
"
Class {
	#name : #GLMFallbackScrollListBrick,
	#superclass : #GLMScrollPaneBrick,
	#instVars : [
		'adaptor',
		'emptyBrick'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Scrollpane,
	#timestamp : 'AliakseiSyrel 1/24/2015 18:21'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFallbackScrollListBrick>>emptyBrick [

	^ emptyBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFallbackScrollListBrick>>emptyBrick: aBrick [
	
	emptyBrick := aBrick
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFallbackScrollListBrick>>initializeItems [
	
	self band layoutAfter: [
		1 to: self model count do: [ :index |
			self band addBrickBack: ((self model morphAt: index convert: nil) asBrick with:[:b |
				b brickApi layout vState isOnParent ifTrue: [ b height: 30 ]]) ] ].
	
	self band hasSubbricks ifFalse: [ self emptyBrick ifNotNil: [ :b | self band addBrickBack: b ] ].
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFallbackScrollListBrick>>invalidate [

	self band removeAllBricks.
	self initializeItems.
	self doLayoutForce.
	self update.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFallbackScrollListBrick>>model [

	^ adaptor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFallbackScrollListBrick>>model: anAdaptor [

	adaptor := anAdaptor.
	self initializeItems
]
