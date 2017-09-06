"
This smell arises when a class is not referenced either directly or indirectly by a symbol. If a class is not referenced, it can be removed.
"
Class {
	#name : #RBClassNotReferencedRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:12'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNotReferencedRule class>>checksClass [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNotReferencedRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'ClassNotReferencedRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNotReferencedRule>>basicCheck: aClass  [
	^ aClass isUsed not
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNotReferencedRule>>checkClass: aClass [
	(self basicCheck: aClass)
		ifTrue: [ result addClassAndMetaClassFor: aClass ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNotReferencedRule>>group [
	^ 'Design Flaws'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNotReferencedRule>>name [
	^ 'Class not referenced'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNotReferencedRule>>rationale [
	^ 'Check if a class is referenced either directly or indirectly by a symbol. If a class is not referenced, it can be removed.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNotReferencedRule>>resultClass [
	^ RBClassEnvironment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBClassNotReferencedRule>>severity [
	^ #information
]
