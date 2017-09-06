"
I define a strategy to handle selections. 
The sense of this class is shown in my children: I allow to handle the case of multiple and simple selection in a well designed way, instead using ifs everywhere.
"
Class {
	#name : #FTSelectionStrategy,
	#superclass : #Object,
	#instVars : [
		'table'
	],
	#category : #Morphic-Widgets-FastTable-Selection,
	#timestamp : 'EstebanLorenzano 5/15/2015 10:36'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSelectionStrategy class>>new [
	self error: 'Use #table:'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSelectionStrategy class>>table: aFastTableMorph [
	^ self basicNew
		initializeTable: aFastTableMorph;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSelectionStrategy>>initializeTable: aTable [
	table := aTable.
	self initialize
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSelectionStrategy>>isMultiple [
	^ self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSelectionStrategy>>isSimple [
	^ self isMultiple not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSelectionStrategy>>selectRowIndex: rowIndex event: event [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSelectionStrategy>>table [
	^ table
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSelectionStrategy>>toggleRowIndex: rowIndex [
	((self table selectedRowIndexes includes: rowIndex) 
		and: [ self table selectedRowIndexes size = 1 "just one selected"
		and: [ self table allowsDeselection ] ])
			ifTrue: [  self table selectRowIndexes: #() ]
			ifFalse: [
				self table selectRowIndex: rowIndex ]
]
