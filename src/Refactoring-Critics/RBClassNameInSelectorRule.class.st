"
This smell arises when the class name is found in a selector. This is redundant since to call the you must already refer to the class name. For example, #openHierarchyBrowserFrom: is a redundant name for HierarchyBrowser.
"
Class {
	#name : #RBClassNameInSelectorRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:13'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNameInSelectorRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNameInSelectorRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'ClassNameInSelectorRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNameInSelectorRule>>basicCheck: aMethod  [
	(aMethod methodClass isMeta) ifFalse: [ ^ false ].
	^ (aMethod selector 
		indexOfSubCollection: aMethod methodClass soleInstance name
		startingAt: 1) > 0
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNameInSelectorRule>>checkMethod: aMethod  [
	(self basicCheck: aMethod) ifTrue: 
		[ result addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNameInSelectorRule>>group [
	^ 'Style'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNameInSelectorRule>>name [
	^ 'Redundant class name in selector'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNameInSelectorRule>>rationale [
	^ 'Checks for the class name in a selector. This is redundant since to call the you must already refer to the class name. For example, openHierarchyBrowserFrom: is a redundant name for HierarchyBrowser. Avoiding selector including class name gives a chance to have more polymorphic methods.'
]
