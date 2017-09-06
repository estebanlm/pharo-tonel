"

"
Class {
	#name : #FLReplacementMock,
	#superclass : #Object,
	#instVars : [
		'ignoreMe'
	],
	#category : #FuelTests-Mocks,
	#timestamp : ''
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLReplacementMock>>= anObject [
	^ self class = anObject class
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLReplacementMock>>dontIgnoreMe [
	ignoreMe := false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLReplacementMock>>fuelReplacement [
	^ ignoreMe
		ifTrue: [ nil ]
		ifFalse: [ self ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLReplacementMock>>ignoreMe [
	^ ignoreMe := true
]
