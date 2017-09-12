"
I am test object used for the WeakRegisty tests.
Upon finalization I trigger a custom finalizationAction (usually a Block)
"
Class {
	#name : #MockFinalizerAction,
	#superclass : #Object,
	#instVars : [
		'finalizationAction'
	],
	#category : #Collections-Tests-Weak
}

{ #category : #accessing }
MockFinalizerAction >> finalizationAction: aValuable [
	finalizationAction := aValuable
]

{ #category : #accessing }
MockFinalizerAction >> finalize [
	finalizationAction value
]

{ #category : #accessing }
MockFinalizerAction >> finalizeValues [
	finalizationAction value
]
