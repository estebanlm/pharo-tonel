"
The implementation uses a threadsafe subscription registry, in the sense that registering, unregistering, and announcing from an announcer at the same time in different threads should never cause failures.

For security reasons, registry is kept private, and has no accessor like in other implementations
"
Class {
	#name : #Announcer,
	#superclass : #Object,
	#instVars : [
		'registry'
	],
	#category : #Announcements-Core,
	#timestamp : 'MarcusDenker 3/3/2017 10:17'
}

{
	#category : #announce,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>announce: anAnnouncement [

	| announcement |
	announcement := anAnnouncement asAnnouncement.	
	registry ifNotNil: [
		registry deliver: announcement
		].
	^ announcement
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>basicSubscribe: subscription [
	^ registry add: subscription
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>hasSubscriber: anObject [

	registry subscriptionsOf: anObject do: [:each | ^ true].
	^ false
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>initialize [
	super initialize.
	registry := SubscriptionRegistry new.
]

{
	#category : #statistics,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>numberOfSubscriptions [
	^ registry numberOfSubscriptions

]

{
	#category : #subscription,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>removeSubscription: subscription [
	"Remove the given subscription from the receiver"
	
	^ registry remove: subscription

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>replace: subscription with: newOne [
	^ registry replace: subscription with: newOne

]

{
	#category : #subscription,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>subscribe: anAnnouncementClass do: aValuable  [
	"Declare that when anAnnouncementClass is raised, aValuable is executed."
	^ registry add: (
		AnnouncementSubscription new 
			announcer: self;
			announcementClass: anAnnouncementClass;
			valuable: aValuable)
]

{
	#category : #subscription,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>subscribe: anAnnouncementClass send: aSelector to: anObject [
	"Declare that when anAnnouncementClass is raised, anObject should receive the message aSelector."
	
	^ self subscribe: anAnnouncementClass do: (MessageSend receiver: anObject selector: aSelector)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>subscriptions [

	^ registry
]

{
	#category : #subscription,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"
	
	registry removeSubscriber: anObject
]

{
	#category : #weak,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>weak [
	"announcer weak subscribe: foo"
	^ WeakSubscriptionBuilder on: self
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>when: anAnnouncementClass do: aValuable [
	"Declare that when anAnnouncementClass is raised, aValuable is executed.  Pay attention that ushc method as well as when:do: should not be used on weak announcer since the block holds the receiver and more strongly."
	
	^ self subscribe: anAnnouncementClass do: aValuable
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>when: anAnnouncementClass do: aValuable for: aSubscriber [
	"Declare that when anAnnouncementClass is raised, aValuable is executed and define the subscriber."
	
    ^ (self subscribe: anAnnouncementClass do: aValuable) subscriber: aSubscriber; yourself
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:47'
}
Announcer>>when: anAnnouncementClass send: aSelector to: anObject [
	"Declare that when anAnnouncementClass is raised, anObject should receive the message aSelector.
    When the message expects one argument (eg #fooAnnouncement:) the announcement is passed as argument.
    When the message expects two arguments (eg #fooAnnouncement:announcer:) both the announcement and the announcer 
    are passed as argument"

	^ self subscribe: anAnnouncementClass send: aSelector to: anObject
]
