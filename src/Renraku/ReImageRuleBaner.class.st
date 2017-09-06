"
A pluggable functionality used to ban rules in the image scale
"
Class {
	#name : #ReImageRuleBaner,
	#superclass : #Object,
	#category : #Renraku-Utility,
	#timestamp : 'YuriyTymchuk 6/28/2017 12:45'
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReImageRuleBaner class>>ban: aCritique [
	
	ReSystemAnnouncer uniqueInstance
		notifyCritique: aCritique
		of: aCritique sourceAnchor entity
		bannedOn: self.

	(aCritique rule isKindOf: ReAbstractRule)
		ifTrue: [
			aCritique rule class enabled: false ]
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReImageRuleBaner class>>reBanName [
	^ 'The whole image'
]
