"
Each rule should define a #basicCheck: method which accepts an entity to be validated by the rule.

If the entity violates the rule, method should ruturn ""true"", otherwise - ""false"".

It is recommended to reuse #basicCheck: functionality in #checkClass: and #checkMethod:
"
Class {
	#name : #RBDefineBasickCheckRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'YuriyTymchuk 1/13/2016 22:46'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineBasickCheckRule class>>checksClass [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineBasickCheckRule class>>uniqueIdentifierName [
	
	^ 'RBDefineBasickCheckRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineBasickCheckRule>>basicCheck: aClass  [
	
	^ (aClass inheritsFrom: RBLintRule) and: [ 
		aClass isVisible and: [ 
	  (aClass lookupSelector: #basicCheck:) isSubclassResponsibility ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineBasickCheckRule>>checkClass: aClass  [
	(self basicCheck: aClass) ifTrue: [ result addClass: aClass ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineBasickCheckRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineBasickCheckRule>>name [
	^ 'Rule does not define #basicCheck:'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefineBasickCheckRule>>resultClass [
	^ RBClassEnvironment
]
