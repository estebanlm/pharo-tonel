Extension {
	#name : #Collection
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
Collection>>spotterItemsFor: aStep [
	<spotterOrder: 10>
	| processor |
	(self isEmpty or: [ self size > self gtCollectionSizeThreshold ]) ifTrue: [ ^ self ].
	processor := aStep previousProcessorFrom: self.
	^ aStep listProcessor
		title: processor title;
		candidatesLimit: 100;
		items: [ self collect: [ :each | each asSpotterCandidateLink value] as: OrderedCollection ];
		itemName: processor itemName;
		itemIcon: processor itemIcon;
		actLogic: processor actLogic;
		itemFilterName: processor itemFilterName;
		filter: processor filter gtListFilter;
		wantsToDisplayOnEmptyQuery: true
]
