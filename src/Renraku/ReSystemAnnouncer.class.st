"
I announnce events related to Renraku and it's users.

To see the possilbe announcements check ReCriticEvent hierarchy.

To subscribe use:

ReSystemAnnouncer uniqueInstance week ...
"
Class {
	#name : #ReSystemAnnouncer,
	#superclass : #Announcer,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #Renraku-Announcements,
	#timestamp : 'YuriyTymchuk 11/20/2015 16:43'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSystemAnnouncer class>>uniqueInstance [
	"I'm a singleton…"
	
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{
	#category : #announce,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSystemAnnouncer>>notifyCritique: aCritique descriptionViewedFor: anEntity [

	self announce: (
		ReCritiqueDescriptionViewed new 
			critique: aCritique;
			entity: anEntity;
			yourself)
  
]

{
	#category : #announce,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSystemAnnouncer>>notifyCritique: aCritique of: anEntity bannedOn: anEntityBanLevel [

	self announce: (
		ReCritiqueBanned new
			critique: aCritique;
			entity: anEntity;
			entityBanLevel: anEntityBanLevel;
			yourself)

]

{
	#category : #announce,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSystemAnnouncer>>notifyEntity: anEntity criticizedWith: critiques [

	self announce: (
		ReEntityCriticized new 
			critiques: critiques;
			entity: anEntity;
			yourself)

]
