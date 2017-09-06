"
Temporary and argument variable names should start with a lowercase letter.
"
Class {
	#name : #GRTemporaryVariableCapitalizationRule,
	#superclass : #ReNodeBasedRule,
	#category : #GeneralRules,
	#timestamp : 'YuriyTymchuk 9/7/2016 16:46'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRTemporaryVariableCapitalizationRule>>check: aNode forCritiquesDo: aCriticBlock [

	((self checkIsVariableWithParent: aNode) and: [ 
	
	((self checkIsArgumentDefinition: aNode) or: [ 
	  self checkIsTempDefinition: aNode ])
	
	and: [ aNode name first isUppercase ] ]) 

	ifTrue: [ aCriticBlock cull: (self critiqueFor: aNode) ]
]

{
	#category : #running-helpers,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRTemporaryVariableCapitalizationRule>>checkIsArgumentDefinition: aNode [

	^ aNode isArgument and: [ aNode parent isMethod ]
]

{
	#category : #running-helpers,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRTemporaryVariableCapitalizationRule>>checkIsTempDefinition: aNode [

	^ aNode isTemp and: [ aNode parent isSequence ]
]

{
	#category : #running-helpers,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRTemporaryVariableCapitalizationRule>>checkIsVariableWithParent: aNode [

	^ aNode isVariable and: [
	  aNode parent isNotNil ]
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRTemporaryVariableCapitalizationRule>>critiqueFor: aNode [
	| crit |

	crit := ReRefactoringCritique
		withAnchor: (self anchorFor: aNode)
		by: self.
		
	crit	
		tinyHint: aNode name;
		refactoring: (
			RBRenameTemporaryRefactoring
				renameTemporaryFrom: aNode sourceInterval
				to: aNode name uncapitalized
				in: aNode methodNode methodClass
				selector: aNode methodNode selector).
				
	^ crit	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRTemporaryVariableCapitalizationRule>>group [
	^ 'Style'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRTemporaryVariableCapitalizationRule>>name [
	^ 'Temporary variable (or paramenter) capitalized'
]
