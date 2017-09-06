"
The subscription is a single entry in a SubscriptionRegistry.
Several subscriptions by the same object is possible.

I know how to make myself weak or strong, only use this capability if it can't be determined at subscribe time though, as it uses become: (for thread-safety), which is quite slow.
"
Class {
	#name : #AnnouncementSubscription,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'announcementClass',
		'subscriber',
		'action'
	],
	#category : #Announcements-Core,
	#timestamp : 'IgorStasenko 3/12/2011 20:23'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSubscription>>action [

	^ action
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSubscription>>action: anObject [

	action := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSubscription>>announcementClass [

	^ announcementClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSubscription>>announcementClass: anObject [

	announcementClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSubscription>>announcer [

	^ announcer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSubscription>>announcer: anAnnouncer [
	announcer := anAnnouncer
]

{
	#category : #announcing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSubscription>>deliver: anAnnouncement [
	" deliver an announcement to receiver. In case of failure, it will be handled in separate process"

	^ (self handlesAnnouncement: anAnnouncement ) ifTrue: [
		[action cull: anAnnouncement cull: announcer] 
			on: UnhandledError fork: [:ex | ex pass ]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSubscription>>handlesAnnouncement: anAnnouncement [

	^ announcementClass handlesAnnouncement: anAnnouncement
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSubscription>>makeStrong [
	" i am already strong. Do nothing "
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSubscription>>makeWeak [
	
	action isBlock ifTrue: [
		self error: 'Not currently available due to missing ephemerons support'
		].

	^ announcer replace: self with: 
		(LegacyWeakSubscription new
			announcer: announcer;
			action: action asWeakMessageSend;
			subscriber: subscriber;
			announcementClass: announcementClass)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSubscription>>subscriber [
	^ subscriber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSubscription>>subscriber: aSubscriber [
	subscriber := aSubscriber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSubscription>>valuable: aValuable [
	"Used when subscriber should be extracted from valuable object"
	self action:  aValuable.
	self subscriber: aValuable receiver.
]
