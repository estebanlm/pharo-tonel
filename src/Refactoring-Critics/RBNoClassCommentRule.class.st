"
This smell arises when a class has no comment. Classes should have comments to explain their purpose, collaborations with other classes, and optionally provide examples of use.
"
Class {
	#name : #RBNoClassCommentRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:50'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBNoClassCommentRule class>>checksClass [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBNoClassCommentRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'NoClassCommentRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBNoClassCommentRule>>basicCheck: aClass [
	(aClass isMeta or: [ aClass isTestCase ])
		ifTrue: [ ^ false ].
	^ aClass hasComment not
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBNoClassCommentRule>>checkClass: aClass [
	(self basicCheck: aClass)
		ifTrue: [ result addClassAndMetaClassFor: aClass ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBNoClassCommentRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBNoClassCommentRule>>name [
	^ 'No class comment'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBNoClassCommentRule>>rationale [
	^ 'Classes should have comments to explain their purpose, collaborations with other classes, and optionally provide examples of use.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBNoClassCommentRule>>resultClass [
	^ RBClassEnvironment
]
