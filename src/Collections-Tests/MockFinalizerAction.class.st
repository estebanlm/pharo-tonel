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
	#category : #Collections-Tests-Weak,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
MockFinalizerAction>>finalizationAction: aValuable [
	finalizationAction := aValuable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
MockFinalizerAction>>finalize [
	finalizationAction value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
MockFinalizerAction>>finalizeValues [
	finalizationAction value
]
