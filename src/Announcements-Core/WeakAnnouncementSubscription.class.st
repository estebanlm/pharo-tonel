"
A WeakAnnouncementSubscription is a subscription which is removed automatically when the subscriber is unreferenced.

No support for ephemerons currently prevents this from working for Block actions (blocks hold their receiver, which is the default subscriber strongly). 

To switch between subscription types, use makeStrong/makeWeak on the subscription returned when initially registering with announcer.


Note, that list and next must be first instance variables.
"
Class {
	#name : #WeakAnnouncementSubscription,
	#superclass : #Object,
	#type : #weak,
	#instVars : [
		'list',
		'next',
		'announcer',
		'announcementClass',
		'action'
	],
	#classVars : [
		'FinalizationList'
	],
	#category : #Announcements-Core,
	#timestamp : 'IgorStasenko 3/12/2011 20:43'
}

{
	#category : #'finalization support',
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription class>>finalizationList [
	
	^ FinalizationList ifNil: [ FinalizationList := WeakFinalizationList new ].
]

{
	#category : #'finalization support',
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription class>>finalizeValues [
	
	| head |
	
	head := self finalizationList swapWithNil.
	
	[ head notNil ] whileTrue: [ 
		head finalize.
		head := head next
	].
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription class>>initialize [
	"self initialize"
	
	
	WeakArray 
		removeWeakDependent: self;
		addWeakDependent: self
		
	"Make sure that it is not added twice."
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription class>>new [
	^ (self basicNew: 1) initialize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>action [

	^ action
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>action: anObject [

	action := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>announcementClass [

	^ announcementClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>announcementClass: anObject [

	announcementClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>announcer [

	^ announcer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>announcer: anAnnouncer [
	announcer := anAnnouncer
]

{
	#category : #announcing,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>deliver: anAnnouncement [
	" deliver an announcement to receiver. In case of failure, it will be handled in separate process"

	^ (self handlesAnnouncement: anAnnouncement ) ifTrue: [
		[action cull: anAnnouncement cull: announcer] 
			on: UnhandledError fork: [:ex | ex pass ]]
]

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>finalize [

	announcer removeSubscription: self.
	
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>handlesAnnouncement: anAnnouncement [

	^ announcementClass handlesAnnouncement: anAnnouncement
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>initialize [
	list := self class finalizationList
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>makeStrong [

	| sub |
	sub := self subscriber.
	sub ifNil: [ ^ self error: 'Subscriber is nil, cannot make strong subscription' ].
	
	^ announcer replace: self with: 
		(AnnouncementSubscription new
			announcer: announcer;
			action: action asMessageSend;
			subscriber: sub;
			announcementClass: announcementClass)

]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>makeWeak [
	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>next [
	^ next
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>printOn: stream [

	super printOn: stream.
	
	stream 
		nextPut: $(;
		print: action;
		nextPut: $).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>subscriber [

	^ self basicAt: 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>subscriber: anObject [

	self subscriber ifNotNil: [ self error: 'subscriber already set' ].

	self basicAt: 1 put: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakAnnouncementSubscription>>valuable: aValuable [
	"Used when subscriber should be extracted from valuable object"
	self action:  aValuable.
	self subscriber: aValuable receiver.
]
