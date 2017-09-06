"
I check that packages constituing the Pharo Bootstrap do not depend on any other package.
"
Class {
	#name : #RBPharoBootstrapRule,
	#superclass : #RBArchitectureLintRule,
	#instVars : [
		'renrakuRule'
	],
	#category : #Refactoring-Critics-ArchitectureRules,
	#timestamp : 'ChristopheDemarey 9/23/2015 08:44'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBPharoBootstrapRule class>>isVisible [

	self flag: 'The functionality was moved to PharoBootstrapRule, but as this rule is used by Monkey, and Monkey is not using Renraku model yet, the rule is hidden'.
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBPharoBootstrapRule class>>new [
	
	^ PharoBootstrapRule asRBRule 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBPharoBootstrapRule class>>uniqueIdentifierName [
	^ 'PharoBootstrapRul'
]
