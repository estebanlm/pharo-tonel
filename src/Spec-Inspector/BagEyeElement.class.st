"
I am an eye element for bags, showing appropriate thing with occurrences
"
Class {
	#name : #BagEyeElement,
	#superclass : #IndexedEyeElement,
	#category : #Spec-Inspector-Element,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
BagEyeElement>>accessorCode [
	^ '(self occurrencesOf: ', self label, ')'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
BagEyeElement>>save: aValue [
	self host valuesAndCounts at: self index put: aValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
BagEyeElement>>value [
	^ self host valuesAndCounts at: self index
]
