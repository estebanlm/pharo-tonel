"
A dictionary repository (in nemory)
"
Class {
	#name : #MCDictionaryRepository,
	#superclass : #MCRepository,
	#instVars : [
		'description',
		'dict'
	],
	#category : #Monticello-Repositories,
	#timestamp : 'TorstenBergmann 2/5/2014 13:55'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDictionaryRepository>>= other [
	^ self == other
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDictionaryRepository>>allVersionInfos [
	^ dict values collect: [:ea | ea info]
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDictionaryRepository>>basicStoreVersion: aVersion [
	dict at: aVersion info put: aVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDictionaryRepository>>closestAncestorVersionFor: anAncestry ifNone: errorBlock [
	^ anAncestry breadthFirstAncestors
		detect: [ :ea | self includesVersionWithInfo: ea ]
		ifFound: [ :info | self versionWithInfo: info ]
		ifNone: errorBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDictionaryRepository>>description [

	^ description ifNil: ['cache']
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDictionaryRepository>>description: aString [

	description := aString 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDictionaryRepository>>dictionary [

	^ dict
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDictionaryRepository>>dictionary: aDictionary [

	dict := aDictionary
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDictionaryRepository>>includesVersionNamed: aString [
	^ dict anySatisfy: [:ea | ea info name = aString]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDictionaryRepository>>includesVersionWithInfo: aVersionInfo [
	^ dict includesKey: aVersionInfo
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDictionaryRepository>>initialize [

	super initialize.
	dict := Dictionary new.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDictionaryRepository>>sortedVersionInfos [
	| sorter |
	sorter := MCVersionSorter new.
	self allVersionInfos do: [:ea | sorter addVersionInfo: ea].
	^ sorter sortedVersionInfos

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDictionaryRepository>>versionFrom: aVersionReferenceString [
	^ self dictionary detect: [ :version | version info name = aVersionReferenceString ]
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDictionaryRepository>>versionWithInfo: aVersionInfo ifAbsent: errorBlock [
	^ dict at: aVersionInfo ifAbsent: errorBlock
]
