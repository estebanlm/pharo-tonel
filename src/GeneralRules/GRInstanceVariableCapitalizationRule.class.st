"
Instance variable names on the instance- and class-side should start with a lowercase letter.
"
Class {
	#name : #GRInstanceVariableCapitalizationRule,
	#superclass : #ReAbstractRule,
	#category : #GeneralRules,
	#timestamp : 'YuriyTymchuk 9/7/2016 11:31'
}

{
	#category : #testing-interest,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRInstanceVariableCapitalizationRule class>>checksClass [
	^ true
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRInstanceVariableCapitalizationRule>>check: aClass forCritiquesDo: aCriticBlock [
	
	aClass instVarNames
		select: [ :each | each first isUppercase ]
		thenDo: [ :each |
			aCriticBlock cull: (
				self critiqueFor: aClass about: each) ]
]

{
	#category : #running-helpers,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRInstanceVariableCapitalizationRule>>critiqueFor: aClass about: aVarName [
	| crit |

	crit := ReRefactoringCritique
		withAnchor: (ReVarSearchSourceAnchor
			entity: aClass
			string: aVarName)
		by: self.
	
	crit	
		tinyHint: aVarName;
		refactoring: (
			RBRenameInstanceVariableRefactoring
				rename: aVarName
				to: aVarName uncapitalized
				in: aClass).
				
	^ crit
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRInstanceVariableCapitalizationRule>>group [
	^ 'Style'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRInstanceVariableCapitalizationRule>>name [
	^ 'Instance variable capitalized'
]
