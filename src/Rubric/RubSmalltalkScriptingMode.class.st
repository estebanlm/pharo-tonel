"
I represent the mode to use for editing smalltalk script (class creation script for example)
"
Class {
	#name : #RubSmalltalkScriptingMode,
	#superclass : #RubSmalltalkCodeMode,
	#category : #Rubric-Editing-Code,
	#timestamp : 'FranckWarlouzet 7/29/2015 12:57'
}

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkScriptingMode class>>editingModeMenuOn: aBuilder [
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
RubSmalltalkScriptingMode class>>label [
	^ 'Smalltalk script'
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkScriptingMode>>updateTextAreaWhenPlugged [
	super updateTextAreaWhenPlugged.
	self textArea shoutStyler beForSmalltalkScripting
]
