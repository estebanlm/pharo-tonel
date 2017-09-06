"

"
Class {
	#name : #SimulateKeystrokesSpecification,
	#superclass : #UITestCase,
	#category : #SUnit-UITesting,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:20'
}
SimulateKeystrokesSpecification>>testSimulateCmdKeystroke [

	| ws |
	ws := Smalltalk tools workspace open.
	self simulateKeyStrokes: 'var := 3.'.
	self simulateKeyStroke: $s meta.
	self assert: ws hasUnacceptedEdits = false.
	ws delete.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:20'
}
SimulateKeystrokesSpecification>>testSimulateKeystroke [

	| textMorph |
	textMorph := TextMorph new contents: ''; openInWorld.
	self assert: textMorph canChangeText.
	textMorph takeKeyboardFocus.
	self simulateKeyStroke: $s.
	self assert: textMorph contents asString equals: 's'.
	textMorph delete.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:20'
}
SimulateKeystrokesSpecification>>testSimulateKeystrokes [

	| textMorph |
	textMorph := TextMorph new contents: ''; openInWorld.
	self assert: textMorph canChangeText.
	textMorph takeKeyboardFocus.
	self simulateKeyStrokes: 'hello'.
	self assert: textMorph contents asString equals: 'hello'.
	textMorph delete.
]
