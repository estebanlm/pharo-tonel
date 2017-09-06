"
The implementation who asumes that my model it's a nautilus object.
"
Class {
	#name : #SugsNautilusContext,
	#superclass : #SugsAbstractContext,
	#category : #SmartSuggestions-Menu,
	#timestamp : '<historical>'
}

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNautilusContext>>browsedEnvironment [
	^ model browsedEnvironment
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNautilusContext>>code [

	^ self sourceTextArea getString
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNautilusContext>>contentSelection [
	^ model contentSelection
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNautilusContext>>flashSourceCodeArea [
	^ model flashSourceCodeArea
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNautilusContext>>formatSourceCode [
	| formatted |
	formatted := selectedNode formattedCode.
	formatted = self code
		ifTrue: [ ^ self ].
	self sourceTextArea
		formatSourceCodeInView;
		hasUnacceptedEdits: true
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNautilusContext>>selectTheTextForTheNode [
	selectionPreviousHighligth := self selectedInterval.
	selectedNode ifNotNil: [ self contentSelection ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNautilusContext>>selectedClass [
	^ model selectedClass
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNautilusContext>>selectedInterval [

	^ model selectionInterval
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNautilusContext>>selectedMethod [
	^ model selectedMethod
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNautilusContext>>selectionInterval [
	^ model selectionInterval
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNautilusContext>>sourceTextArea [
	^ model sourceTextModel
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNautilusContext>>window [
	^ model window 
]
