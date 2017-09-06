"
This smell arises when a method is equivalent to its superclass method. The methods are equivalent when they have the same abstract syntax tree, except for variables names. Such method does not add anything to the computation and can be removed since the superclass method have the same behaviour. 

Furthermore, the methods #new and #initialize are ignored once they are often overridden for compatilbity with other platforms. The ignored methods can be edited in RBEquivalentSuperclassMethodsRule>>ignoredSelectors
"
Class {
	#name : #RBEquivalentSuperclassMethodsRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:10'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEquivalentSuperclassMethodsRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEquivalentSuperclassMethodsRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'EquivalentSuperclassMethodsRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEquivalentSuperclassMethodsRule>>basicCheck: aMethod [
	(self ignoredSelectors includes: aMethod selector)
		ifTrue: [ ^ false ].
	aMethod methodClass superclass
		ifNil: [ ^ false ]
		ifNotNil: [ :superclass |
			(superclass lookupSelector: aMethod selector)
			ifNil: [ ^ false ]
			ifNotNil: [ :overridenMethod |
				^ aMethod ast = overridenMethod ast ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEquivalentSuperclassMethodsRule>>checkMethod: aMethod [
	(self basicCheck: aMethod)
		ifTrue: [ result addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEquivalentSuperclassMethodsRule>>group [
	^ 'Design Flaws'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEquivalentSuperclassMethodsRule>>ignoredSelectors [
	"These methods are often overridden for compatilbity with other platforms."

	^ #(new initialize)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEquivalentSuperclassMethodsRule>>name [
	^ 'Methods equivalently defined in superclass'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEquivalentSuperclassMethodsRule>>rationale [
	^ 'Check for methods that are equivalent to their superclass methods.'
]
