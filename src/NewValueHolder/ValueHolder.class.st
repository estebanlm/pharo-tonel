"
A value holder holding a value 
"
Class {
	#name : #ValueHolder,
	#superclass : #Model,
	#instVars : [
		'contents'
	],
	#category : #NewValueHolder,
	#timestamp : 'TorstenBergmann 2/4/2014 20:43'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueHolder>>= another [

	self species = another species ifFalse: [ ^ false ].
	^ self contents = another contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueHolder>>contents [
	^contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueHolder>>contents: newContents [
	contents := newContents.
	self changed: #contents
]
