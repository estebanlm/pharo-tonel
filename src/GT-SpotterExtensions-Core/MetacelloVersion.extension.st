Extension {
	#name : #MetacelloVersion
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
MetacelloVersion>>spotterForGroupsFor: aStep [
	<spotterOrder: 2>
	aStep listProcessor
		title: 'Groups';
		allCandidates: [ self groups ];
		itemName: [ :item | item name ];
		filter: GTFilterSubstring;
		wantsToDisplayOnEmptyQuery: true
]

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
MetacelloVersion>>spotterForPackagesFor: aStep [
	<spotterOrder: 3>
	aStep listProcessor
		title: 'Packages';
		allCandidates: [ self packages ];
		itemName: [ :item | item file ];
		filter: GTFilterSubstring;
		wantsToDisplayOnEmptyQuery: true
]
