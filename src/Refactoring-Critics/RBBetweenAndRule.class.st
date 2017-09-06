"
Replaces ""a >= b and: [a <= c]"" by ""a between: b and: c.
"
Class {
	#name : #RBBetweenAndRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'StephaneDucasse 11/29/2014 17:38'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBBetweenAndRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'BetweenAndRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBBetweenAndRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBBetweenAndRule>>initialize [
	super initialize.
	self rewriteRule
		replace: '``@a >= ``@b and: [``@a <= ``@c]' with: '``@a between: ``@b and: ``@c';
		replace: '``@a >= ``@b & (``@a <= ``@c)' with: '``@a between: ``@b and: ``@c';
		replace: '``@b <= ``@a and: [``@a <= ``@c]' with: '``@a between: ``@b and: ``@c';
		replace: '``@b <= ``@a & (``@a <= ``@c)' with: '``@a between: ``@b and: ``@c';
		replace: '``@a <= ``@c and: [``@a >= ``@b]' with: '``@a between: ``@b and: ``@c';
		replace: '``@a <= ``@c & (``@a >= ``@b)' with: '``@a between: ``@b and: ``@c';
		replace: '``@c >= ``@a and: [``@a >= ``@b]' with: '``@a between: ``@b and: ``@c';
		replace: '``@c >= ``@a & (``@a >= ``@b)' with: '``@a between: ``@b and: ``@c';
		replace: '``@a >= ``@b and: [``@c >= ``@a]' with: '``@a between: ``@b and: ``@c';
		replace: '``@a >= ``@b & (``@c >= ``@a)' with: '``@a between: ``@b and: ``@c';
		replace: '``@b <= ``@a and: [``@c >= ``@a]' with: '``@a between: ``@b and: ``@c';
		replace: '``@b <= ``@a & (``@c >= ``@a)' with: '``@a between: ``@b and: ``@c';
		replace: '``@a <= ``@c and: [``@b <= ``@a]' with: '``@a between: ``@b and: ``@c';
		replace: '``@a <= ``@c & (``@b <= ``@a)' with: '``@a between: ``@b and: ``@c';
		replace: '``@c >= ``@a and: [``@b <= ``@a]' with: '``@a between: ``@b and: ``@c';
		replace: '``@c >= ``@a & (``@b <= ``@a)' with: '``@a between: ``@b and: ``@c'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBBetweenAndRule>>name [
	^ '"a >= b and: [a <= c]" -> "a between: b and: c"'
]
