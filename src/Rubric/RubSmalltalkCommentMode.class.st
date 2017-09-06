"
I represent the mode to use for editing class comments
"
Class {
	#name : #RubSmalltalkCommentMode,
	#superclass : #RubAbstractSmalltalkMode,
	#category : #Rubric-Editing-Code,
	#timestamp : 'FranckWarlouzet 7/29/2015 12:58'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCommentMode class>>label [
	^ 'Smalltalk comment'
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCommentMode class>>menuKeyword [
	^ 'RubSmalltalkCommentMenu'
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCommentMode class>>menuOn: aBuilder [
	"Specify the menu used when writing code. Try it with:
	(PragmaMenuBuilder 
		pragmaKeyword: 'RubSmalltalkCommentMenu'
		model: RubEditingArea new) menu popUpInWorld
	"

	<contextMenu>
	<RubSmalltalkCommentMenu>
	RubSmalltalkCodeMode menuOn: aBuilder 
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCommentMode>>editorClass [
	^ RubSmalltalkEditor.

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCommentMode>>formatMethodCode [
	"do nothing for code comments"
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCommentMode>>isCodeCompletionAllowed [
	^ false
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCommentMode>>updateTextAreaWhenPlugged [
	super updateTextAreaWhenPlugged

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSmalltalkCommentMode>>updateTextAreaWhenUnplugged [
	super updateTextAreaWhenUnplugged

]
