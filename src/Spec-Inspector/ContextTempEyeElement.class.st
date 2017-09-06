"
I am an eye element for temporaries in context
"
Class {
	#name : #ContextTempEyeElement,
	#superclass : #AbstractEyeElement,
	#instVars : [
		'tempName',
		'tempIndex'
	],
	#category : #Spec-Inspector-Element,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:18'
}
ContextTempEyeElement class>>host: anObject tempName: aString tempIndex: int [
	^ (self host: anObject) 
		tempName: aString;
		tempIndex: int;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ContextTempEyeElement>>accessorCode [
	^ '(self namedTempAt: ', self tempIndex printString, ')'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ContextTempEyeElement>>label [
	^ self tempName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ContextTempEyeElement>>save: aValue [
	self host namedTempAt: self tempIndex put: aValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ContextTempEyeElement>>tempIndex [
	^ tempIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ContextTempEyeElement>>tempIndex: anObject [
	tempIndex := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ContextTempEyeElement>>tempName [
	^ tempName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ContextTempEyeElement>>tempName: anObject [
	tempName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ContextTempEyeElement>>value [
	^ self host tempNamed: self tempName
]
