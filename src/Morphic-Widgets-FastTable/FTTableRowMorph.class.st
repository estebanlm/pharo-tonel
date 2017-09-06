"
I'm a row for a table.
All my work is to keep cells.
"
Class {
	#name : #FTTableRowMorph,
	#superclass : #Morph,
	#instVars : [
		'selectionColor'
	],
	#category : #Morphic-Widgets-FastTable,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTableRowMorph class>>new [
	self error: 'Use #table:'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTableRowMorph class>>table: aTableMorph [
	^ self basicNew
		initializeTable: aTableMorph;
		yourself
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTableRowMorph>>defaultColor [
	^Color transparent 
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTableRowMorph>>handlesMouseOver: evt [

	^true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTableRowMorph>>initialize  [
	super initialize.
	self
		clipSubmorphs:true;
		layoutPolicy: FTRowLayout new.
		
	selectionColor := self defaultColor
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTableRowMorph>>initializeTable: tableMorph  [
	self initialize.
	self 
		cellInset: tableMorph intercellSpacing";
		layoutInset: tableMorph intercellSpacing".
	self flag: #todo. "Check if layout inset works better"
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTableRowMorph>>mouseEnter: evt [

	self color: (
		selectionColor isTransparent 
			ifTrue: [ self mouseOverColor ]
			ifFalse: [ self mouseOverColor mixed: 0.5 with: selectionColor ]
	)
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTableRowMorph>>mouseLeave: evt [
	
	self color: self selectionColor 
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTableRowMorph>>mouseOverColor [
	^ Smalltalk ui theme lightBackgroundColor
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTableRowMorph>>selectionColor [

	^selectionColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTableRowMorph>>selectionColor: aColor [

	selectionColor := aColor.
	self color: selectionColor
]
