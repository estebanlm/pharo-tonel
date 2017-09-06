Extension {
	#name : #Dictionary
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
Dictionary>>spotterForKeysFor: aStep [
	<spotterOrder: 15>
	aStep listProcessor
			title: 'Keys';
			allCandidates: [ self keys ];
			candidatesLimit: 5;
			filter: GTFilterSubstring
]
