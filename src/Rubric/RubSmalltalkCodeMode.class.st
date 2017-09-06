"
I represent the mode to use for editing smalltalk code
"
Class {
	#name : #RubSmalltalkCodeMode,
	#superclass : #RubAbstractSmalltalkMode,
	#instVars : [
		'classOrMetaclass'
	],
	#category : #Rubric-Editing-Code,
	#timestamp : 'FranckWarlouzet 7/29/2015 12:56'
}

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode class>>editingModeMenuOn: aBuilder [
	"Specify the menu used to select an editing mode"

	<contextMenu>
	<RubEditingModeMenu>
	(aBuilder item: self label translated)
		action: [:model | model textArea editingMode: self new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode class>>label [
	^ 'Smalltalk code'
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode class>>menuKeyword [
	^ 'RubSmalltalkCodeMenu'
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode class>>menuOn: aBuilder [
	"Specify the menu used when writing code."

	<contextMenu>
	<RubSmalltalkCodeMenu>
	(aBuilder item: #'Do it' translated)
		order: 1;
		keyText: 'd';
		selector: #doIt;
		help: nil;
		iconName: #smallDoItIcon.
	(aBuilder item: #'Print it' translated)
		keyText: 'p';
		selector: #printIt;
		help: nil;
		iconName: #smallPrintItIcon.
	(aBuilder item: #'Inspect it' translated)
		keyText: 'i';
		selector: #inspectIt;
		help: nil;
		iconName: #smallInspectItIcon.
	(aBuilder item: #'Basic Inspect it' translated)
		keyText: 'I';
		selector: #basicInspectIt;
		help: nil;
		iconName: #smallInspectItIcon.
	(aBuilder item: #'Debug it' translated)
		keyText: 'D';
		selector: #debugIt;
		help: nil;
		iconName: #smallDebugIcon.
	(aBuilder item: #'Profile it' translated)
		selector: #tallyIt;
		iconName: #smallDebugIcon;
		withSeparatorAfter.
	(aBuilder item: #'Find...' translated)
		keyText: 'f';
		selector: #find;
		help: nil;
		iconName: #smallFindIcon.
	(aBuilder item: #'Find again' translated)
		keyText: 'g';
		selector: #findAgain;
		help: nil;
		iconName: #smallFindIcon.
	self extendedSearchMenuOn: aBuilder.
	(aBuilder item: #'Redo' translated)
		keyText: 'Z';
		selector: #redo;
		help: nil;
		iconName: #smallRedoIcon.
	(aBuilder item: #Undo translated)
		keyText: 'z';
		selector: #undo;
		help: nil;
		iconName: #smallUndoIcon;
		withSeparatorAfter.
	(aBuilder item: #Copy translated)
		keyText: 'c';
		selector: #copySelection;
		help: nil;
		iconName: #smallCopyIcon.
	(aBuilder item: #Cut translated)
		keyText: 'x';
		selector: #cut;
		help: nil;
		iconName: #smallCutIcon.
	(aBuilder item: #Paste translated)
		keyText: 'v';
		selector: #paste;
		help: nil;
		iconName: #smallPasteIcon.
	(aBuilder item: #'Paste...' translated)
		selector: #pasteRecent;
		help: nil;
		iconName: #smallCopyIcon;
		withSeparatorAfter.
	aBuilder model
		ifNotNil: [ :mod | 
			mod model
				ifNotNil: [ (aBuilder item: #Accept translated)
						keyText: 's';
						selector: #accept;
						iconName: #smallOkIcon.
					(aBuilder item: #Cancel translated)
						keyText: 'l';
						selector: #cancel;
						iconName: #smallCancelIcon ] ]
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode>>bindingOf: varName [
	^ self model bindingOf: varName
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode>>classOrMetaClass: aBehavior [
	"set the classOrMetaClass in the receiver's styler to aBehavior"
	classOrMetaclass := aBehavior.
	self updateStyler
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode>>formatMethodCode [
	| source tree formatted |
	source := self textArea text asString.
	tree := RBParser parseMethod: source onError: [ :msg :pos | ^ self ].
	formatted := tree formattedCodeWithMaxLineLength: self maxFormatterLineLength.
	formatted = source
		ifTrue: [ ^ self ].
	self textArea updateTextWith: formatted
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode>>hasBindingOf: aString [
	" For the shout styler "
	^ self model notNil and: [ self model hasBindingOf: aString ]
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode>>hasBindingThatBeginsWith: aString  [
	" For the shout styler "
	^ self model notNil and: [ self model hasBindingThatBeginsWith: aString ]
]

{
	#category : #formatting,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode>>maxFormatterLineLength [
	^ self textArea wrapped
		ifTrue: [ (self textArea innerBounds width / 9) integerPart ]
		ifFalse: [ 70 ]
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode>>shoutAboutToStyle: myShoutStyler [
	^ self model isNil
		or: [ 
			(self model interactionModel respondsTo: #shoutAboutToStyle:) not
				or: [ self model interactionModel shoutAboutToStyle: self ] ] 
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode>>shoutStyler [
	^ self textArea decoratorNamed: #shoutStyler
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode>>updateStyler [

	self textArea ifNil: [ ^ self ].
	self textArea shoutStyler ifNotNil: [ :s | s classOrMetaClass: classOrMetaclass ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode>>updateTextAreaWhenPlugged [
	self withShoutStyler.
	super updateTextAreaWhenPlugged


]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode>>updateTextAreaWhenUnplugged [
	self textArea withoutShoutStyler.
	super updateTextAreaWhenUnplugged


]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode>>withShoutStyler [
	self textArea withDecoratorNamed: #shoutStyler.
	self updateStyler.
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCodeMode>>withoutShoutStyler [
	self textArea withoutDecoratorNamed: #shoutStyler
]
