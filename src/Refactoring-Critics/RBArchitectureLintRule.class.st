"
I represent an architectural rule.
I work at the package level and check dependencies among packages.
"
Class {
	#name : #RBArchitectureLintRule,
	#superclass : #RBBasicLintRule,
	#category : #Refactoring-Critics-ArchitectureRules,
	#timestamp : 'ChristopheDemarey 9/23/2015 08:32'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBArchitectureLintRule class>>isVisible [
	^ self name ~= #RBArchitectureLintRule
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBArchitectureLintRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	^ 'ArchitectureLintRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBArchitectureLintRule>>group [
	^ 'Architecture'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBArchitectureLintRule>>isArchitecturalRule [
	^ true 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBArchitectureLintRule>>resultClass [
	^ RBPackageEnvironment
]
