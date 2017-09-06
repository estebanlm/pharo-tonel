"
I'm a simple datasource and just implement a direct-to-table provision of my elements.  I can work with the default implementation of FTTableMorph. 

Users might want to subclass me to have better options.
"
Class {
	#name : #FTSimpleDataSource,
	#superclass : #FTDataSource,
	#instVars : [
		'elements'
	],
	#category : #Morphic-Widgets-FastTable-DataSource,
	#timestamp : 'EstebanLorenzano 5/12/2015 13:50'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSimpleDataSource class>>elements: aCollection [
	^ self new elements: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSimpleDataSource>>cellColumn: column row: rowIndex  [
	^ FTCellMorph new
		addMorphBack: (self elementAt: rowIndex) asMorph;
		yourself
	
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSimpleDataSource>>elementAt: index [
	^ self elements at: index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSimpleDataSource>>elements [
	^ elements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSimpleDataSource>>elements: anObject [
	elements := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSimpleDataSource>>headerColumn: column [
	column id ifNil: [ ^ nil ]. 
	^ FTCellMorph new 
		listCentering: #center;
		addMorph: column id asMorph;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSimpleDataSource>>newDataSourceMatching: aFTFilter [
	| newElements |
	newElements := Array withAll: (elements select: [ :each | 
		aFTFilter matches: (self toString: each) ]).
	^ self class new elements: newElements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSimpleDataSource>>numberOfRows  [
	^ self elements 
		ifNotNil: [ self elements size ]
		ifNil: [ 0 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSimpleDataSource>>searchText: aString [
	| result |
	aString isEmptyOrNil ifTrue: [ ^ #() ].
	result := OrderedCollection new.
	self elements withIndexDo: [ :each :index |
		((self toString: each) beginsWith: aString)
			ifTrue: [ result add: index ] ].
	^ result asArray
]
