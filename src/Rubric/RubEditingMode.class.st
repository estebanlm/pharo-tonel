"
I am an abstract class to choose the editing mode of the text area 
"
Class {
	#name : #RubEditingMode,
	#superclass : #Object,
	#instVars : [
		'textArea',
		'previousEditorClass',
		'acceptAllowed'
	],
	#category : #Rubric-Editing-Core,
	#timestamp : 'FranckWarlouzet 7/29/2015 12:55'
}

{
	#category : #keymap,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode class>>buildTabKeymapOn: aBuilder [
	<keymap>
	
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode class>>extendedSearchMenuOn: aBuilder [
	(aBuilder item: #'extendedSearch' translated)
		label: 'Code search...' translated;
		withSeparatorAfter;
		with: [ 
					(aBuilder item: #'browse it' translated)
						keyText: 'b';
						selector: #browseIt.
					(aBuilder item: #'senders of it' translated)
						keyText: 'n';
						selector: #sendersOfIt.
					(aBuilder item: #'implementors of it' translated)
						keyText: 'm';
						selector: #implementorsOfIt.
					(aBuilder item: #'references to it' translated)
						keyText: 'N';
						selector: #referencesToIt;
						withSeparatorAfter.
					(aBuilder item: #'selectors containing it' translated)
						keyText: 'W';
						selector: #methodNamesContainingIt.
					(aBuilder item: #'case insensitive method literal strings with it' translated)
						keyText: 'E';
						selector: #methodStringsContainingit.
					(aBuilder item: #'case sensitive method literal strings with it' translated)
						keyText: 'E';
						selector: #methodCaseSensitiveStringsContainingit.
					(aBuilder item: #'method source with it' translated)
						selector: #methodSourceContainingIt;
						withSeparatorAfter.
					(aBuilder item: #'class names containing it' translated) selector: #classNamesContainingIt.
					(aBuilder item: #'class comments with it' translated) selector: #classCommentsContainingIt ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode class>>menuKeyword [
	"Returns the name of the pragma to use to build the menu"
	^ self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>acceptAllowed [
	^ acceptAllowed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>acceptAllowed: anObject [
	acceptAllowed := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>editor [
	^self textArea editor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>editorClass [
	^ RubTextEditor 
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>initialize [
	super initialize.
	acceptAllowed := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>interactive [

	"when returning true, it avoids that we can assign to class, i.e., Array := 55."
	
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>isCodeCompletionAllowed [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>label [
	^ self class label
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>menu  [
		"Answer the menu to be presented "

	^ (PragmaMenuBuilder pragmaKeyword: self menuKeyword  model: self textArea ) menu
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>menuKeyword [
	^ self class menuKeyword
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>model [
	^ self textArea model
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>plugin: aTextArea  [
	textArea := aTextArea.
	previousEditorClass := self textArea editorClass.
	previousEditorClass = self editorClass
		ifFalse: [ 
			self textArea editorClass: self editorClass.
			self textArea releaseEditor].
	self updateTextAreaWhenPlugged
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>shiftMenu  [
		"Answer the menu to be presented with the shift key pressed"

	^ self menu
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>textArea [
	^ textArea
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>textArea: aTextArea [
	textArea := aTextArea
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>textStyle [
	^ self textArea textStyle
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>unplug [
	previousEditorClass = self textArea editor class
		ifFalse: [ 
			self textArea editorClass: previousEditorClass.
			self textArea releaseEditor ].
	self updateTextAreaWhenUnplugged.
	textArea := nil.

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>updateTextAreaWhenPlugged [
	self textArea
		restoreSelectionIndexesAfter: [ 
			| t |
			t := self textArea text copy.
			self textArea updateTextWith: ''.
			self textArea updateTextWith: t ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingMode>>updateTextAreaWhenUnplugged [

]
