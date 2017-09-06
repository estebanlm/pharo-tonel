Extension {
	#name : #MetacelloAbstractPackageSpec
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
MetacelloAbstractPackageSpec>>spotterForIncludesFor: aStep [
	<spotterOrder: 1>
	aStep listProcessor
		title: 'Includes';
		allCandidates: [ self includes ];
		itemName: [ :item | item name ];
		filter: GTFilterSubstring;
		wantsToDisplayOnEmptyQuery: true
]

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
MetacelloAbstractPackageSpec>>spotterForRequiresFor: aStep [
	<spotterOrder: 2>
	aStep listProcessor
		title: 'Requires';
		allCandidates: [ self requires ];
		itemName: [ :item | item name ];
		filter: GTFilterSubstring;
		wantsToDisplayOnEmptyQuery: true
]
