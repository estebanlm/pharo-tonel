"
A to-1 relationship field with keyboard selection with entry completion and a separate dialog for detailed searching (and creating new entities).

See my class side for an example


"
Class {
	#name : #SelectEntity,
	#superclass : #ComposableModel,
	#instVars : [
		'entity',
		'selectEntity',
		'possibleEntities',
		'displaySymbol',
		'entityText',
		'ghostText',
		'selectDialog'
	],
	#category : #Spec-PolyWidgets-Widgets,
	#timestamp : 'jfabry 12/13/2016 15:51'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity class>>defaultSpec [
	<spec: #default>
		
	^SpecLayout composed
		newColumn: [ :col |
				col newRow: [:row |
					row add: #entityText;
						add: #selectEntity width: ComposableModel toolbarHeight]
					height: ComposableModel toolbarHeight];
		yourself

]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity class>>example [
	self new
		selectDialog: [ FastTableModel new items: #(Henrik Peter); yourself];
		displaySymbol: #asString;
		ghostText: 'Names';
		possibleEntities: [#(Diego Stephan Norbert Stephane Marcus Torsten Sven Sean) sorted];
		openDialogWithSpec 

]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>displaySymbol [
	"<api: #inspect>"
	"return the method selector used to get the label of the entity that is for entry completion"
	^ displaySymbol value ifNil: [ #printString ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>displaySymbol: anObject [
	displaySymbol value: anObject.
	entityText entryCompletion: self entitiesEntryCompletion.
]

{
	#category : #entryCompletion,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>entitiesEntryCompletion [
	^ EntryCompletion new
				dataSourceBlock: [:currText | self possibleEntities collect: [:each | 
		each perform: self displaySymbol ]];
				chooseBlock: [ :selectedName | 
					self entity: (self possibleEntities detect: [ :each | 
						(each perform: self displaySymbol) = selectedName ])];
				filterBlock: [:currEntity :currText | 
					currEntity asUppercase includesSubstring: currText asString asUppercase].
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>entity [
	
	^ entity value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>entity: anObject [
	entity value: anObject.
	anObject ifNotNil: [  
		self entityText text: (anObject perform: self displaySymbol)] ifNil: [ self entityText text: '' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>entityText [
	^ entityText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>entityText: anObject [
	entityText := anObject
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>ghostText [
	^ ghostText value ifNil: [ '' ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>ghostText: aString [
	ghostText value: aString.
	entityText ghostText: aString
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>initialize [
	super initialize.
	self initializeValueHolders
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>initializePresenter [
	selectEntity 
		action: [  |select|
			select := self selectDialog value.
			select openDialogWithSpec
				okAction: [  
					self entity: select selectedItem ]]

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>initializeValueHolders [
	displaySymbol := #displayString asValueHolder.
	entity := nil asValueHolder.
	ghostText := 'Choose one' asValueHolder.
	possibleEntities := #() asValueHolder.
	selectDialog := [  ] asValueHolder
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>initializeWidgets [
	entityText := self newTextInput
		ghostText: self ghostText;
		autoAccept: true;
		entryCompletion: self entitiesEntryCompletion;
		yourself.
	selectEntity := self newButton
		icon: (self iconNamed: #glamorousSearch);
		help: 'Open a selection dialog'.
	self focusOrder
		add: entityText;
		add: selectEntity
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>possibleEntities [
	possibleEntities value ifNil: [ ^#() ]
		ifNotNil: [ ^possibleEntities value value ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>possibleEntities: aBlock [
	"<api: #block getter: #possibleEntities registration: #whenPossibleEntitiesChanged:>"
	"Set the block used to return a collection of all possible entity choices"
	possibleEntities value: aBlock.
	entityText entryCompletion: self entitiesEntryCompletion.
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>selectDialog [
	^ selectDialog value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>selectDialog: anObject [
	"<api: #block getter: #selectDialog registration: #whenSelectDialogChanged:>"
	"Set a block that returns an object that will 
	first be sent #openDialogWithSpec
	and then as okAction sent #selectedItem"
	selectDialog value: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>selectEntity [
	^ selectEntity
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>selectEntity: anObject [
	selectEntity := anObject
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>whenDisplaySymbolChanged: aBlock [
	displaySymbol whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>whenEntityChanged: aBlock [
	entity whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>whenGhostTextChanged: aBlock [
	ghostText whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>whenPossibleEntitiesChanged: aBlock [
	possibleEntities whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
SelectEntity>>whenSelectDialogChanged: aBlock [
	selectDialog whenChangedDo: aBlock
]
