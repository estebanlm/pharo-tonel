"
I am a fast table column to represent item in array at particular index.
 
Internal Representation and Key Implementation Points.

This class has and extends API of FTColumn

    Instance Variables
	id:			An id for the column
	width:		An Integer that represent the width of a column.
	index:		<Number>
"
Class {
	#name : #FTArrayIndexColumn,
	#superclass : #Object,
	#instVars : [
		'id',
		'width',
		'index'
	],
	#category : #Spec-Core-Widgets,
	#timestamp : 'PavelKrivanek 11/14/2016 18:43'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
FTArrayIndexColumn class>>id: anObject [
	^ self new
		id: anObject;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
FTArrayIndexColumn class>>index: aNumber [
	^ self new 
		index: aNumber
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
FTArrayIndexColumn class>>index: aNumber width: aNumber2 [
	^ (self index: aNumber) 
		width: aNumber2
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
FTArrayIndexColumn class>>undefinedColumnWidth [
	"This is a contant that defines a column width is undefined, then the layout will try to arrange 
	 it by itself."
	^ 0
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:18'
}
FTArrayIndexColumn>>acquireWidth: anOwnerWidth [
	^ self widthOrUndefined min: anOwnerWidth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
FTArrayIndexColumn>>id [
	^ id
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
FTArrayIndexColumn>>id: anObject [
	id := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
FTArrayIndexColumn>>index [
	^ index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
FTArrayIndexColumn>>index: anObject [
	index := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
FTArrayIndexColumn>>transform: anArray [
	^ anArray at: self index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
FTArrayIndexColumn>>width [
	^ width
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
FTArrayIndexColumn>>width: anObject [
	width := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
FTArrayIndexColumn>>widthOrUndefined [
	^ self width ifNil: [ self class undefinedColumnWidth ]
]
