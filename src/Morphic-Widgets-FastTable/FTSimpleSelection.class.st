"
I define the simple selection strategy. 
I allow tables using me to manage single selection rows.
"
Class {
	#name : #FTSimpleSelection,
	#superclass : #FTSelectionStrategy,
	#category : #Morphic-Widgets-FastTable-Selection,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSimpleSelection>>isMultiple [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSimpleSelection>>selectRowIndex: rowIndex event: event [
	self toggleRowIndex: rowIndex
]
