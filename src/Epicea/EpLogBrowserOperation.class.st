"
I represent an operation done in a EpLogBrowser.
"
Class {
	#name : #EpLogBrowserOperation,
	#superclass : #EpEvent,
	#instVars : [
		'entryReferences'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:38'
}

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperation>>asEpiceaEvent [

	^ self
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperation>>copyWithEntryReferences: aCollectionOfEntryReferences [
	^self subclassResponsibility
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperation>>doInJob: aBlock [
	"Evaluate the block. This is a workaround to make Job consider me as the Job's owner."

	^ [ aBlock value ] asJob
		title: '';
		run
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperation>>entryReferences [
	^ entryReferences
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperation>>initializeWith: aCollectionOfEntryReferences [
	self initialize.
	entryReferences := aCollectionOfEntryReferences
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperation>>isEpiceaInterestingJobOwner [

	^ true
]
