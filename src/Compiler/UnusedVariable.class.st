"
Notify about an unused temporary variable
"
Class {
	#name : #UnusedVariable,
	#superclass : #ParserNotification,
	#category : #Compiler-Exceptions
}

{ #category : #'as yet unclassified' }
UnusedVariable >> openMenuIn: aBlock [
	| index |
	index := aBlock value: #('yes' 'no')
					value: #()
					value: name, ' appears to be\unused in this method.\OK to remove it?' withCRs.
	self resume: index = 1
]
