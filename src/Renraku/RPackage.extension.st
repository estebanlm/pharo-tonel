Extension {
	#name : #RPackage
}

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RPackage>>ban: aCritique [

	ReSystemAnnouncer uniqueInstance
		notifyCritique: aCritique
		of: aCritique sourceAnchor entity
		bannedOn: self.

	(TheManifestBuilder of: self)
		banRule: aCritique rule for: self.
]

{
	#category : #'*Renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RPackage>>banChecksForValidation [
"returns ban levels that have to be chacked before validation"

	^ #()
]

{
	#category : #'*Renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RPackage>>banLevelCandidates [
"returns code entities which can ban a rule for this entity"

	^ { self . ReImageRuleBaner . RePersistentImageRuleBaner }  
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RPackage>>critiques [
	<eProperty>
	
	^ ReCriticEngine critiquesOf: self
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RPackage>>package [
	^ self
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RPackage>>reBanName [

	^ self name, ' (Package)'
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RPackage>>suitableRulesFrom: aReRuleManager  [
	^ aReRuleManager packageRules
]
