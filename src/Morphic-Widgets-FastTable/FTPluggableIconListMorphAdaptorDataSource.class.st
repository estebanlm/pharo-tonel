"
I'm a datasource to interpret messages in teh form provided for a PluggableIconListMorph.
"
Class {
	#name : #FTPluggableIconListMorphAdaptorDataSource,
	#superclass : #FTDataSource,
	#instVars : [
		'model',
		'getListSelector',
		'getListElementSelector',
		'wrapSelector',
		'getIconSelector',
		'getListSizeSelector',
		'getMenuSelector',
		'dropItemSelector',
		'wantsDropSelector'
	],
	#category : #Morphic-Widgets-FastTable-PluggableAdaptor,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>cellColumn: column row: rowIndex [
	| object text icon |
	object := self elementAt: rowIndex.
	
	icon := self getIconSelector ifNotNil: [ :selector | 
		self model perform: selector with: object ].
	text := column transform: (self elementWrapped: object).
	
	^ self createCellText: text icon: icon.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>createCellText: aString icon: anIcon [
	| text icon cell |
	text := aString.
	icon := anIcon.
	cell := FTCellMorph new
		cellInset: 5;
		yourself.
	icon
		ifNotNil:
			[ icon := icon asMorph.
			icon class = ImageMorph
				ifTrue: [ icon form: (icon form scaledToSize: 16 @ 16) ]
				ifFalse: [ icon bounds: (0 @ 0 corner: 16 @ 16) ].
			cell addMorphBack: icon ].
	cell addMorphBack: text asMorph.
	^ cell
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>dragTransferType [
	^ self getListElementSelector
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>dropElements: aCollection index: rowIndex [
	self dropItemSelector ifNil: [ ^ self ].
	self model 
		perform: self dropItemSelector 
		with: aCollection
		with: rowIndex
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>dropItemSelector [
	^ dropItemSelector 
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>dropItemSelector: aSelector [
	dropItemSelector := aSelector

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>elementAt: rowIndex [
	^ self getListElementSelector 
		ifNotNil: [ 
			self model perform: self getListElementSelector with: rowIndex ]
		ifNil: [ 
			(self model perform: self getListSelector) at: rowIndex  ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>elementWrapped: object [
	^ self wrapSelector 
		ifNotNil: [ :selector | self model perform: selector with: object ] 
		ifNil: [ object ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>elements [
	^self model getList
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>getIconSelector [
	^ getIconSelector
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>getIconSelector: anObject [
	getIconSelector := anObject
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>getListElementSelector [
	^ getListElementSelector
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>getListElementSelector: anObject [
	getListElementSelector := anObject
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>getListSelector [
	^ getListSelector
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>getListSelector: anObject [
	getListSelector := anObject
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>getListSizeSelector [
	^ getListSizeSelector
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>getListSizeSelector: anObject [
	getListSizeSelector := anObject
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>getMenuSelector [
	^ getMenuSelector
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>getMenuSelector: anObject [
	getMenuSelector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>menuColumn: column row: rowIndex [
	| menu |
	
	self getMenuSelector ifNil: [ ^ nil ].
	
	menu := UIManager default newMenuIn: self table for: self model.
	self getMenuSelector numArgs = 1 ifTrue: [ 
		^ self model perform: self getMenuSelector with: menu ].
	^ self model 
		perform: self getMenuSelector
		with: menu
		with: false 

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>model [
	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>model: anObject [
	model := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>newDataSourceMatching: aFTFilter [
	| newElements wrappedItem text newDataSource modelCopy |
	newElements := self elements select: [ :each | 
		wrappedItem := self elementWrapped: each.
		table columns anySatisfy: [ :column | 
			text := column transform: wrappedItem.
			aFTFilter matches: text]].
	
	newDataSource := self copy.
	modelCopy := self model copy.
	modelCopy prepareForFilteredDataSourceWith: newElements.
	newDataSource model: modelCopy.
	
	^newDataSource
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>numberOfRows [
	^ self model 
		ifNotNil: [ 
			self getListSizeSelector 
				ifNotNil: [ self model perform: self getListSizeSelector ]
				ifNil: [ (self model perform: self getListSelector) size ] ]
		ifNil: [ 0 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>searchText: aString [
	| search text result |
	aString isEmptyOrNil ifTrue: [ ^ #() ].
	result := OrderedCollection new.
	search := aString trimBoth asLowercase.
	1 to: self numberOfRows do: [ :rowIndex | 
		text := (self elementWrapped: (self elementAt: rowIndex)) contents trimBoth asLowercase.
		(text beginsWith: search)
			ifTrue: [ result add: rowIndex ] ].
	^ result asArray
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>transferFor: passenger from: aMorph [
    ^self model transferFor: passenger from: self table
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>wantsDropElements: aCollection type: type index: rowIndex [
	self dropItemSelector ifNil: [ ^ false ].
	self wantsDropSelector ifNil: [ ^ true ].
	^ self model 
		perform: self wantsDropSelector 
		with: aCollection
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>wantsDropSelector [
	^ wantsDropSelector
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>wantsDropSelector: aSelector [
	wantsDropSelector := aSelector
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>wrapSelector [
	^ wrapSelector
]

{
	#category : #'accessing selectors',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTPluggableIconListMorphAdaptorDataSource>>wrapSelector: anObject [
	wrapSelector := anObject
]
