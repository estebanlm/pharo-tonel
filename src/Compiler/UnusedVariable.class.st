"
Notify about an unused temporary variable
"
Class {
	#name : #UnusedVariable,
	#superclass : #ParserNotification,
	#category : #Compiler-Exceptions,
	#timestamp : 'TorstenBergmann 1/31/2014 11:17'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:32'
}
UnusedVariable>>openMenuIn: aBlock [
	| index |
	index := aBlock value: #('yes' 'no')
					value: #()
					value: name, ' appears to be\unused in this method.\OK to remove it?' withCRs.
	self resume: index = 1
]
