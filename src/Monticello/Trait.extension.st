Extension {
	#name : #Trait
}

{
	#category : #'*Monticello',
	#timestamp : ' 8/31/2017 07:17:01'
}
Trait>>asClassDefinition [
	^ MCTraitDefinition
		name: self name
		traitComposition: self traitCompositionString
		category: self category 
		comment: self organization classComment asString
		commentStamp: self organization commentStamp.
]

{
	#category : #'*Monticello',
	#timestamp : ' 8/31/2017 07:17:01'
}
Trait>>classDefinitions [
	| definitions |
	definitions := OrderedCollection with: self asClassDefinition.
	(self hasClassSide
		and: [self classTrait hasTraitComposition])
					ifTrue: [definitions add: self classTrait asMCDefinition].
	^definitions asArray
]
