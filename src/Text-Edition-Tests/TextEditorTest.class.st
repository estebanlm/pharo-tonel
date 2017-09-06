"

"
Class {
	#name : #TextEditorTest,
	#superclass : #TestCase,
	#category : #Text-Edition-Tests,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:47'
}
TextEditorTest>>keyboardEvent  [
	| event |
	event := KeyboardEvent new.
	event 
		setType: #keystroke
		buttons: 0
		position:  0@0
		keyValue: 0
		charCode: 0
		hand: nil 
		stamp: Time now.
	^ event 	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:47'
}
TextEditorTest>>testCursorEnd [
	| editor |
	"
	self debug: #testCursorEnd.
	"
	editor := TextMorph new editor.
	editor cursorEnd: self keyboardEvent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:47'
}
TextEditorTest>>testSetSearchString [
	| editor |
	"
	self debug: #testSetSearchString.
	"
	editor := TextMorph new editor.
	editor setSearchString
]
