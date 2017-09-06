"
This filter rejects an arbitrary collection of log entries.
"
Class {
	#name : #EpEntryReferencesFilter,
	#superclass : #EpFilter,
	#instVars : [
		'theLog',
		'rejectedEntryReferences'
	],
	#category : #EpiceaBrowsers-Filters,
	#timestamp : 'MartinDias 4/17/2017 20:29'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryReferencesFilter class>>title [

	^ 'Hide selected entries'
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryReferencesFilter>>= other [

	^ self class = other class and: [ 
		self rejectedEntryReferences = other rejectedEntryReferences ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryReferencesFilter>>accepts: anOmEntry [

	| reference |
	reference := theLog referenceTo: anOmEntry.

	^ (rejectedEntryReferences includes: reference) not
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryReferencesFilter>>hash [

	^ self class hash bitXor: self rejectedEntryReferences hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryReferencesFilter>>rejectedEntryReferences [
	^ rejectedEntryReferences
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryReferencesFilter>>rejectedEntryReferences: anObject [
	rejectedEntryReferences := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryReferencesFilter>>theLog [
	^ theLog
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryReferencesFilter>>theLog: anObject [
	theLog := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryReferencesFilter>>title [

	^ self class title
]
