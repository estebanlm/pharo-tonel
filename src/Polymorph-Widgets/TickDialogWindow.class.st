"
A TickDialogWindow is a modal dialog window which contains a TickList where user can pick a list of items.

See self example
"
Class {
	#name : #TickDialogWindow,
	#superclass : #DialogWindow,
	#instVars : [
		'defaultValue',
		'itemsHeaderName',
		'itemsList',
		'listModel',
		'listMorph',
		'resultStorage',
		'wrapBlockOrSelector'
	],
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'StephaneDucasse 4/3/2015 15:00'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow class>>example [
	
	(self itemsList: Morph methods itemsHeaderName: 'Plop' wrapBlockOrSelector: #selector title: 'Example') choose
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow class>>itemsList: itemsList itemsHeaderName: aName title: aTitle [

	^ self basicNew
		itemsList: itemsList;
		itemsHeaderName: aName;
		initialize;
		title: aTitle;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow class>>itemsList: itemsList itemsHeaderName: aName title: aTitle defaultValue: aBoolean [
	^ self basicNew
		itemsList: itemsList;
		itemsHeaderName: aName;
		defaultValue: aBoolean;
		initialize;
		title: aTitle;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow class>>itemsList: itemsList itemsHeaderName: aName wrapBlockOrSelector: aBlockOrSelector title: aTitle [
	^ self basicNew
		itemsList: itemsList;
		itemsHeaderName: aName;
		wrapBlockOrSelector: aBlockOrSelector;
		initialize;
		title: aTitle;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow class>>itemsList: itemsList itemsHeaderName: aName wrapBlockOrSelector: aBlockOrSelector title: aTitle defaultValue: aBoolean [
	^ self basicNew
		itemsList: itemsList;
		itemsHeaderName: aName;
		wrapBlockOrSelector: aBlockOrSelector;
		defaultValue: aBoolean;
		initialize;
		title: aTitle;
		yourself
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>accept [

	self resultStorage: self listModel selectedItems.
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>choose [

	^ self chooseFromOwner: World
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>chooseFromOwner: aMorph [

	aMorph openModal: self.
	^ resultStorage
]

{
	#category : #'focus handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>defaultFocusMorph [

	^ self listMorph 
		ifNil: [ super defaultFocusMorph ]
		ifNotNil: [:morph | morph ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>defaultValue [

	^ defaultValue ifNil: [defaultValue := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>defaultValue: aBoolean [

	defaultValue := aBoolean
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>hasUnacceptedEdits [

	^ true
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>initialExtent [
	
	| width |
	width := (self listMorph allNodeMorphs detectMax: [:e | e width]) width.
	width := width+ 50.
	
	^width@400
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>isResizeable [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>itemsHeaderName [

	^ itemsHeaderName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>itemsHeaderName: anObject [
	
	itemsHeaderName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>itemsList [

	^ itemsList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>itemsList: anObject [
	
	itemsList := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>listModel [

	^ listModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>listModel: aModel [

	listModel := aModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>listMorph [

	^ listMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>listMorph: anObject [
	
	listMorph := anObject
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>newContentMorph [

	self listModel: ((self tickListClass 
						itemsList: self itemsList 
						itemsHeaderName: self itemsHeaderName 
						wrapBlockOrSelector: self wrapBlockOrSelector)
						autoMultiSelection: true;
						beCheckList;
						yourself).
	
	self listMorph: (self listModel defaultTreeMorph
								buildContents;
								vResizing: #spaceFill;
								hResizing: #spaceFill).
								
	self defaultValue ifTrue: [ self listMorph selectAll ].							
	^ self listMorph
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>openInWorld [

	self choose 
	"since it is modal"
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>resultStorage [

	^ resultStorage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>resultStorage: anObject [
	
	resultStorage := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>selectItems: aCollection  [
	self listModel selectItems: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>selectedItems  [
	^ self listModel selectedItems
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>tickListClass [

	^ MorphTreeModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>wrapBlockOrSelector [

	^ wrapBlockOrSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TickDialogWindow>>wrapBlockOrSelector: anObject [
	
	wrapBlockOrSelector := anObject
]
