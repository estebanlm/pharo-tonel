"
List methods that have one or more arguments and do no refer to self or an instance variable. These methods might be better defined in some other class or as class methods.
"
Class {
	#name : #RBUtilityMethodsRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:13'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUtilityMethodsRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUtilityMethodsRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'UtilityMethodsRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUtilityMethodsRule>>basicCheck: aMethod  [
	^ (aMethod methodClass isMeta or: 
	 [ aMethod selector numArgs == 0 or: 
	 [ self utilityProtocols includes: aMethod protocol ] ]) not and: [
		(self 
			subclassOf: aMethod methodClass
			overrides: aMethod selector) not and: [
				aMethod superMessages isEmpty and: [ aMethod selfMessages isEmpty and: [ 
					aMethod methodClass allInstVarNames,
				   aMethod methodClass allClassVarNames asArray,
				 	#('self' )    noneSatisfy: [ :each | aMethod ast references: each ] ] ] ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUtilityMethodsRule>>checkMethod: aMethod  [
	(self basicCheck: aMethod) ifTrue:  
		[ result addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUtilityMethodsRule>>group [
	^ 'Design Flaws'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUtilityMethodsRule>>name [
	^ 'Utility methods'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUtilityMethodsRule>>subclassOf: aClass overrides: aSelector  [
	^(aClass subclasses detect: 
			[:each | 
			(each includesSelector: aSelector)
				or: [self subclassOf: each overrides: aSelector]]
		ifNone: [nil]) notNil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUtilityMethodsRule>>utilityProtocols [
	^ #('*utilit*')
]
