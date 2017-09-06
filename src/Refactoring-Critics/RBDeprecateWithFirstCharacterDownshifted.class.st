"
Use uncapitalized instead of withFirstCharacterDownshifted since withFirstCharacterDownshifted is ugly and is deprecated now.
"
Class {
	#name : #RBDeprecateWithFirstCharacterDownshifted,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'StephaneDucasse 11/29/2014 18:01'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDeprecateWithFirstCharacterDownshifted class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'FirstCharacterDownShifted'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDeprecateWithFirstCharacterDownshifted>>group [
	^ 'Style'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDeprecateWithFirstCharacterDownshifted>>initialize [
	super initialize.
	self rewriteRule
		replace: '``@object withFirstCharacterDownshifted' with: '``@object uncapitalized'.


]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDeprecateWithFirstCharacterDownshifted>>name [
	^ 'use uncapitalized instead of withFirstCharacterDownshifted'
]
