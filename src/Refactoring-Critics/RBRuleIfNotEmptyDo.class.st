"
ifNotEmptyDo: should not be used as ifNotEmpty: works for blocks with arguments, too.
"
Class {
	#name : #RBRuleIfNotEmptyDo,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'MarcusDenker 8/15/2015 15:34'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRuleIfNotEmptyDo class>>uniqueIdentifierName [

	^ 'RuleIfNotEmptyDo'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRuleIfNotEmptyDo>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRuleIfNotEmptyDo>>initialize [
	super initialize.
	self rewriteRule
		replace: '`@receiver ifNotEmptyDo: `@statements'
			with: '`@receiver ifNotEmpty: `@statements';	
		replace: '`@receiver ifNotEmptyDo: `@statements1 ifEmpty: `@statements2'
			with: '`@receiver ifNotEmpty: `@statements1 ifEmpty: `@statements2';
		replace: '`@receiver ifEmpty: `@statements1 ifNotEmptyDo: `@statements2'
			with: '`@receiver ifEmpty: `@statements1 ifNotEmpty: `@statements2'
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRuleIfNotEmptyDo>>name [
	^ 'Use "ifNotEmpty:" not "ifNotEmptyDo:"'
]
