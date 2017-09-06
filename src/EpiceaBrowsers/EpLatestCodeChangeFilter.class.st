"
This filter only accepts code changes that are latest, i.e. that aren't overridden by other changes in the log more recently.
"
Class {
	#name : #EpLatestCodeChangeFilter,
	#superclass : #EpFilter,
	#instVars : [
		'logBrowserModel'
	],
	#category : #EpiceaBrowsers-Filters,
	#timestamp : 'MartinDias 4/17/2017 16:51'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLatestCodeChangeFilter class>>title [

	^ 'Show only latest changes'
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLatestCodeChangeFilter>>= other [

	^ self class = other class
]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLatestCodeChangeFilter>>accepts: anOmEntry [

	| finalReference log |
	log := logBrowserModel log.
	finalReference := log referenceTo: anOmEntry.
	anOmEntry content isCodeChange ifFalse: [ ^ false ].

	self entriesFromHead do: [:each |
		(log referenceTo: each) = finalReference ifTrue: [ ^ true ].
		(each content isCodeChange and: [
			each content doesOverride: anOmEntry content ]) ifTrue: [ ^ false ].
	].

	^ false "shouldn't happen"
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLatestCodeChangeFilter>>entriesFromHead [
	"Answer a cached collection of entries where first is the most recent one."
	
	^ logBrowserModel cachedLogEntries
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLatestCodeChangeFilter>>hash [

	^ self class hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLatestCodeChangeFilter>>logBrowserModel [
	^ logBrowserModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLatestCodeChangeFilter>>logBrowserModel: anEpLogBrowserModel  [
	
	logBrowserModel := anEpLogBrowserModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLatestCodeChangeFilter>>title [

	^ self class title
]
