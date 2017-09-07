"
I'm a datasource who works with FTEasyListMorph.
I receive blocks to provide my contents. 
"
Class {
	#name : #FTEasyListDataSource,
	#superclass : #FTSimpleDataSource,
	#instVars : [
		'displayBlock',
		'iconBlock',
		'menuBlock',
		'header'
	],
	#category : #Morphic-Widgets-FastTable-Easy,
	#timestamp : 'EstebanLorenzano 6/3/2015 15:02'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTEasyListDataSource>>cellColumn: column row: rowIndex [
	^ FTCellMorph new
		cellInset: 5;
		in: [ :me | 
			(self iconFor: rowIndex) 
				ifNotNil: [ :icon | me addMorphBack: icon asMorph ] ];
		addMorphBack: (self displayFor: rowIndex) asMorph;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTEasyListDataSource>>display: aBlock [
	displayBlock := aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTEasyListDataSource>>displayFor: rowIndex [
	| element |
	element := self elementAt: rowIndex.
	^ displayBlock 
		ifNotNil: [ displayBlock value: element ]
		ifNil: [ ^ element ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTEasyListDataSource>>icon: aBlock [
	iconBlock := aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTEasyListDataSource>>iconFor: rowIndex [
	iconBlock ifNil: [ ^ nil ].
	^ iconBlock value: (self elementAt: rowIndex)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTEasyListDataSource>>menu: aBlock [
	menuBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTEasyListDataSource>>menuColumn: column row: rowIndex [
	menuBlock ifNil: [ ^ nil ].
	rowIndex = 0 ifTrue: [ 
		"I could answer a menu without selection, but in this case I will just answer nil, 
		 which means 'no menu'"
		^ nil ].
	^ menuBlock value: (self elementAt: rowIndex)
]
