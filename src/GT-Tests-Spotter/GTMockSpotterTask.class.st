"

"
Class {
	#name : #GTMockSpotterTask,
	#superclass : #GLMAsyncTask,
	#category : #GT-Tests-Spotter-Scripting-Mocks,
	#timestamp : ''
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTMockSpotterTask>>execute: aBlock withArguments: aCollection callback: callbackBlock priority: aPriority delay: anIntegerMilliseconds [
	" we cannot handle asynchronous processes well in tests, so just execute is synchronously "
	aBlock valueWithPossibleArgs: aCollection.
	aCollection value.
]
