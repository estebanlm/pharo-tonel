"
I represent condition which should be satisfied on given announcement to be delivered to subscription.
I am used to implement instance specific subscription on announcements. 

To create me send message #where to announcement class with condition block:

	Announcement where: [ :ann | ann param = #expected ]

I can be used directly in announcer subscription API in place of announcement class:

	announcer when:  (ValueChanged where: [:change | change oldValue = 100])

Be carefull with me because blocks in subscriptions produce references to outer contexts (recever and all senders)
 
Internal Representation and Key Implementation Points.

    Instance Variables
	announcementClass:		<Announcement class>
	conditionBlock:		<BlockClosure>
"
Class {
	#name : #AnnouncementDeliveryCondition,
	#superclass : #Object,
	#instVars : [
		'announcementClass',
		'conditionBlock'
	],
	#category : #Announcements-Core,
	#timestamp : 'DenisKudryashov 6/2/2016 23:56'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementDeliveryCondition class>>for: anAnnouncementClass where: aBlock [

	^self new 
		announcementClass: anAnnouncementClass;
		conditionBlock: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementDeliveryCondition>>announcementClass [
	^ announcementClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementDeliveryCondition>>announcementClass: anObject [
	announcementClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementDeliveryCondition>>conditionBlock [
	^ conditionBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementDeliveryCondition>>conditionBlock: anObject [
	conditionBlock := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementDeliveryCondition>>handlesAnnouncement: anAnnouncement [

	^(announcementClass handlesAnnouncement: anAnnouncement)
		and: [conditionBlock value: anAnnouncement ] 
]
