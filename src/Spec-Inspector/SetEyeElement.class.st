"
I am an eye element for sets, showing appropriate thing with indexes

"
Class {
	#name : #SetEyeElement,
	#superclass : #IndexedEyeElement,
	#instVars : [
		'externalIndex'
	],
	#category : #Spec-Inspector-Element,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SetEyeElement class>>host: anObject index: index externalIndex: externalIndex [
	^ (self host: anObject)
		index: index;
		externalIndex: externalIndex;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SetEyeElement>>accessorCode [
	^ '(self array at: ', self index asString, ')'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SetEyeElement>>externalIndex [
	^ externalIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SetEyeElement>>externalIndex: anObject [
	externalIndex := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SetEyeElement>>label [
	^ self externalIndex printString
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
SetEyeElement>>save: aValue [
	| oldElement |
	oldElement := self host array at: self index.
	self host 
		remove: oldElement;
		add: aValue.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SetEyeElement>>value [
	^ self host array at: self index
]
