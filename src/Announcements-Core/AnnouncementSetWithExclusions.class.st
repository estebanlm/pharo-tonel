"
I am an AnnouncementSet that explicitely does not handle a number of exclusion Announcements.

You could define me by #- message:

	announcer when: Announcement - ValueChanged do: [...].
	announcer when: Announcement - ValueChanged - ValueAdded do: [...].
	announcer when: ValueAdded, ValueRemoved - ValueAdded
 
Internal Representation and Key Implementation Points.

    Instance Variables
	exclusions:		<OrderedCollection>
"
Class {
	#name : #AnnouncementSetWithExclusions,
	#superclass : #AnnouncementSet,
	#instVars : [
		'exclusions'
	],
	#category : #Announcements-Core,
	#timestamp : 'DenisKudryashov 8/4/2016 15:17'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSetWithExclusions>>addExclusion: anAnnouncement [
	"Add anAnnouncement as an exclusion to me.
	I will explicitely not handle my exclusion announcements."
	
	^ exclusions add: anAnnouncement 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSetWithExclusions>>handlesAnnouncement: anAnnouncement [
	"Return true when I will handle anAnnouncement.
	I extend my superclass behavior by explicitely 
	not handling the exclusions."

	^ (super handlesAnnouncement: anAnnouncement) 
			and: [ exclusions noneSatisfy: [ :each | each handlesAnnouncement: anAnnouncement ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSetWithExclusions>>initialize [

	super initialize.
	exclusions := OrderedCollection new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:47'
}
AnnouncementSetWithExclusions>>initialize: aNumber [

	super initialize: aNumber.
	exclusions := OrderedCollection new
]
