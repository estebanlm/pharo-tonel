"
I announce a selection change (usually a click, but can also be done with arrows up and down).

Description
-------------------

I store the old selected rows and the new selected row. 
I should be use to act with the user when he interact with a Fast Table.

Public API and Key Messages
-------------------

- #from: arrayOfIndexes to: arrayOfIndexes 		is the commun constructor.
 
Internal Representation and Key Implementation Points.
------------------

    Instance Variables
	newSelectedRowIndexes:		An array of indexes that store the new selection.
	oldSelectedRowIndexes:		An array of indexes that store the old selection.
			
From the index you can get an object from the FTTableMorph with: 

aFTTableMorph dataSource elementAt: selectedRowIndex 
"
Class {
	#name : #FTSelectionChanged,
	#superclass : #FTAnnouncement,
	#instVars : [
		'oldSelectedRowIndexes',
		'newSelectedRowIndexes'
	],
	#category : #Morphic-Widgets-FastTable-Announcement,
	#timestamp : 'CyrilFerlicot 11/17/2015 12:40'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSelectionChanged class>>from: oldArray to: newArray  [
	^ self new 
		oldSelectedRowIndexes: oldArray;
		newSelectedRowIndexes: newArray;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSelectionChanged>>newSelectedRowIndexes [
	^ newSelectedRowIndexes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSelectionChanged>>newSelectedRowIndexes: anObject [
	newSelectedRowIndexes := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSelectionChanged>>oldSelectedRowIndexes [
	^ oldSelectedRowIndexes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSelectionChanged>>oldSelectedRowIndexes: anObject [
	oldSelectedRowIndexes := anObject
]
