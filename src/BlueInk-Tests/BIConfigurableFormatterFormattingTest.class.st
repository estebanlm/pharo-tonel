Class {
	#name : #BIConfigurableFormatterFormattingTest,
	#superclass : #RBFormatterTest,
	#category : #BlueInk-Tests
}

{ #category : #'as yet unclassified' }
BIConfigurableFormatterFormattingTest class >> shouldInheritSelectors [
	
	^ true
]

{ #category : #default }
BIConfigurableFormatterFormattingTest >> formatterClass [
	^ BIConfigurableFormatter
]
