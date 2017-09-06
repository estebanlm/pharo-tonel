"
Utility class
"
Class {
	#name : #MCFrontier,
	#superclass : #Object,
	#instVars : [
		'frontier',
		'bag'
	],
	#category : #Monticello-Versioning,
	#timestamp : 'TorstenBergmann 2/5/2014 13:49'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFrontier class>>frontierOn: aVersionInfo [
	^ self frontierOnAll: (Array with: aVersionInfo)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFrontier class>>frontierOn: aVersionInfo and: otherVersionInfo [
	^ self frontierOnAll: (Array with: aVersionInfo with: otherVersionInfo)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFrontier class>>frontierOnAll: aCollection [
	| remaining  allVersions |
	remaining := Bag new.
	allVersions := (aCollection flatCollect: [:ea | ea withBreadthFirstAncestors]) asSet.
	allVersions do: [:ea | remaining addAll: ea ancestors].
	^self new frontier: aCollection bag: remaining
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFrontier>>frontier [
	^frontier
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFrontier>>frontier: f bag: remaining [
	frontier := f asOrderedCollection.
	bag := remaining
]

{
	#category : #advancing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFrontier>>remove: aVersionInfo [
	frontier remove: aVersionInfo.
	aVersionInfo ancestors  do:
		[ :ancestor |
			bag remove: ancestor.
			(bag occurrencesOf: ancestor) = 0
				ifTrue: [frontier add: ancestor]].
	^aVersionInfo
]

{
	#category : #advancing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFrontier>>removeAll: collection [
	collection do: [ :n | self remove: n]
]
