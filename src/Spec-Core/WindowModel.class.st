"
A WindowModel is a spec model for a Window
"
Class {
	#name : #WindowModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'model',
		'initialExtent',
		'title',
		'isClosedHolder',
		'isResizeable'
	],
	#category : #Spec-Core-Support,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel class>>adapterName [

	^ #WindowAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel class>>defaultSpec [
	<spec>
	
	^ #(WindowAdapter
		adapt: #(model))
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>aboutText [
	"if my aboutText has not been set the fallback is:
	  - if I do have a model, use its' about text
	  - else use the behavior defined in super
	"

	^aboutText value
		ifNil: [self model
			ifNil: [ super aboutText ]
			ifNotNil: [:m | m aboutText ]]
		ifNotNil: [ aboutText value ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>aboutTitle [
	"Answer the title of my About window"

	(self model respondsTo: #aboutTitle)
		ifTrue: [^self model aboutTitle].
	^(self model respondsTo: #toolName)
		ifTrue: [self model toolName]
		ifFalse: [self model class name].

]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>addMenuItemsToWindowMenu: aMenu [

	self model addMenuItemsToWindowMenu: aMenu
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>addModelIn: widget withSpec: aSpec [

	self model ifNil: [ ^ self ].
	
	self changed: #addModelIn:withSpec: with: { widget . aSpec }
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>addModelIn: widget withSpecLayout: aSpec [

	self model ifNil: [ ^ self ].
	
	self changed: #addModelIn:withSpecLayout: with: { widget . aSpec }
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>addModelItemsToWindowMenu: aMenu [

	self model addModelItemsToWindowMenu: aMenu
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>askOkToClose [

	^ self model askOkToClose
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>buildWithSpecLayout: aSpec [
	"Build the widget using the spec name provided as argument"
	| adapter widget |
	
	(self spec notNil and: [ self needRebuild not ])
		ifTrue: [ widget := self spec instance ]
		ifFalse: [
			adapter := self privateAdapterFromModel: self withSpec: self defaultSpecSelector.
			widget := adapter widget.
			self addModelIn: widget withSpecLayout: aSpec ].

	self ensureExtentFor: widget.
	
	^ widget
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>cancelled [

	^ false
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>centered [

	self changed: #centered with: #()
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>centeredRelativeTo: aModel [

	self changed: #centeredRelativeTo: with: { aModel }
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>close [

	self changed: #close with: #()
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>defaultInitialExtent [
	
	^ 400@300
]

{
	#category : #focus,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>giveFocusToNextFrom: aModel  [

	^ self model giveFocusToNextFrom: aModel
]

{
	#category : #focus,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>giveFocusToPreviousFrom: aModel  [

	^ self model giveFocusToPreviousFrom: aModel 
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>initialExtent [

	^ initialExtent value
		ifNil: [ self model 
			ifNil: [ self defaultInitialExtent ]
			ifNotNil: [:m | m extent
				ifNil: [ m initialExtent
					ifNil: [ self defaultInitialExtent ] ] ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>initialize [

	super initialize.

	model := nil asValueHolder.
	initialExtent := nil asValueHolder.
	title := self class title asValueHolder.
	isClosedHolder := false asValueHolder.
	isResizeable := true asValueHolder.
	
	model whenChangedDo: [:m | self updateTitle ].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>isClosed [
	^ isClosedHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>isDisplayed [

	^ self window ifNil: [ false ] ifNotNil: [ :theWindow | theWindow isDisplayed ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>isResizeable [

	^ isResizeable value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>isResizeable: aBoolean [

	isResizeable value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>maximize [

	self changed: #maximize with: #()
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>minimize [

	self changed: #minimize with: #()
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>modalRelativeTo: aWindow [

	self changed: #modalRelativeTo: with: { aWindow }
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>model [
	
	^ model value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>model: aModel [

	model value: aModel
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>okToChange [

	^ self model okToChange
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>openModal: aWindow  [

	self changed: #openModal: with: { aWindow }
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>openWithSpecLayout: aSpec [

	window value: (self buildWithSpecLayout: aSpec).
	self changed: #open with: #().
	self updateTitle.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>rebuildWithSpec: aSpec [

	self changed: #rebuildWithSpec: with: { aSpec }.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>rebuildWithSpecLayout: aSpec [

	self changed: #rebuildWithSpecLayout: with: { aSpec }
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>taskbarIcon [

	^ model value 
		ifNil: [ super taskbarIcon ]
		ifNotNil: [ :m |
			m windowIcon
				ifNil: [ m taskbarIcon ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>title [

	^ self model
		ifNil: [ super title ]
		ifNotNil: [:m | m title ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>title: aString [

	self changed: #title: with: { aString }
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>triggerCancelAction [
	"do nothing (ensure polymorphism with DialogWindow)"
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>triggerOkAction [
	"do nothing (ensure polymorphism with DialogWindow)"
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>updateTitle [
	"Update the window title"

	self title: self title
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>whenClosedDo: aBlock [

	isClosedHolder whenChangedDo: [:value |
		value ifTrue: [ aBlock value ] ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:18'
}
WindowModel>>windowIsClosing [

	isClosedHolder value: true.
	
	self model windowIsClosing 
]
