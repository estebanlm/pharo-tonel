"
A SortHierarchicallyIndentNode is a wrapper around any object that is used by the sorting algorithm #XXX
 of SortHierarchically to store the indent level of this object.

"
Class {
	#name : #SortHierarchicallyIndentNode,
	#superclass : #Object,
	#instVars : [
		'element',
		'indent'
	],
	#category : #Nautilus,
	#timestamp : 'HenrikNergaard 10/4/2015 19:20'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
SortHierarchicallyIndentNode class>>on: anObject indentBy: aNumber [
	^ self new
		setElement: anObject;
		setIndent: aNumber;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SortHierarchicallyIndentNode>>element [
	"Any model object that is part of a collection we are sorting hierarchically."
	^ element
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SortHierarchicallyIndentNode>>indent  [

	^indent
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SortHierarchicallyIndentNode>>printOn: aStream [
	"Print me->ancestor"
	aStream
		print: element;
		nextPutAll: ' -> ';
		print: indent
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:22'
}
SortHierarchicallyIndentNode>>setElement: anObject [
	element := anObject
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:22'
}
SortHierarchicallyIndentNode>>setIndent: aNumber [

	indent := aNumber
]
