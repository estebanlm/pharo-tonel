"
I am an element that wraps host and value in a PointerWrapper. 

Following back pointers stops at the wrapper, not showing the framwork related references e.g. of the tree.
"
Class {
	#name : #PointerEyeElement,
	#superclass : #AbstractEyeElement,
	#instVars : [
		'value'
	],
	#category : #Spec-Inspector-Element,
	#timestamp : 'MarcusDenker 8/5/2014 10:37'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PointerEyeElement class>>host: anObject value: aValue [
	^(self host: anObject) value: aValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
PointerEyeElement>>accessorCode [
	^ self label 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
PointerEyeElement>>host: anObject [
 	host := (EyePointerWrapper wrap: anObject)
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
PointerEyeElement>>label [
 	^ value printString

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
PointerEyeElement>>longLabel [
 	^ value identityHash asString, ': ', value printString

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
PointerEyeElement>>selectedObjectDo: aBlock [
	aBlock value: self selectedObject wrappedObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
PointerEyeElement>>value [
	^value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
PointerEyeElement>>value: anObject [
 	value := (EyePointerWrapper wrap: anObject)
]
