"
I am a subclass which work when VM does not supports finalization lists.
I am about 3 times slower when it comes to finalizing items
"
Class {
	#name : #LegacyWeakSubscription,
	#superclass : #WeakAnnouncementSubscription,
	#type : #weak,
	#category : #Announcements-Core,
	#timestamp : 'IgorStasenko 3/12/2011 21:37'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:47'
}
LegacyWeakSubscription>>makeStrong [

	| sub |
	sub := self subscriber.
	sub ifNil: [ ^ self error: 'Subscriber is nil, cannot make strong subscription' ].
	
	self unregister.

	^ self becomeForward: (AnnouncementSubscription new
		announcer: announcer;
		action: action asMessageSend;
		subscriber: sub;
		announcementClass: announcementClass)

]

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 07:16:47'
}
LegacyWeakSubscription>>register [
	self weakRegistry 
		add: self subscriber executor: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
LegacyWeakSubscription>>subscriber: anObject [

	self subscriber ifNotNil: [ self error: 'subscriber already set' ].
	self basicAt: 1 put: anObject.
	self register
]

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 07:16:47'
}
LegacyWeakSubscription>>unregister [

	self subscriber ifNotNil: [:sub |  self weakRegistry remove: sub ]
		
]

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 07:16:47'
}
LegacyWeakSubscription>>weakRegistry [
	^ WeakRegistry default
]
