"
I am signaled if a new class introduces a circular class hierarchy.
"
Class {
	#name : #CircularHierarchyError,
	#superclass : #ClassBuilderError,
	#category : #Slot-Exception,
	#timestamp : '<historical>'
}

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:35'
}
CircularHierarchyError class>>signalFor: aClass [
	self signal: aClass name asString, ': Trying to build a circular hierarchy'
]
