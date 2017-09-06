Extension {
	#name : #GTInspector
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTInspector class>>spotterExtensionsFor: aStep [
	<spotterOrder: 50>
	aStep listProcessor
			allCandidates: [ self inspectorExtendingMethods ];
			title: 'Extensions';
			itemName:[ :each | each gtDisplayString ];
			filter: GTFilterSubstring;
			wantsToDisplayOnEmptyQuery: true
]
