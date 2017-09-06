"
I am an eye element for indexable fields. (at:)
"
Class {
	#name : #IndexedEyeElement,
	#superclass : #BasicIndexedEyeElement,
	#category : #Spec-Inspector-Element,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
IndexedEyeElement>>accessorCode [
	^ '(self at: ', self index asString, ')'
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
IndexedEyeElement>>save: aValue [
	self host at: self index put: aValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
IndexedEyeElement>>value [
	^ self host at: self index
]
