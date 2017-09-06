"
Notify about an undeclared variable
"
Class {
	#name : #UndeclaredVariable,
	#superclass : #ParserNotification,
	#instVars : [
		'parser',
		'interval'
	],
	#category : #Compiler-Exceptions,
	#timestamp : 'TorstenBergmann 1/31/2014 11:18'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:32'
}
UndeclaredVariable class>>signalFor: aParser name: aString inRange: anInterval  [
	^ (self new setParser: aParser name: aString range: anInterval) signal
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:32'
}
UndeclaredVariable>>openMenuIn: aBlock  [
	| alternatives labels actions lines caption choice |
	alternatives := parser possibleVariablesFor: name.
	labels := OrderedCollection new.
	actions := OrderedCollection new.
	lines := OrderedCollection new.
	name first isLowercase 
		ifTrue: 
			[labels add: 'Declare new temporary variable'.
			actions add: [parser declareTempAndPaste: name].
			labels add: 'Declare new instance variable'.
			actions add: [parser declareInstVar: name]]
		ifFalse: 
			[labels add: 'Define new class'.
			actions add: [parser defineClass: name].
			labels add: 'Declare new global'.
			actions add: [parser declareGlobal: name].
			parser canDeclareClassVariable 
				ifTrue: 
					[labels add: 'Declare new class variable'.
					actions add: [parser declareClassVar: name]]].
	lines add: labels size.
	alternatives do: 
		[:each | 
		labels add: each.
		actions add: [parser substituteVariable: each atInterval: interval]].
	lines add: labels size.
	labels add: 'Cancel'.
	caption := 'Unknown variable: ' , name , ' please correct, or cancel:'.
	choice := aBlock value: labels value: lines value: caption.
	choice ifNotNil: [self resume: (actions at: choice ifAbsent: [nil])]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:32'
}
UndeclaredVariable>>setParser: aParser name: aString range: anInterval  [
	parser := aParser.
	name := aString.
	interval := anInterval
]
