Extension {
	#name : #SubscriptionRegistry
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
SubscriptionRegistry>>gtInspectorSubscriptionsIn: composite [
	<gtInspectorPresentationOrder: 0>
	composite table 
		title: 'Subscriptions';
		display: [ self subscriptions ];
		column: 'Class' evaluated: [ :each | each announcementClass ];
		column: 'Subscriber' evaluated: [ :each | each subscriber ]
]
