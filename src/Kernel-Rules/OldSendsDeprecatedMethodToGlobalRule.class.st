"
Checks for sends of deprecated messages that might be removed in upcoming releases of Pharo.
"
Class {
	#name : #OldSendsDeprecatedMethodToGlobalRule,
	#superclass : #RBBlockLintRule,
	#category : #Kernel-Rules,
	#timestamp : 'StephaneDucasse 11/29/2014 23:03'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
OldSendsDeprecatedMethodToGlobalRule class>>checksMethod [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
OldSendsDeprecatedMethodToGlobalRule class>>isVisible [

	self flag: 'The functionality was moved to SendsDeprecatedMethodToGlobalRule, but as this rule is used by Monkey, and Monkey is not using Renraku model yet, the rule is hidden'.
	^ false
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
OldSendsDeprecatedMethodToGlobalRule class>>new [
	
	^ SendsDeprecatedMethodToGlobalRule asRBRule
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
OldSendsDeprecatedMethodToGlobalRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'SendsDeprecatedMethodToGlobalRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
OldSendsDeprecatedMethodToGlobalRule>>name [
	^ 'Sends a deprecated message to a known global'
]
