"
I know how to use a Glamour  code model to  and extract the information needed for the suggestions
"
Class {
	#name : #SugsGlamourCodeContext,
	#superclass : #SugsAbstractContext,
	#category : #SmartSuggestions-Menu,
	#timestamp : 'AndreiChis 1/8/2016 18:54'
}

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsGlamourCodeContext>>selectTheTextForTheNode [
	selectionPreviousHighligth := self model primarySelectionInterval .
	selectedNode ifNotNil: [ self model primarySelectionInterval: (self nodeStart to: self nodeStop)]
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsGlamourCodeContext>>selectedClass [
	^ model selectedBehavior
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsGlamourCodeContext>>selectedInterval [
	^ self model glamourPresentation selectionInterval
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsGlamourCodeContext>>selectedMethod [
	^ model selectedMethod
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsGlamourCodeContext>>sourceTextArea  [
	^ model dependents ifEmpty: [ RubScrolledTextModel new interactionModel: model  ] ifNotEmpty: [ model dependents at: 1  ]
]
