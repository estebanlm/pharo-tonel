"
SmalllintManifestChecker is responsible for running a set of rules on a given subsystem.

| rules checker | 
rules := RBCompositeLintRule allGoodRules resetResult.

""the resetResult is necessary because it will build a knid of cache of the result
and this cannot be done automatically (for example you may want to run several rules without invalidating the results). ""

checker := SmalllintManifestChecker new
	runRules: rules onPackage: (RPackageOrganizer default packageNamed: #'Manifest-Core').
"
Class {
	#name : #SmalllintManifestChecker,
	#superclass : #RBSmalllintChecker,
	#instVars : [
		'manifestClassCache'
	],
	#category : #Manifest-Core,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>builderManifestClass [
	^ TheManifestBuilder
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>cleanAllManifest [
	| manifests |
	manifests := environment packages collect: [ :cl | self builderManifestClass of: cl ] as: Set.
	manifests do: [ :each | each cleanUp ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>criticsOf: aRule [

	| rules |	
	rules := rule leaves 
		detect: [:r | r class = aRule class]
		ifNone: [ ^ #() ].
	^ rules critics
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>falsePositiveOf: aRule [
	
	|critics rId rV  mb |
	critics := self criticsOf: aRule. 
	rId := aRule class uniqueIdentifierName.
	rV := aRule class identifierMinorVersionNumber.
	^ critics select: [ :critic | mb := self manifestBuilderOf: critic.
						mb isNil 
							ifTrue: [ false ] 
							ifFalse: [ mb isFalsePositive: critic onRule:  rId version: rV ]]
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>initialize [

	super initialize.
	manifestClassCache := Dictionary new.

]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>isFalsePositive: aCritic forRuleId: ruleId versionId: versionId [
	| mb |
	mb := self manifestBuilderOf: aCritic.
	^  mb isNil 
		ifTrue: [ false ] 
		ifFalse: [ mb isFalsePositive: aCritic onRule: ruleId version: versionId ]

]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>isToDo: aCritic forRuleId: ruleId versionId: versionId  [
	
	| mb |
	mb := self manifestBuilderOf: aCritic.
	^  mb isNil 
		ifTrue: [ false ] 
		ifFalse: [ mb containsToDo: aCritic onRule:  ruleId version: versionId ]

]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>isTruePositive: aCritic forRuleId: ruleId versionId: versionId  [
	
	^ (self manifestBuilderOf: aCritic)
			containsTruePositive: aCritic onRule:  ruleId version: versionId

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>manifestBuilderOf: aPackage [

	^ aPackage manifestBuilderForRuleChecker: self
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>manifestBuilderOfClass: aClass [
	| key |
	key := aClass theNonMetaClass category.
	^ manifestClassCache
		at: key
		ifAbsentPut: [ 
			(self builderManifestClass hasManifestFor: aClass)
				ifTrue: [ self builderManifestClass of: aClass ]
				ifFalse: [ nil ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>manifestBuilderOfMethod: aMethod [
	| key cl |
	cl := aMethod methodClass.
	key := cl name , aMethod category asString.
	^ manifestClassCache
		at: key
		ifAbsentPut: [ 
			(self builderManifestClass hasManifestFor: aMethod)
				ifTrue: [ self builderManifestClass of: aMethod ]
				ifFalse: [ nil ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>manifestBuilderOfPackage: aPackage [
	| key |
	key := aPackage packageName.
	^ manifestClassCache
		at: key
		ifAbsentPut: [ 
			(self builderManifestClass hasPackageNamed: key)
				ifTrue: [ self builderManifestClass ofPackageNamed: key ]
				ifFalse: [ nil ] ]
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>rejectClassesOf: aPackage [
		
	| mb |
	mb := self manifestBuilderOf: aPackage.
	^  mb isNil 
		ifTrue: [{}] 
		ifFalse: [ mb rejectClasses ]

]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>rejectRulesOf: aPackage [
		
	| mb |
	mb := self manifestBuilderOf: aPackage.
	^  mb isNil 
		ifTrue: [{}] 
		ifFalse: [ mb rejectRules]
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>rule [
	^ rule
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>runRules: aCompositeRule onPackage: aPackage [

	rule := aCompositeRule.
	environment := RBPackageEnvironment package: aPackage.
	self run.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>runRules: aCompositeRule onPackage: aPackage withoutTestCase: avoidTestCases [
	rule := aCompositeRule.
	environment := RBPackageEnvironment package: aPackage.
	
	environment := environment withoutClasses: (environment classes select: #isManifest).
	avoidTestCases 
		ifTrue: [ environment := environment withoutClasses: (environment classes select: #isTestCase) ].
	self run
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
SmalllintManifestChecker>>toDoOf: aRule [
	
	|critics rId rV mb |
	critics := self criticsOf: aRule. 
	rId := aRule class uniqueIdentifierName.
	rV := aRule class identifierMinorVersionNumber.
	^ critics select: [:critic |
		mb := (self manifestBuilderOf: critic).
		mb isNil 
			ifTrue: [ false ] 
			ifFalse: [ mb containsToDo: critic onRule:  rId version: rV ]]
	
	
]
