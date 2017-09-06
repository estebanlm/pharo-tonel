"
GLMTextMorphForEditView is meant to work with GLMPluggableTextMorph.
"
Class {
	#name : #GLMTextMorphForEditView,
	#superclass : #TextMorphForEditView,
	#category : #Glamour-Morphic-Widgets,
	#timestamp : 'TudorGirba 7/14/2011 09:44'
}

{
	#category : #editing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextMorphForEditView>>acceptContents [
	self flag: 'Hack for disable the CTRL+S behaviour'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextMorphForEditView>>editorClass [
	"Answer the class used to create the receiver's editor"
	
	^GLMSmalltalkEditor
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextMorphForEditView>>keyStroke: anEvent [
	| isHandledByModel |
	isHandledByModel := self editView model keystroke: anEvent from: self editView.
	isHandledByModel ifFalse: [ super keyStroke: anEvent ]
]
