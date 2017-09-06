"
ifNotNilDo: should not be used as ifNotNil: works for blocks with arguments, too.
"
Class {
	#name : #RBRuleIfNotNilDo,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'MarcusDenker 8/15/2015 15:24'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRuleIfNotNilDo class>>uniqueIdentifierName [

	^ 'RuleIfNotNilDo'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRuleIfNotNilDo>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRuleIfNotNilDo>>initialize [
	super initialize.
	self rewriteRule
		replace: '`@receiver ifNotNilDo: `@statements'
			with: '`@receiver ifNotNil: `@statements';	
		replace: '`@receiver ifNotNilDo: `@statements1 ifNil: `@statements2'
			with: '`@receiver ifNotNil: `@statements1 ifNil: `@statements2';
		replace: '`@receiver ifNil: `@statements1 ifNotNilDo: `@statements2'
			with: '`@receiver ifNil: `@statements1 ifNotNil: `@statements2'
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRuleIfNotNilDo>>name [
	^ 'Use "ifNotNil:" not "ifNotNilDo:"'
]
