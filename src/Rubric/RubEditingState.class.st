"
I represent datas of the current text area to manage undo operations etc
"
Class {
	#name : #RubEditingState,
	#superclass : #Object,
	#instVars : [
		'hasFocus',
		'undoManager',
		'emphasisHere',
		'pointBlock',
		'markBlock',
		'startOfTyping',
		'previousInterval',
		'scrollPivot',
		'textArea'
	],
	#category : #Rubric-Editing-Core,
	#timestamp : 'FranckWarlouzet 7/29/2015 13:00'
}

{
	#category : #undo-redo,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>clearUndoManager: aKeyboardEvent [
	self undoManager reset.
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>emphasisHere [
	^ emphasisHere
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>emphasisHere: aListOfTextAttribute [
	emphasisHere := aListOfTextAttribute ifNotNil: [ :l | l reject: [ :a | RubTextSelectionColor = a class ] ]
]

{
	#category : #private-debugging,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>exploreUndoManager: aKeyboardEvent [
	self undoManager explore.
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>hasFocus [
	^ hasFocus ifNil: [ hasFocus := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>hasFocus: aBoolean [
	hasFocus := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>markBlock [
	^ markBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>markBlock: aCharacterBlock [
	markBlock := aCharacterBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>markBlock: markCharacterBlock pointBlock: pointCharacterBlock [
	markBlock := markCharacterBlock.
	pointBlock := pointCharacterBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>markIndex [
	^ self markBlock ifNotNil: [:m | m stringIndex] ifNil: [ 1 ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>markIndex: markIndex pointIndex: pointIndex [
	markBlock := self paragraph characterBlockForIndex: markIndex.
	pointBlock := self paragraph characterBlockForIndex: pointIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>paragraph [
	^ textArea paragraph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>pointBlock [
	^ pointBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>pointBlock: aCharacterBlock [
	pointBlock := aCharacterBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>pointIndex [
	^ self pointBlock ifNotNil: [:p | p stringIndex ] ifNil: [ 0 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>previousInterval [

	^ previousInterval ifNil: [previousInterval := 1 to: 0]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>previousInterval: anInterval [

	previousInterval := anInterval.

]

{
	#category : #undo-redo,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>redo [
	^ self undoManager redo 
]

{
	#category : #undo-redo,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>redoArray: doArray undoArray: undoArray [
	self undoManager isPlugged 
		ifTrue: [self undoManager redoArray: doArray undoArray: undoArray]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>scrollPivot [
	^ scrollPivot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>scrollPivot: aPoint [
	scrollPivot := aPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>selectionStart [
	^ self pointBlock ifNotNil: [:pb | pb min: self markBlock]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>selectionStop [
	^ self pointBlock ifNotNil: [:pb | pb max: self markBlock]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>startOfTyping [
	^ startOfTyping
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>startOfTyping: anIntegerIndex [
	startOfTyping := anIntegerIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>textArea: aTextArea [
	textArea := aTextArea.

]

{
	#category : #undo-redo,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>undo [
	^ self undoManager undo 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>undoManager [

	^ undoManager ifNil: [ undoManager := HistoryIterator new].

]

{
	#category : #undo-redo,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>undoRedoTransaction: aBlock [
	self undoManager openRecordGroup.
	aBlock ensure: [  self undoManager closeRecordGroup ].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>unplug [
	super unplug.
	undoManager
		ifNotNil: [ 
			undoManager reset.
			undoManager := nil ].
	 pointBlock := markBlock := startOfTyping := previousInterval := nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingState>>unselect [
	self markBlock: self pointBlock copy
]
