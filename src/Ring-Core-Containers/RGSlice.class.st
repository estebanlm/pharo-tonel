"
A slice is an arbitrary container of elements (working unit)
By inheritance it knows how to treat classes and methods

"
Class {
	#name : #RGSlice,
	#superclass : #RGContainer,
	#category : #Ring-Core-Containers,
	#timestamp : 'VeronicaUquillas 4/22/2011 13:36'
}

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGSlice>>addElement: aRGDefinition in: aCollection [

	aRGDefinition environment: self.
	super addElement: aRGDefinition in: aCollection
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGSlice>>isSlice [

	^true
]
