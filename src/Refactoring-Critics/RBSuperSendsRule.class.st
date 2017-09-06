"
Rewrite super messages to self messages when both refer to same method
"
Class {
	#name : #RBSuperSendsRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'StephaneDucasse 11/29/2014 18:53'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSuperSendsRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'SuperSendsRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSuperSendsRule>>group [
	^ 'Design Flaws'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSuperSendsRule>>initialize [
	super initialize.
	self rewriteRule 
		replace: 'super `@message: ``@args' 
		with: 'self `@message: ``@args'
		when: [ :node | 
			(class withAllSubclasses 
				detect: [:each | each includesSelector: node selector]
				ifNone: [ nil ]) isNil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSuperSendsRule>>name [
	^ 'Rewrite super messages to self messages'
]
