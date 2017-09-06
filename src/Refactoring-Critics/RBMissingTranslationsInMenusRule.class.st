"
This rule should be updated to verify the inverse no translated messsages should be sent to menu element.
"
Class {
	#name : #RBMissingTranslationsInMenusRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 23:10'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMissingTranslationsInMenusRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'MissingTranslationsInMenusRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMissingTranslationsInMenusRule>>group [
	^ 'Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMissingTranslationsInMenusRule>>initialize [
	super initialize.
	self matcher
		matchesAnyOf: #(
			'`@menu add: `#label action: `#sym'
			'`@menu add: `#label selector: `#sym arguments: `@stuff'
			'`@menu add: `#label subMenu: `@stuff target: `@targ selector: `#sel argumentList: `@args'
			'`@menu add: `#label subMenu: `@stuff'
			'`@menu add: `#label target: `@targ action: `#sel'
			'`@menu add: `#label target: `@targ selector `#sel argument: `@arg'
			'`@menu add: `#label target: `@targ selector `#sel arguments: `@arg'
			'`@menu add: `#label target: `@targ selector `#sel'
			'`@menu addList: `{ :n | n isLiteral and: [ n value isArray and: [ n value anySatisfy: [ :row | (row isKindOf: Array) and: [ row first isLiteral ] ] ] ] }'
			'`@menu addTitle: `#label updatingSelector: `#sel updateTarget: `@targ'
			'`@menu addTitle: `#label'
			'`@menu addWithLabel: `#label enablement: `#esel action: `#sel'
			'`@menu addWithLabel: `#label enablementSelector: `#esel target: `@targ selector: `#sel argumentList: `@args'
			'`@menu balloonTextForLastItem: `#label'
			'`@menu labels: `#lit lines: `@lines selections: `@sels'
			'`@menu title: `#title' )
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMissingTranslationsInMenusRule>>name [
	^ 'Menus missing translations'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMissingTranslationsInMenusRule>>rationale [
	^ 'Literal strings shown to users in menus should be translated.'
]
