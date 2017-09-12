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
	#category : #Spec-Core-Support
}

{ #category : #specs }
WindowModel class >> adapterName [

	^ #WindowAdapter
]

{ #category : #specs }
WindowModel class >> defaultSpec [
	<spec>
	
	^ #(WindowAdapter
		adapt: #(model))
]

{ #category : #api }
WindowModel >> aboutText [
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

{ #category : #api }
WindowModel >> aboutTitle [
	"Answer the title of my About window"

	(self model respondsTo: #aboutTitle)
		ifTrue: [^self model aboutTitle].
	^(self model respondsTo: #toolName)
		ifTrue: [self model toolName]
		ifFalse: [self model class name].

]

{ #category : #menu }
WindowModel >> addMenuItemsToWindowMenu: aMenu [

	self model addMenuItemsToWindowMenu: aMenu
]

{ #category : #private }
WindowModel >> addModelIn: widget withSpec: aSpec [

	self model ifNil: [ ^ self ].
	
	self changed: #addModelIn:withSpec: with: { widget . aSpec }
]

{ #category : #private }
WindowModel >> addModelIn: widget withSpecLayout: aSpec [

	self model ifNil: [ ^ self ].
	
	self changed: #addModelIn:withSpecLayout: with: { widget . aSpec }
]

{ #category : #menu }
WindowModel >> addModelItemsToWindowMenu: aMenu [

	self model addModelItemsToWindowMenu: aMenu
]

{ #category : #api }
WindowModel >> askOkToClose [

	^ self model askOkToClose
]

{ #category : #private }
WindowModel >> buildWithSpecLayout: aSpec [
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

{ #category : #api }
WindowModel >> cancelled [

	^ false
]

{ #category : #api }
WindowModel >> centered [

	self changed: #centered with: #()
]

{ #category : #api }
WindowModel >> centeredRelativeTo: aModel [

	self changed: #centeredRelativeTo: with: { aModel }
]

{ #category : #api }
WindowModel >> close [

	self changed: #close with: #()
]

{ #category : #private }
WindowModel >> defaultInitialExtent [
	
	^ 400@300
]

{ #category : #focus }
WindowModel >> giveFocusToNextFrom: aModel [ 

	^ self model giveFocusToNextFrom: aModel
]

{ #category : #focus }
WindowModel >> giveFocusToPreviousFrom: aModel [ 

	^ self model giveFocusToPreviousFrom: aModel 
]

{ #category : #api }
WindowModel >> initialExtent [

	^ initialExtent value
		ifNil: [ self model 
			ifNil: [ self defaultInitialExtent ]
			ifNotNil: [:m | m extent
				ifNil: [ m initialExtent
					ifNil: [ self defaultInitialExtent ] ] ] ]
]

{ #category : #initialization }
WindowModel >> initialize [

	super initialize.

	model := nil asValueHolder.
	initialExtent := nil asValueHolder.
	title := self class title asValueHolder.
	isClosedHolder := false asValueHolder.
	isResizeable := true asValueHolder.
	
	model whenChangedDo: [:m | self updateTitle ].
]

{ #category : #testing }
WindowModel >> isClosed [
	^ isClosedHolder value
]

{ #category : #api }
WindowModel >> isDisplayed [

	^ self window ifNil: [ false ] ifNotNil: [ :theWindow | theWindow isDisplayed ]
]

{ #category : #api }
WindowModel >> isResizeable [

	^ isResizeable value
]

{ #category : #api }
WindowModel >> isResizeable: aBoolean [

	isResizeable value: aBoolean
]

{ #category : #api }
WindowModel >> maximize [

	self changed: #maximize with: #()
]

{ #category : #api }
WindowModel >> minimize [

	self changed: #minimize with: #()
]

{ #category : #api }
WindowModel >> modalRelativeTo: aWindow [

	self changed: #modalRelativeTo: with: { aWindow }
]

{ #category : #accessing }
WindowModel >> model [
	
	^ model value
]

{ #category : #api }
WindowModel >> model: aModel [

	model value: aModel
]

{ #category : #private }
WindowModel >> okToChange [

	^ self model okToChange
]

{ #category : #api }
WindowModel >> openModal: aWindow [ 

	self changed: #openModal: with: { aWindow }
]

{ #category : #private }
WindowModel >> openWithSpecLayout: aSpec [

	window value: (self buildWithSpecLayout: aSpec).
	self changed: #open with: #().
	self updateTitle.
]

{ #category : #private }
WindowModel >> rebuildWithSpec: aSpec [

	self changed: #rebuildWithSpec: with: { aSpec }.
]

{ #category : #private }
WindowModel >> rebuildWithSpecLayout: aSpec [

	self changed: #rebuildWithSpecLayout: with: { aSpec }
]

{ #category : #api }
WindowModel >> taskbarIcon [

	^ model value 
		ifNil: [ super taskbarIcon ]
		ifNotNil: [ :m |
			m windowIcon
				ifNil: [ m taskbarIcon ] ]
]

{ #category : #private }
WindowModel >> title [

	^ self model
		ifNil: [ super title ]
		ifNotNil: [:m | m title ]
]

{ #category : #private }
WindowModel >> title: aString [

	self changed: #title: with: { aString }
]

{ #category : #api }
WindowModel >> triggerCancelAction [
	"do nothing (ensure polymorphism with DialogWindow)"
]

{ #category : #api }
WindowModel >> triggerOkAction [
	"do nothing (ensure polymorphism with DialogWindow)"
]

{ #category : #private }
WindowModel >> updateTitle [
	"Update the window title"

	self title: self title
]

{ #category : #api-events }
WindowModel >> whenClosedDo: aBlock [

	isClosedHolder whenChangedDo: [:value |
		value ifTrue: [ aBlock value ] ]
]

{ #category : #updating }
WindowModel >> windowIsClosing [

	isClosedHolder value: true.
	
	self model windowIsClosing 
]
