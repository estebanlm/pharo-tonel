"
I am the adapter used to bridge a WindowModel and a SystemWindow
"
Class {
	#name : #MorphicWindowAdapter,
	#superclass : #AbstractMorphicAdapter,
	#instVars : [
		'isClosedHolder'
	],
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>aboutText [

	^ self model model
		ifNotNil: [ :m | m aboutText ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>aboutTitle [
    ^ self model model
         ifNotNil: [ :m | (m respondsTo: #aboutTitle)
		ifTrue: [m aboutTitle]
		ifFalse: [m class name]].
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>addModelIn: widgetToBuild withSpec: aSpec [
	
	widgetToBuild
		addMorph: (self model model buildWithSpec: aSpec)
		frame: (0@0 corner: 1@1)
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>addModelIn: widgetToBuild withSpecLayout: aSpec [
	
	widgetToBuild
		addMorph: (self model model buildWithSpecLayout: aSpec)
		frame: (0@0 corner: 1@1)
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>addModelItemsToWindowMenu: aMenu [

	self model addMenuItemsToWindowMenu: aMenu
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>askOkToClose [

	^ self model askOkToClose
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>buildWidget [
	^ SpecWindow new
		model: model;
		isResizeable: self isResizeable;
		yourself
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>cancelled [

	^ false
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>centered [

	self widgetDo: [ :w | 
		w
			fullBounds;
			position: Display extent - w extent // 2 ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>centeredRelativeTo: aModel [

	self widgetDo: [ :w | aModel centerWidget: w ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>close [

	self widget ifNotNil: [ :w | w close ].
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>extent: aPoint [

	^ self widget extent: aPoint
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>initialExtent [

	^ self model initialExtent
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>initialize [

	super initialize.

	isClosedHolder := false asValueHolder.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>isDisplayed [

	^ self widget isDisplayed
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>isResizeable [

	^ self model isResizeable
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>isResizeable: aBoolean [

	^ self widgetDo: [ :w | w isResizeable: aBoolean ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>maximize [

	self widgetDo: [ :w | w maximize ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>minimize [

	self widgetDo: [ :w | w minimize ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>modalRelativeTo: aWindow [

	self widgetDo: [ :w | aWindow setModal: w ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>okToChange [
^ self model okToChange
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>open [

	self model window openInWorld
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>openModal: aWindow [

	^ self widget 
		ifNotNil: [:w | w openModal: aWindow asWidget ].
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>rebuildWithSpec: aSpec [
	| sub |
	
	sub := self model window submorphs copy.
	self model window removeAllMorphs.
	sub allButLast do: [:e | self model window addMorphBack: e ].
	self model addModelIn: self widget withSpec: aSpec
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>rebuildWithSpecLayout: aSpec [
	| sub |
	
	sub := self model window submorphs copy.
	self model window removeAllMorphs.
	sub allButLast do: [:e | self model window addMorphBack: e ].
	self model addModelIn: self widget withSpecLayout: aSpec.
	self widget model: self
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>taskbarIcon  [
	^ self model taskbarIcon
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>title [
	^ self model title
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>title: aString [

	^ self widget
		ifNotNil: [:w | w title: aString ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicWindowAdapter>>windowIsClosing [

	self model windowIsClosing
]
