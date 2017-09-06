"
Tests verifiying the behaviour of the default SystemAnnouncer instance.
"
Class {
	#name : #SystemAnnouncerLiveTest,
	#superclass : #TestCase,
	#category : #Tests-SystemChangeNotification,
	#timestamp : 'hn 3/28/2016 12:31'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemAnnouncerLiveTest>>testNoDeadSubscriptions [

	| dead |

	3 timesRepeat: [ Smalltalk garbageCollect ].
	
	dead := SystemAnnouncer uniqueInstance 
		subscriptions subscriptions select: [ :sub | 
			sub subscriber isNil 
		].
	
	self assert: dead asArray equals: #()
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemAnnouncerLiveTest>>testOnlyWeakSubscriptions [

	| strong |

	"only weak subscriptions should be allowed to be added to the SystemAnnouncer..."
	
	strong := SystemAnnouncer uniqueInstance 
		subscriptions subscriptions reject: [ :each |
			each isKindOf: WeakAnnouncementSubscription
		].
	
	self assert: strong asArray equals: #()
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemAnnouncerLiveTest>>testSaneSubscriptionSize [
	
	"self flag: 'this should be a release test, not a regular one'"
	"self assert: SystemAnnouncer uniqueInstance subscriptions numberOfSubscriptions < 75."
]
