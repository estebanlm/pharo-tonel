"
Class and pool variable names should start with an uppercase letter.
"
Class {
	#name : #GRClassVariableCapitalizationRule,
	#superclass : #ReAbstractRule,
	#category : #GeneralRules,
	#timestamp : 'YuriyTymchuk 9/7/2016 14:43'
}

{
	#category : #testing-interest,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRClassVariableCapitalizationRule class>>checksClass [
	^ true
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRClassVariableCapitalizationRule>>check: aClass forCritiquesDo: aCriticBlock [
	aClass isMeta ifTrue: [ ^ self ].
	aClass classVarNames, aClass sharedPoolNames
		select: [ :each | each first isLowercase ]
		thenDo: [ :each |
			aCriticBlock cull:
				(self critiqueFor: aClass about: each) ]
]

{
	#category : #running-helpers,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRClassVariableCapitalizationRule>>critiqueFor: aClass about: aVarName [
	| crit |

	crit := ReRefactoringCritique
		withAnchor: (ReVarSearchSourceAnchor
			entity: aClass
			string: aVarName)
		by: self.
	
	crit	
		tinyHint: aVarName;
		refactoring: (
			RBRenameClassVariableRefactoring
				rename: aVarName
				to: aVarName capitalized
				in: aClass).
				
	^ crit
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRClassVariableCapitalizationRule>>group [
	^ 'Style'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRClassVariableCapitalizationRule>>name [
	^ 'Class (or pool) variable not capitalized'
]
