"
Checks that a class does not override a message that is essential to the base system. For example, if you override the #class method from object, you are likely to crash your image. #classShouldNotOverride returns the list of messages which should not be overriden.
"
Class {
	#name : #RBOverridesSpecialMessageRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:30'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBOverridesSpecialMessageRule class>>checksClass [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBOverridesSpecialMessageRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'OverridesSpecialMessageRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBOverridesSpecialMessageRule>>basicCheck: aClass  [
	| selectors |
	selectors := aClass isMeta 
		ifTrue: [ self metaclassShouldNotOverride ]
		ifFalse: [ self classShouldNotOverride ].
	^ selectors anySatisfy: [ :each |
		(aClass superclass notNil
			and: [ (aClass superclass canUnderstand: each)
			and: [ (aClass includesSelector: each) ] ]) ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBOverridesSpecialMessageRule>>checkClass: aClass  [
	| selectors |
	selectors := aClass isMeta 
		ifTrue: [ self metaclassShouldNotOverride ]
		ifFalse: [ self classShouldNotOverride ].
	selectors do: [ :each |
		(aClass superclass notNil
			and: [ (aClass superclass canUnderstand: each)
			and: [ (aClass includesSelector: each) ] ])
				ifTrue: [ result addClass: aClass selector: each ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBOverridesSpecialMessageRule>>classShouldNotOverride [
	^ #( #== #~~ #class #basicAt: #basicAt:put: #basicSize #identityHash )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBOverridesSpecialMessageRule>>group [
	^ 'Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBOverridesSpecialMessageRule>>longDescription  [

	^ 'Checks that a class does not override a message that is essential to the base system. For example, if you override the #class method from object, you are likely to crash your image.
In the class the messages we should not override are: ',  (', ' join: (self classShouldNotOverride) ),'.
In the class side the messages we should not override are: ',  (', ' join: (self metaclassShouldNotOverride) ),'.' 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBOverridesSpecialMessageRule>>metaclassShouldNotOverride [
	^ #( #basicNew #basicNew #class #comment #name )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBOverridesSpecialMessageRule>>name [
	^ 'Overrides a "special" message'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBOverridesSpecialMessageRule>>severity [
	^ #error
]
