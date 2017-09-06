"
I'm a container for columns in the process of being shown in container. 
I have display column properties (that might or might not be in column it self).

Originally I'm used to send data outside container that might be used (for example, resizing).
"
Class {
	#name : #FTDisplayColumn,
	#superclass : #Object,
	#instVars : [
		'column',
		'width'
	],
	#category : #Morphic-Widgets-FastTable,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTDisplayColumn class>>column: aColumn width: aWidth [
	^ self new 
		column: aColumn;
		width: aWidth;
		yourself
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTDisplayColumn>>column [
	^ column
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTDisplayColumn>>column: anObject [
	column := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTDisplayColumn>>width [
	^ width
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTDisplayColumn>>width: anObject [
	width := anObject
]
