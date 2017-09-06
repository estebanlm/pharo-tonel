"
Notify about an undefined variable
"
Class {
	#name : #UndefinedVariable,
	#superclass : #ParserNotification,
	#category : #Compiler-Exceptions,
	#timestamp : 'TorstenBergmann 1/31/2014 11:18'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:32'
}
UndefinedVariable>>openMenuIn: aBlock [
	| caption index |
	caption := name, ' appears to be 
undefined at this point.
Proceed anyway?'.
	index := aBlock value: #('yes' 'no') value: #() value: caption.
	^ self resume: index = 1
]
