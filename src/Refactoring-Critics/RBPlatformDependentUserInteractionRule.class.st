"
Check the methods that  use platform dependent user interactions.

This rule should be updated.
"
Class {
	#name : #RBPlatformDependentUserInteractionRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 23:08'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBPlatformDependentUserInteractionRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'PlatformDependentUserInteractionRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBPlatformDependentUserInteractionRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBPlatformDependentUserInteractionRule>>initialize [
	super initialize.
	self matcher 
		matchesAnyOf: #(
			'PopUpMenu confirm: `@object1 orCancel: `@object2'
			'PopUpMenu confirm: `@object1 trueChoice: `@object2 falseChoice: `@object3'
			'PopUpMenu confirm: `@object1'
			'PopUpMenu inform: `@object1'
			'PopUpMenu initialize'
			'PopUpMenu labelArray: `@object1 lines: `@object2'
			'PopUpMenu labelArray: `@object1'
			'PopUpMenu labels: `@object1 lines: `@object2'
			'PopUpMenu labels: `@object1'
			'PopUpMenu withCaption: `@object1 chooseFrom: `@object2'
			 )
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBPlatformDependentUserInteractionRule>>name [
	^ 'Platform dependent user interaction'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBPlatformDependentUserInteractionRule>>rationale [
	^ 'Check the methods that  use platform dependent user interactions.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBPlatformDependentUserInteractionRule>>severity [
	^ #error
]
