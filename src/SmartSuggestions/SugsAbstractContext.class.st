"
I'm the API used by smart suggestions with facilities to know the selected text, and having all the needed information for execute the commands.
"
Class {
	#name : #SugsAbstractContext,
	#superclass : #Object,
	#instVars : [
		'selectedNode',
		'model',
		'selectionPreviousHighligth'
	],
	#category : #SmartSuggestions-Menu,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext class>>contextFor: anEditor [
	(anEditor respondsTo: #sugsContext)
		ifTrue: [ ^ anEditor sugsContext ].
	(anEditor model respondsTo: #interactionModel)
		ifTrue: [ 
			(anEditor model interactionModel respondsTo: #sugsContext)
				ifTrue: [ ^ anEditor model interactionModel sugsContext ] ].
	
	^ SugsNullContext new
]

{
	#category : #build,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext class>>model: theModel [
	^ self new 
		model: theModel;
		yourself.
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>bindedSelectedClass [
	^selectedNode binding value.
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>browsedEnvironment [
	^RBBrowserEnvironment new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>code [
	^self sourceTextArea text
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>formatSourceCode [
	| formatted |

	formatted := selectedNode formattedCode.
	formatted = self code ifTrue: [ ^ self ].
	self sourceTextArea
		formatSourceCode;
		hasUnacceptedEdits: true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>hasClassUnImplementedAccessors [
	| hasGetter hasSetter name |

	name := self selectedVariableName asString copy.
	name at: 1 put: name first asLowercase .
	
	hasGetter := RBCondition canUnderstand: name asSymbol in: self selectedClass class.
	hasSetter := RBCondition canUnderstand: (name,':' ) asSymbol in: self selectedClass class.
	^ (hasGetter not | hasSetter not) check
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>hasInstanceVariable [
	
	^(RBCondition hasInstanceVariable: self selectedClass) check.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>hasMoreSentences [
	^ selectedNode parent isNotNil and: [ selectedNode parent isMethod not ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>hasOneStatement [
	^ (self selectedMessageName isNotNil or: [ selectedNode isLiteralNode ] ) or: [ selectedNode statements size = 1]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>hasParameters [
	
	^self selectedMessageName isNil or:[ self selectedMessageName numArgs > 0].

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>hasSubclasses [
	
	^(RBCondition hasSubclasses: self selectedClass) check.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>hasUnImplementedAccessors [
	| hasGetter hasSetter |
	
	hasGetter := RBCondition canUnderstand: self selectedVariableName asSymbol in: self selectedClass.
	hasSetter := RBCondition canUnderstand: (self selectedVariableName,':' ) asSymbol in: self selectedClass.
	^ (hasGetter not | hasSetter not) check
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>hasUnacceptedEdits [
	^self sourceTextArea hasUnacceptedEdits
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>isMethodSelected [
	^selectedNode isMethod 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>model [
	^ model
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>model: aModel  [
	model := aModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>nodeStart [
	^selectedNode start.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>nodeStop [
	^selectedNode stop.
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>selectTheTextForTheNode [
	selectionPreviousHighligth := self selectedInterval .
	selectedNode ifNotNil: [ self sourceTextArea selectFrom: self nodeStart to: self nodeStop]
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>selectedClass [
	self subclassResponsibility 
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>selectedInterval [

	^ 1 to: 0
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>selectedMessageName [
	^[selectedNode selector] on: MessageNotUnderstood do: [ nil ]
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>selectedMethod [
	self subclassResponsibility 
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>selectedNode [
	^selectedNode 
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>selectedNode: theSelectedNode [
	selectedNode := theSelectedNode .
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>selectedNodeLabel [
	| label |
	selectedNode ifNil: [ ^ '' ].
	label := selectedNode sugsMenuLabel.
	^ label copyFrom: 1 to: (35 min: label size)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>selectedStatements [
	selectedNode isMessage ifTrue: [ ^{selectedNode} ].
	^(selectedNode statements select: [ :stat | stat containedBy: selectionPreviousHighligth ]).
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>selectedStatementsAsSequence [
	| statements temporaries  |
	
	temporaries :=  self selectedTemporaryVariables.
	statements:= self selectedStatements.
	^RBSequenceNode temporaries: temporaries statements: statements
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>selectedTemporaryVariables [
	selectedNode isSequence ifFalse: [ ^#() ].
	selectedNode temporaries ifEmpty: [^OrderedCollection new].
	^ ((selectedNode temporaries at: 1) containedBy: selectionPreviousHighligth )
		ifTrue: [ selectedNode temporaries ]
		ifFalse: [#()].
	
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>selectedVariableName [
	^selectedNode name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>sourceTextArea [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAbstractContext>>window [
	^ self sourceTextArea ownerThatIsA: SystemWindow
]
