Extension {
	#name : #ClassDescription
}

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
ClassDescription>>ban: aCritique [

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
ClassDescription>>banChecksForValidation [
"returns ban levels that have to be chacked before validation"

	^ { self }
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
ClassDescription>>banLevelCandidates [
"returns code entities which can ban a rule for this entity"

	^ { self } , self package banLevelCandidates
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
ClassDescription>>critiques [
	<eProperty>
	^ ReCriticEngine critiquesOf: self
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
ClassDescription>>glmCritiqueSourceIn: composite [

	^ composite pharoScript  
		title: 'Source';
		display: [ self definition ];
		act: [ self browse ] icon: GLMUIThemeExtraIcons glamorousBrowse entitled: 'Browse'
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
ClassDescription>>reBanName [

	^ self name, ' (Class)'
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
ClassDescription>>suitableRulesFrom: aReRuleManager  [
	^ aReRuleManager classRules
]
