"
I am a wrapper around an Announcer, used to create weak subscriptions at subscription time.

Use me like this:

anAnnouncer weak subscribe: Announcement send: #foo to: barObject.

I raise an error for block subscriptions, as they require non-existing Ephemeron support to function correctly.
"
Class {
	#name : #WeakSubscriptionBuilder,
	#superclass : #Object,
	#instVars : [
		'announcer'
	],
	#category : #Announcements-Core,
	#timestamp : 'IgorStasenko 3/12/2011 20:37'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakSubscriptionBuilder class>>on: announcer [
	^ self new announcer: announcer
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakSubscriptionBuilder>>announcer: anAnnouncer [
	announcer := anAnnouncer 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakSubscriptionBuilder>>subscribe: anAnnouncementClass do: aValuable  [
	"Do not use this message on weak announcer because it does not work. The block will hold strongly the receiver and more.
	 We need ephemerons for that'"
	"aValuable isBlock ifTrue: [  
		self error: 'Do not use this message on weak and block because it does not work. We need ephemerons for that']."
	^	announcer basicSubscribe: (
			LegacyWeakSubscription new 
				announcer: announcer;
				announcementClass: anAnnouncementClass;
				valuable: aValuable)
]

{
	#category : #'wrapped protocol',
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakSubscriptionBuilder>>subscribe: anAnnouncementClass send: aSelector to: anObject [
	^ self subscribe: anAnnouncementClass do: (WeakMessageSend receiver: anObject selector: aSelector)
]

{
	#category : #'wrapped protocol',
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakSubscriptionBuilder>>weak [
	"already weak"
	^ self
]

{
	#category : #'wrapped protocol',
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakSubscriptionBuilder>>when: anAnnouncementClass do: aValuable [
	"Do not use this message on announcer weak. We did not deprecated this method because it may break some behavior."
	self error: 'Not supported'
]

{
	#category : #'wrapped protocol',
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakSubscriptionBuilder>>when: anAnnouncementClass send: aSelector to: anObject [
	^ self subscribe: anAnnouncementClass send: aSelector to: anObject
]
