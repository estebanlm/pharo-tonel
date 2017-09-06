"
I am an eye element for indexable fields. (basicAt:)
"
Class {
	#name : #BasicIndexedEyeElement,
	#superclass : #AbstractEyeElement,
	#instVars : [
		'index'
	],
	#category : #Spec-Inspector-Element,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
BasicIndexedEyeElement class>>host: anObject index: index [
	^ (self host: anObject) index: index
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:18'
}
BasicIndexedEyeElement>>= anObject [
	^ super = anObject and: [ index = anObject index ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
BasicIndexedEyeElement>>accessorCode [
	^ '(self basicAt: ', self index asString, ')'
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:18'
}
BasicIndexedEyeElement>>hash [
	^ index hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
BasicIndexedEyeElement>>index [
	^ index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
BasicIndexedEyeElement>>index: anObject [
	index := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
BasicIndexedEyeElement>>label [
	^ self index printString
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
BasicIndexedEyeElement>>save: aValue [
	self host basicAt: self index put: aValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
BasicIndexedEyeElement>>value [
	^ self host basicAt: self index
]
