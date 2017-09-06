"
This is the abstract class for a presentation that is supposed to show text. The #selectionText port and not the #selection port is populated by the renderer when the user selects a piece of text.

Instance Variables
	cursorPosition:		<Object>
	doItContext:		<Object>
	doItReceiver:		<Object>
	selectedText:		<Object>
	selectedTextBlock:		<Object>
	text:		<Object>
	textBlock:		<Object>

"
Class {
	#name : #GLMTextualPresentation,
	#superclass : #GLMFormatedPresentation,
	#instVars : [
		'selectedText',
		'cursorPosition',
		'text',
		'doItReceiver',
		'doItContext',
		'textBlock',
		'selectedTextBlock'
	],
	#category : #Glamour-Presentations,
	#timestamp : 'AndreiChis 10/3/2014 18:27'
}

{
	#category : #'accessing ports',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>cursorPosition  [
	 
	^cursorPosition
]

{
	#category : #'accessing ports',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>cursorPosition: anObject  [
	 
	cursorPosition := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>doItContext [
	"Return a context use for evaluating code in the presentation. Any variable contained in the executed code will be looked up in this context."
	^ doItContext glamourValue: self entity
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>doItContext: aOneArgBlock [
	"The block will be passed the current entity and is expected to return a context. Any code evaluated from the presentation will be executed as part of the retuned context."
	doItContext := aOneArgBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>doItReceiver [
	"Returns the object that should be used when evaluating 'self' within the presentation. 'nil' is the default value"
	^ doItReceiver glamourValue: self entity
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>doItReceiver: aOneArgBlock [
	"The block will be passed the current entity and is expected to return an object .This object will then be returned upon evaluation of 'self' within the presentation."
	doItReceiver := aOneArgBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>dynamicActionsOnSelection [
	"Unlike the other types of presentations, in a text presentation the dynamic actions should be computed even if the selection port is not explicitly populated. A text presentation uses the port #selectedText to transmit the text that was selected by the user, and not the #selection port"
	(selectionDynamicActionsBlock isNil or: [ 
		self selectedText isNil ])
		ifTrue: [ ^ OrderedCollection new ].
	^ selectionDynamicActionsBlock glamourValue: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>selectLine [
	"Select the current line if there is no current selection"
	self announce: GLMSelectCurrentLine.
]

{
	#category : #'accessing ports',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>selectedText [
	^ (self pane port: #selectedText) value isNil 
		ifTrue: [self selectedTextBlock value]
		ifFalse: [(self pane port: #selectedText) value]
]

{
	#category : #'accessing ports',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>selectedText: anObject [
	(self pane port: #selectedText) value: anObject copy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>selectedTextBlock [
	^ selectedTextBlock ifNil: [ [''] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>selectedTextBlock: anObject [
	selectedTextBlock := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>selectionInterval [
	^ (self pane port: #selectionInterval) value

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>selectionInterval: anInterval [
	(self pane port: #selectionInterval) value: anInterval
]

{
	#category : #'accessing ports',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>text [
	^ (self pane port: #text) value isNil 
		ifTrue: [self textBlock value]
		ifFalse: [(self pane port: #text) value]
]

{
	#category : #'accessing ports',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>text: aString [
	(self pane port: #text) value: aString copy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>textBlock [
	^ textBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextualPresentation>>textBlock: anObject  [
	textBlock := anObject
]
