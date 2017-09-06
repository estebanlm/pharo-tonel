"
I am a context that know how to work with the SmalltalkEditor.
"
Class {
	#name : #SugsSmalltalkEditorContext,
	#superclass : #SugsAbstractContext,
	#category : #SmartSuggestions-Menu,
	#timestamp : 'MarcusDenker 7/24/2015 12:01'
}

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSmalltalkEditorContext>>selectedClass [
	^model model model owner selectedBehavior
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSmalltalkEditorContext>>selectedMethod [
	^model model model owner selectedMessage.
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSmalltalkEditorContext>>sourceTextArea [
	^ model model widget.
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSmalltalkEditorContext>>tools [
	^ model systemNavigation
]
