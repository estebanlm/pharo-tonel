"
Do not explicitly refer to UITheme current but use Smalltalk ui theme. Similarly do not directly refer to ThemeIcons current but use Smalltalk ui icons.

"
Class {
	#name : #RBThemeAPIUpdateRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'StephaneDucasse 11/29/2014 18:46'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBThemeAPIUpdateRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'ThemeAPIUpdateRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBThemeAPIUpdateRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBThemeAPIUpdateRule>>initialize [
	super initialize.
	self rewriteRule
		replace: 'UITheme current'
			with: 'Smalltalk ui theme';
		replace: 'ThemeIcons current'
			with: 'Smalltalk ui icons'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBThemeAPIUpdateRule>>name [
	^ 'Use "Smalltalk ui theme" and "Smalltalk ui icons"'
]
