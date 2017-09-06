"
Same as SmalllintManifestChecker but with tweaks for Renraku model 
"
Class {
	#name : #ReSmalllintChecker,
	#superclass : #SmalllintManifestChecker,
	#instVars : [
		'methodRules',
		'nodeRules',
		'classRules',
		'packageRules',
		'critiques'
	],
	#category : #Renraku-CriticBrowser,
	#timestamp : 'YuriyTymchuk 7/7/2016 19:08'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSmalllintChecker>>addCritique: aCritique [

	^ critiques add: aCritique
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSmalllintChecker>>checkClass: aClass [

	(environment includesClass: aClass) ifFalse: [ ^ self ].

	self getCritiquesAbout: aClass by: classRules
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSmalllintChecker>>checkMethodsForClass: aClass [
	environment
		selectorsForClass: aClass
		do: [ :selector | | method |
			method := aClass>>selector.
			self getCritiquesAbout: method by: methodRules.
			method ast nodesDo: [ :node |
				nodeRules do: [ :r |
					r
						check: node
						forCritiquesDo: [ :crit |
							crit sourceAnchor initializeEnitity: method.
							self addCritique: crit ] ] ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSmalllintChecker>>checkPackage: aPackage [

	(environment includesPackage: aPackage) ifTrue: [
		self getCritiquesAbout: aPackage by: packageRules ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSmalllintChecker>>criticsOf: aRule [

	^ critiques
		select: [ :c | c rule class = aRule class ]
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSmalllintChecker>>falsePositiveOf: aRule [
	
	| ruleCritiques rId rV  mb |
	ruleCritiques := self criticsOf: aRule. 
	rId := aRule class uniqueIdentifierName.
	rV := aRule class identifierMinorVersionNumber.
	^ ruleCritiques select: [ :critique |
		| entity |
		entity := critique sourceAnchor entity.		
		mb := self manifestBuilderOf: entity.
		mb isNil 
			ifTrue: [ false ] 
			ifFalse: [ mb isFalsePositive: entity onRule:  rId version: rV ]]
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSmalllintChecker>>getCritiquesAbout: anEntity by: rules [

	rules do: [ :r |
		[ r
			check: anEntity
			forCritiquesDo: [ :crit |
				self addCritique: crit ] ]
			
			on: Error
			do: [ :er | ReSettings showErrors ifTrue: [ er pass ]  ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSmalllintChecker>>initialize [
	super initialize.
	self resetResult 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSmalllintChecker>>reParseRule [

	methodRules  := Set new.
	nodeRules    := Set new.
	classRules   := Set new.
	packageRules := Set new.

	self rule do: [ :r |
		r class checksMethod  ifTrue: [ methodRules  add: r ].
		r class checksNode    ifTrue: [ nodeRules    add: r ].
		r class checksClass   ifTrue: [ classRules   add: r ].
		r class checksPackage ifTrue: [ packageRules add: r ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSmalllintChecker>>resetResult [

	critiques := Set new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSmalllintChecker>>rule [
	
	^ (rule isKindOf: RBCompositeLintRule)
		ifTrue: [ rule leaves ]
		ifFalse: [ rule ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSmalllintChecker>>run [
	self reParseRule.
	super run
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSmalllintChecker>>toDoOf: aRule [
	
	| ruleCritiques rId rV mb |
	ruleCritiques := self criticsOf: aRule. 
	rId := aRule class uniqueIdentifierName.
	rV := aRule class identifierMinorVersionNumber.
	^ ruleCritiques select: [:critique |
		| entity |
		entity := critique sourceAnchor entity.
		mb := (self manifestBuilderOf: entity).
		mb isNil 
			ifTrue: [ false ] 
			ifFalse: [ mb containsToDo: entity onRule:  rId version: rV ]]
]
