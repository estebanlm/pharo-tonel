"

"
Class {
	#name : #MyBooleanObject,
	#superclass : #Object,
	#category : #OpalCompiler-Tests-Misc,
	#timestamp : ''
}

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 05:26:31'
}
MyBooleanObject>>and: alternativeBlock  [
	"Nonevaluating conjunction -- answer with false since the receiver is false."

	^self
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 05:26:31'
}
MyBooleanObject>>ifTrue: aBlock  [
	^ aBlock value printString , ' sent from my boolean object'
]

{
	#category : #'logical operations',
	#timestamp : ' 8/31/2017 05:26:31'
}
MyBooleanObject>>not [
	^true
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 05:26:31'
}
MyBooleanObject>>or: alternativeBlock  [
	^alternativeBlock value
]
