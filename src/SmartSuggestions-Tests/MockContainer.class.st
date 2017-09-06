"
I'm only a fake container, since in some cases to build a context we use the wraped model, and build a full container isn't so simple... 
"
Class {
	#name : #MockContainer,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #SmartSuggestions-Tests,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:46'
}
MockContainer class>>for: model [
	^ self new 
		model: model; 
		yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
MockContainer>>model [
	^ model.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
MockContainer>>model: anObject [
	model := anObject
]
