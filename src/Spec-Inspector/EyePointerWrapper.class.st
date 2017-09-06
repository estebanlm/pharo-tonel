"
A wrapper used by the PointerExplorer.
I wrap a reference so we can stop follwoing back pointers.
"
Class {
	#name : #EyePointerWrapper,
	#superclass : #Object,
	#instVars : [
		'wrapped'
	],
	#category : #Spec-Inspector-Element,
	#timestamp : 'MarcusDenker 8/5/2014 10:38'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerWrapper class>>wrap: anObject [
	^self new wrappedObject: anObject.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerWrapper>>printString [
	^wrapped printString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerWrapper>>wrappedObject [
	^wrapped
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerWrapper>>wrappedObject: anObject [
	wrapped := anObject
]
