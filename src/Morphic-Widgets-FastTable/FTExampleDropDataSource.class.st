"
I'm a simple example of fast table who will accept drops of classes.

FTExamples exampleDragAndDrop1.

"
Class {
	#name : #FTExampleDropDataSource,
	#superclass : #FTSimpleDataSource,
	#category : #Morphic-Widgets-FastTable-Examples,
	#timestamp : '<historical>'
}

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTExampleDropDataSource>>dropElements: aCollection index: rowIndex [
	self elements: (rowIndex = 0
		ifTrue: [ self elements, aCollection ]
		ifFalse: [ (self elements first: rowIndex), aCollection, (self elements allButFirst: rowIndex) ]).
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTExampleDropDataSource>>initialize  [
	super initialize.
	self elements: #()
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTExampleDropDataSource>>wantsDropElements: aCollection type: type index: rowIndex [
	^ aCollection allSatisfy: #isClass
]
