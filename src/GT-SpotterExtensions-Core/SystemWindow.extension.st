Extension {
	#name : #SystemWindow
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
SystemWindow>>spotterActDefault [
	^ self isTopWindow
		ifTrue: [self comeToFront] "rise above non-window morphs"
		ifFalse:[	self activate].

]

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
SystemWindow>>spotterWindowsFor: aStep [
	<spotterOrder: 100>

	aStep listProcessor
			title: 'Windows';
			allCandidates: [ self class allSubInstances ];
			itemName: [ :window | '**', window label, '**' ];
			filter: GTFilterSubstring
]
