Extension {
	#name : #TraitDescription
}

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
TraitDescription>>ban: aCritique [

	ReSystemAnnouncer uniqueInstance
		notifyCritique: aCritique
		of: aCritique sourceAnchor entity
		bannedOn: self.

	(TheManifestBuilder of: self)
		banRule: aCritique rule for: self.
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
TraitDescription>>banChecksForValidation [
"returns ban levels that have to be chacked before validation"

	^ { self }
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
TraitDescription>>banLevelCandidates [
"returns code entities which can ban a rule for this entity"

	^ { self } , self package banLevelCandidates
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
TraitDescription>>critiques [
	<eProperty>
	
	^ ReCriticEngine critiquesOf: self
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
TraitDescription>>glmCritiqueSourceIn: composite [

	^ composite pharoScript  
		title: 'Source';
		display: [ self definition ];
		act: [ self browse ] icon: GLMUIThemeExtraIcons glamorousBrowse entitled: 'Browse'
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
TraitDescription>>reBanName [

	^ self name, ' (Trait)'
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
TraitDescription>>suitableRulesFrom: aReRuleManager  [
	^ aReRuleManager classRules 
]
