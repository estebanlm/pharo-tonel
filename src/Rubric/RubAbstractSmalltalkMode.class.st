"
I am an abstract class to set a mode of editing for smalltalk
"
Class {
	#name : #RubAbstractSmalltalkMode,
	#superclass : #RubEditingMode,
	#category : #Rubric-Editing-Code,
	#timestamp : 'FranckWarlouzet 7/29/2015 12:56'
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractSmalltalkMode>>editorClass [
	^ RubSmalltalkEditor.

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractSmalltalkMode>>isCodeCompletionAllowed [
	^ true
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractSmalltalkMode>>updateTextAreaWhenPlugged [
	super updateTextAreaWhenPlugged


]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractSmalltalkMode>>updateTextAreaWhenUnplugged [
	super updateTextAreaWhenUnplugged


]
