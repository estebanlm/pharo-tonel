"
A SpecDialogWindow is a window made for embedding Spec models into dialog windows

"
Class {
	#name : #SpecDialogWindow,
	#superclass : #DialogWindow,
	#instVars : [
		'specWidget',
		'toolbar'
	],
	#category : #Spec-Core-Widgets-Support,
	#timestamp : '<historical>'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>cancelAction: aBlock [

	self toolbar cancelAction: aBlock 
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>cancelled [

	^ self toolbar cancelled
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>close [

	super close.
	self toolbar cancel
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>escapePressed [

	self toolbar triggerCancelAction
]

{
	#category : #focus,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>giveFocusToNextFrom: aModel  [

	^ self model giveFocusToNextFrom: aModel 
]

{
	#category : #focus,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>giveFocusToPreviousFrom: aModel  [

	^ self model giveFocusToPreviousFrom: aModel
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>initialExtent  [

	^ self model
		ifNil: [ super initialExtent ]
		ifNotNil: [:m | m initialExtent
						ifNil: [ super initialExtent ]]
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>initialize [

	super initialize.

	self beResizeable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>model: aModel [

	super model: aModel.

	aModel model focusOrder
		addLast: toolbar.
	toolbar focusOrder addLast: model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>newButtonRow [

	^ self toolbar 
		ifNil: [ nil ]
		ifNotNil: [ : t | t buildWithSpec ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>newContentMorph [
	"Answer a new content morph."

	^ self specWidget 
			ifNil: [ nil ] 
			ifNotNil: [:w | 
				w
					hResizing: #spaceFill;
					vResizing: #spaceFill ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>newMainPanel [
	"Answer a new main panel."
	| panel |
	panel := self newDialogPanel.
	self newContentMorph ifNotNil: [:m | panel 	addMorphBack: m ].
	self newButtonRow ifNotNil: [:m | panel 	addMorphBack: m ].
	^ panel
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>okAction: aBlock [

	self toolbar okAction: aBlock 
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>setToolbarFrom: aBlock [
	| newToolbar |
	
	newToolbar := aBlock value.
	
	toolbar := newToolbar.
	newToolbar owner: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>specWidget [

	^ specWidget
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>specWidget: anObject [

	specWidget := anObject.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>toolbar [
	"Lazy initialization because this method is called efore the initialize method"
	
	^ toolbar
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDialogWindow>>toolbar: anObject [

	toolbar := anObject.
	anObject owner: self.
	
	self removeMorph: self submorphs last.
	self addMainPanel
]
