"
self openOn: 42
"
Class {
	#name : #GLMBrowserWithoutBlocksExample,
	#superclass : #GLMCompositePresentation,
	#category : #Glamour-Examples,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrowserWithoutBlocksExample>>compose [
	| wrapper |
	wrapper := self wrapper.
	wrapper show: [ :a |
		a list 
			display: (MessageSend receiver: self selector: #displayList:) ]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrowserWithoutBlocksExample>>displayList: aNumber [
	^ 1 to: aNumber
]
