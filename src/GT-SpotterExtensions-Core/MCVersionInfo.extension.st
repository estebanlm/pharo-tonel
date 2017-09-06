Extension {
	#name : #MCVersionInfo
}

{
	#category : #'*GT-SpotterExtensions-Core-private',
	#timestamp : ' 8/31/2017 05:26:36'
}
MCVersionInfo>>allAncestors [
	^ (self allAncestorsTo: OrderedCollection new)
		sort: [ :a :b | a timeStamp >= b timeStamp ]
]

{
	#category : #'*GT-SpotterExtensions-Core-private',
	#timestamp : ' 8/31/2017 05:26:36'
}
MCVersionInfo>>allAncestorsTo: aCollection [
	self ancestors do: [ :versionInfo | 
		" do not add/process ancestry-branches which have already been added/processed "
		(aCollection includes: versionInfo) ifFalse: [ 
			aCollection add: versionInfo.
			versionInfo allAncestorsTo: aCollection ] ].
	^ aCollection
]

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
MCVersionInfo>>gtDisplayOn: stream [
	stream nextPutAll: self name
]

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
MCVersionInfo>>"protocol: *GT-SpotterExtensions-Core"
spotterAncestorsFor: aStep [
	<spotterOrder: 1>
	self flag: 'rewrite for direct streaming - get rid of recursion'.
	aStep listProcessor
		title: 'Ancestors';
		allCandidates: [ self allAncestors ];
		filter: GTFilterSubstring
]
