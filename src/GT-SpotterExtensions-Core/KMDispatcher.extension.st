Extension {
	#name : #KMDispatcher
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
KMDispatcher>>spotterForKeysFor: aStep [
	<spotterOrder: 15>
		
	aStep listProcessor
			title: 'Keys';
			allCandidates: [ (self gtAllKeyCategoryPairs collect: #key) asOrderedCollection ];
			itemName: [ :aKeymap | 
				aKeymap shortcut gtDisplayString, 
				(aKeymap name ifNil: [ '' ] ifNotNil: [ ' [', aKeymap name,']' ]) ];
			candidatesLimit: 5;
			filter: GTFilterSubstrings
]
