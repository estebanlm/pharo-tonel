"
I'm a column definition for a fast  table.

Description 
------------------
 
I keep an id and relevant information of my behaviour, but this behaviour is better defined in FTDataSource>>#headerTable:column:
 
Internal Representation and Key Implementation Points.
-----------------
    Instance Variables
	id:		An id for the column
	width:		An Integer that represent the width of a column.

"
Class {
	#name : #FTColumn,
	#superclass : #Object,
	#instVars : [
		'id',
		'width'
	],
	#category : #Morphic-Widgets-FastTable,
	#timestamp : 'CyrilFerlicot 11/17/2015 14:21'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTColumn class>>id: anObject [
	^ self new
		id: anObject;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTColumn class>>undefinedColumnWidth [
	"This is a contant that defines a column width is undefined, then the layout will try to arrange 
	 it by itself."
	^ 0
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTColumn>>acquireWidth: anOwnerWidth [
	^ self widthOrUndefined min: anOwnerWidth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTColumn>>id [
	^ id
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTColumn>>id: anObject [
	id := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTColumn>>transform: anObject [
	^ anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTColumn>>width [
	^ width
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTColumn>>width: anObject [
	width := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTColumn>>widthOrUndefined [
	^ self width ifNil: [ self class undefinedColumnWidth ]
]
