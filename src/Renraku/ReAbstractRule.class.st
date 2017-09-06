"
I an the root of all quality rules rules.

If you want to learn about the features of rules or how to create your own, please read:

RenrakuRuleHelp readInHelpBrowser
"
Class {
	#name : #ReAbstractRule,
	#superclass : #Object,
	#instVars : [
		'one'
	],
	#classInstVars : [
		'enabled'
	],
	#category : #Renraku-Rules,
	#timestamp : 'YuriyTymchuk 7/12/2016 14:56'
}

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule class>>asRBRule [

	^ self new asRBRule
]

{
	#category : #testing-interest,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule class>>checksClass [

	^ false
]

{
	#category : #testing-interest,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule class>>checksMethod [

	^ false
]

{
	#category : #testing-interest,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule class>>checksNode [

	^ false
]

{
	#category : #testing-interest,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule class>>checksPackage [

	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule class>>enabled [

	^ enabled ifNil: [ enabled := true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule class>>enabled: aBoolean [
	enabled := aBoolean.
	ReRuleManager reset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule class>>enabledSettingID [

	^ (self name, '_enabled') asSymbol
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule class>>identifierMinorVersionNumber [
	"This number identifies the version of the rule definition. Each time the rule is updated and its changes invalidates previous false positives identification (and as such should be reassessed by developers) the number should be increased."
	^ 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule class>>isUsed [
	"all my sublasses are used"
	^self name = 'RBLintRule'
		ifTrue: [ super isUsed ]
		ifFalse: [ true ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule class>>isVisible [
	
	^ self methodOfInteresetSelectors anySatisfy: [ :selector |
		self perform: selector ]
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule class>>methodOfInteresetSelectors [

	^ #(checksMethod checksClass checksPackage checksNode)
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^ self name
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule class>>uniqueIdentifierNumber [
	"This number should be unique and should change only when the rule completely change semantics"
	^ 0
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule>>anchorFor: anEntity [

	^ ReSourceAnchor
			entity: anEntity
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule>>asRBRule [

	^ RBRenrakuWrapperLintRule new: self
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule>>basicCheck: anEntity [

	^ self subclassResponsibility 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule>>check: anEntity [

	| critiques |
	
	critiques := OrderedCollection new.
	self check: anEntity forCritiquesDo: [ :critique | critiques add: critique ].
	^ critiques
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule>>check: anEntity forCritiquesDo: aCriticBlock [

	(self basicCheck: anEntity)
		ifTrue: [ aCriticBlock cull: (self critiqueFor: anEntity) ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule>>check: anEntity forCritiquesDo: aCriticBlock ifNone: alternativeBlock [
	| encounteredCritique |
	
	encounteredCritique := false.

	self check: anEntity forCritiquesDo: [ :crit |
		encounteredCritique := true.
		aCriticBlock cull: crit ].
	
	encounteredCritique ifFalse: alternativeBlock
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule>>check: anEntity ifNoCritiques: alternativeBlock [
	| critiques |
	
	critiques := OrderedCollection new.
	self check: anEntity forCritiquesDo: [ :critique | critiques add: critique ] ifNone: alternativeBlock.
	^ critiques
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule>>critiqueFor: anEntity [

	^ ReTrivialCritique
		withAnchor: (self anchorFor: anEntity)
		by: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule>>group [
	^ 'Unclassified rules'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule>>isComposite [

	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule>>name [
	"Answer a human readable name of the rule."

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule>>rationale [
	"Answer an explanation of the rule, usually in one line. Long description can be obtained using longDescription."

	^ self class comment
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule>>resetResult [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractRule>>severity [
	"Answer the severity of issues reported by this rule. This method should return one of #error, #warning, or #information."

	^ #warning
]
