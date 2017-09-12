"
Notify about an undefined variable
"
Class {
	#name : #UndefinedVariable,
	#superclass : #ParserNotification,
	#category : #Compiler-Exceptions
}

{ #category : #'as yet unclassified' }
UndefinedVariable >> openMenuIn: aBlock [
	| caption index |
	caption := name, ' appears to be 
undefined at this point.
Proceed anyway?'.
	index := aBlock value: #('yes' 'no') value: #() value: caption.
	^ self resume: index = 1
]
