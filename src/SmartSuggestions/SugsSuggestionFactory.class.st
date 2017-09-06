"
I'm the guy who knows how to create the suggestions. 
I also categorize them.
"
Class {
	#name : #SugsSuggestionFactory,
	#superclass : #Model,
	#classInstVars : [
		'collectorForInstancesVariable',
		'collectorForTemporaryVariable',
		'collectorForUndeclaredVariable',
		'collectorForSourceCode',
		'collectorForMethod',
		'collectorForMessage',
		'collectorForClass',
		'collectorForClassVariable',
		'collectorForLiteral',
		'collectorForAll',
		'collectorForAssignment',
		'collectorForBlock'
	],
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>cleanUp [
	<script>
	collectorForInstancesVariable := nil.
	collectorForTemporaryVariable := nil.
	collectorForUndeclaredVariable := nil.
	collectorForSourceCode := nil.
	collectorForMethod := nil.
	collectorForMessage := nil.
	collectorForClass := nil.
	collectorForClassVariable := nil.
	collectorForLiteral := nil.
	collectorForAll := nil.
	collectorForAssignment := nil.
	collectorForBlock := nil.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>collectCommandsFrom: aPragmaCollector [
	| commands |
	commands := SortedCollection
		sortBlock: [ :st :nd | st position <= nd position ].
	aPragmaCollector
		do: [ :prg | 
			commands
				add: (prg methodClass theNonMetaClass perform: prg methodSelector) ].
	^ commands
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>collectorForAssignment [
	^ collectorForAssignment ifNil: [collectorForAssignment := self createCollector: #assignmentCommand].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>collectorForBlock [
	^ collectorForBlock ifNil: [collectorForBlock:= self createCollector: #blockCommand].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>collectorForClass  [
	^ collectorForClass ifNil: [collectorForClass := self createCollector: #classCommand].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>collectorForClassVariable  [
	^ collectorForClassVariable ifNil: [collectorForClassVariable := self createCollector: #classVarCommand].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>collectorForInstancesVariable  [
	^ collectorForInstancesVariable ifNil: [collectorForInstancesVariable := self createCollector: #instVarCommand].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>collectorForLiteral [
	^ collectorForLiteral ifNil: [collectorForLiteral := self createCollector: #literalCommand].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>collectorForMessage [
	^ collectorForMessage ifNil: [collectorForMessage := self createCollector: #messageCommand].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>collectorForMethod  [
	^ collectorForMethod ifNil: [collectorForMethod := self createCollector: #methodCommand].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>collectorForSourceCode  [
	^ collectorForSourceCode ifNil: [collectorForSourceCode := self createCollector: #sourceCodeCommand].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>collectorForTemporaryVariable  [
	^ collectorForTemporaryVariable  ifNil: [collectorForTemporaryVariable := self createCollector: #tempVarCommand].
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>collectorForUndeclaredVariable  [
	^ collectorForUndeclaredVariable ifNil: [collectorForUndeclaredVariable := self createCollector: #undeclaredVarCommand].

]

{
	#category : #literal,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>commandsFoLiteralNode [
	^self collectCommandsFrom: self collectorForLiteral .
]

{
	#category : #assignment,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>commandsForAssignment [
	^self collectCommandsFrom: self collectorForAssignment.
]

{
	#category : #block,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>commandsForBlock [
	^self collectCommandsFrom: self collectorForBlock.
]

{
	#category : #class,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>commandsForClass [
	^self collectCommandsFrom: self collectorForClass.
]

{
	#category : #class-var,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>commandsForClassVariable [
	^self collectCommandsFrom: self collectorForClassVariable.
]

{
	#category : #inst-var,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>commandsForInstanceVariable [
	^self collectCommandsFrom: self collectorForInstancesVariable .
	

]

{
	#category : #messages,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>commandsForMessage [
	^self collectCommandsFrom: self collectorForMessage.

]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>commandsForMethod [
	^self collectCommandsFrom: self collectorForMethod.
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>commandsForSource [

	^self collectCommandsFrom: self collectorForSourceCode .

]

{
	#category : #temp-var,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>commandsForTemporaryVariable [
	^self collectCommandsFrom: self collectorForTemporaryVariable .
]

{
	#category : #unknown-var,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>commandsForUndeclaredVariable [
	^self collectCommandsFrom: self collectorForUndeclaredVariable  .
]

{
	#category : #inst-var,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createAccesorsFor [
	<instVarCommand>
	^ SugsCreateInstanceVarAccessors
		icon: (self iconNamed: #smallLanguageIcon)
		position: 100
]

{
	#category : #inst-var,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createAccessesToVariable [
	<instVarCommand>
	^ SugsAccessesToInstVar
		icon: (self iconNamed: #smallInspectItIcon)
		position: 50
]

{
	#category : #class-var,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createAccessors [
	<classVarCommand>
	^ SugsCreateClassVarAccessors
		icon: (self iconNamed: #smallLanguageIcon)
		position: 30
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createAddParameter [
	<methodCommand>
	^ SugsAddParameter
		icon: (self iconNamed: #smallPushpinIcon)
		position: 200
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createBreakCommand [
	<globalCommand>
	^ SugsBreakAlwaysSuggestion
		icon: (self iconNamed: #smallCancelIcon)
		position: 15
		keyText: 'b,a'
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createBreakConditionCommand [
	<globalCommand>
	^ SugsBreakConditionSuggestion
		icon: (self iconNamed: #smallCancelIcon)
		position: 17
		keyText: 'b,c'
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createBreakOnceCommand [
	<globalCommand>
	^ SugsBreakOnceSuggestion
		icon: (self iconNamed: #smallCancelIcon)
		position: 16
		keyText: 'b,o'
]

{
	#category : #class,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createBrowseReferences [
	<classCommand>
	^ SugsBrowseClassReferences
		icon: (self iconNamed: #smallInspectItIcon)
		position: 10
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createCollector: key  [
	| collector |
	collector :=  PragmaCollector filter: [:pragma | pragma keyword=key].
	collector reset.
	collector whenChangedSend: #reset to: collector.
	^collector.

]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createCounterCommand [
	<methodCommand>
	<messageCommand>
	<assignmentCommand>
	<tempVarCommand>
	<instVarCommand>
	<classVarCommand>
	^ SugsCounterSuggestion
		icon: (self iconNamed: #classIcon)
		position: 18
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createDeprecateMethod [
	<methodCommand>
	^ SugsDeprecateMethod
		icon: (self iconNamed: #smallLanguageIcon)
		position: 125
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createExtractMethod [
	<messageCommand>
	<literalCommand>
	<blockCommand>
	^ SugsExtractMethod
		icon: (self iconNamed: #smallUpdateIcon)
		position: 50
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createExtractSentences [
	<sourceCodeCommand>
	^ SugsExtractStatements
		icon: (self iconNamed: #smallUpdateIcon)
		position: 10
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createExtractToLocalVariable [
	<sourceCodeCommand>
	<messageCommand>
	<literalCommand>
	<blockCommand>
	^ SugsExtractToLocalVariable
		icon: (self iconNamed: #smallJumpIcon)
		position: 20
]

{
	#category : #messages,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createFindImplementors [
	<messageCommand>
	^ SugsFindImplementors
		icon: (self iconNamed: #smallFindIcon)
		position: 11
		keyText: 'm'
]

{
	#category : #messages,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createFindSenders [
	<methodCommand>
	<messageCommand>
	^ SugsFindSenders
		icon: (self iconNamed: #smallFindIcon)
		position: 10
		keyText: 'n'
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createFormatSourceCode [
	<methodCommand>
	<sourceCodeCommand>
	^ SugsFormatCode
		icon: (self iconNamed: #smallJustifiedIcon)
		position: 0
		keyText: 'u'
]

{
	#category : #messages,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createInline [
	<messageCommand>
	^ SugsInline
		icon: (self iconNamed: #smallRightFlushIcon)
		position: 100
]

{
	#category : #assignment,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createInlineTemporary [
	<assignmentCommand>
	^ SugsInlineTemporary
		icon: (self iconNamed: #smallLanguageIcon)
		position: 10
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createMoveMethod [
	<methodCommand>
	^ SugsDelegateMethod
		icon: (self iconNamed: #smallRedoIcon)
		position: 210
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createPullUp [
	<methodCommand>
	^ SugsPullUpMethod
		icon: (self iconNamed: #smallRedoIcon)
		position: 100
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createPushDown [
	<methodCommand>
	^ SugsPushDownMethod
		icon: (self iconNamed: #smallUndoIcon)
		position: 101
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createRemoveMethod [
	<methodCommand>
	^ SugsRemoveMethod
		icon: (self iconNamed: #smallCancelIcon)
		position: 20
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createRemoveParameter [
	<methodCommand>
	^ SugsRemoveParameter
		icon: (self iconNamed: #smallCancelIcon)
		position: 210
]

{
	#category : #class,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createRenameClass [
	<classCommand>
	^ SugsRenameClass
		icon: (self iconNamed: #smallLanguageIcon)
		position: 20
		keyText: 'r'
]

{
	#category : #class-var,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createRenameClassVariable [
	<classVarCommand>
	^ SugsRenameClassVar
		icon: (self iconNamed: #smallLanguageIcon)
		position: 10
		keyText: 'r'
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createRenameMethod [
	<methodCommand>
	^ SugsRenameMethod
		icon: (self iconNamed: #smallLanguageIcon)
		position: 10
		keyText: 'r,m'
]

{
	#category : #temp-var,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createRenameTemporaryVariable [
	<tempVarCommand>
	^ SugsRenameTemporaryVar
		icon: (self iconNamed: #smallLanguageIcon)
		position: 10
		keyText: 'r'
]

{
	#category : #inst-var,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createRenameVariable [
	<instVarCommand>
	^ SugsRenameInstanceVar
		icon: (self iconNamed: #smallLanguageIcon)
		position: 10
		keyText: 'r'
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createSwapMethod [
	<methodCommand>
	^ SugsSwapMethod new
		icon: (self iconNamed: #smallRedoIcon);
		position: 50
]

{
	#category : #class-var,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createUseAccessorToVar [
	<classVarCommand>
	^ SugsUseAccessorsForClassVar
		icon: (self iconNamed: #smallLanguageIcon)
		position: 10
]

{
	#category : #unknown-var,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createVariableCorrection [
	"	<undeclaredVarCommand>"

	"Unable because it's not fully implemented"

	| variables index |
	^ SugsSuggestion
		for: [ :context | 
			variables := context selectedClass allInstVarNames asArray sort.
			index := UIManager default chooseFrom: variables.
			UIManager default inform: (variables at: index) ]
		named: 'Correct variable to...' translated
		icon: (self iconNamed: #smallFindIcon)
]

{
	#category : #inst-var,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createVariableStoresInto [
	<instVarCommand>
	^ SugsStoresIntoInstVar
		icon: (self iconNamed: #smallInspectItIcon)
		position: 60
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>createWatchpointCommand [
	<methodCommand>
	<messageCommand>
	<assignmentCommand>
	<tempVarCommand>
	<instVarCommand>
	<classVarCommand>
	^ SugsWatchpointSuggestion
		icon: (self iconNamed: #haloView)
		position: 18
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>globalCollector [
	^ collectorForAll ifNil: [collectorForAll  := self createCollector: #globalCommand].

]

{
	#category : #global,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestionFactory class>>globalCommands [
	^self collectCommandsFrom: self globalCollector.
]
