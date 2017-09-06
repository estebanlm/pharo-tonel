Extension {
	#name : #CompiledMethod
}

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
CompiledMethod>>ban: aCritique [

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
CompiledMethod>>banChecksForValidation [
"returns ban levels that have to be checked before validation"

	^ { self . self methodClass }

]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
CompiledMethod>>banLevelCandidates [
"returns code entities which can ban a rule for this entity"

	^ { self } , self methodClass banLevelCandidates
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
CompiledMethod>>critiques [
	<eProperty>
	| critiques |
	
	critiques := ReCriticEngine critiquesOf: self.
	critiques :=
		critiques,
		(ReCriticEngine nodeCritiquesOf: self).
	
	^ critiques
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
CompiledMethod>>glmCritiqueSourceIn: composite [

	^ self gtInspectorSourceIn: composite
	
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
CompiledMethod>>overriddenMethods [
	| overridenMethods |
	
	overridenMethods := OrderedCollection new.

	self methodClass allSuperclasses
		do: [ :class |
			class compiledMethodAt: self selector
				ifPresent: [ :method | overridenMethods add: method ]
				ifAbsent: [ ] ].
			
	^ overridenMethods 
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
CompiledMethod>>reBanName [

	^ self name, ' (Method)'
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
CompiledMethod>>suitableRulesFrom: aReRuleManager  [
	^ aReRuleManager methodRules
]
