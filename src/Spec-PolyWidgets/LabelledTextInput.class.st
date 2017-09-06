"
I am a LabelledContainer specialized to manage a TextInputFieldModel.
See LabelledContainer

self example

I provide the accessor input to be more intuitive than subwidget.

I provide shortcuts for the most common methods of the TextInputFieldModel api to avoid the use of the DoesNotUnderstand or the writing of long chain of accessors.
"
Class {
	#name : #LabelledTextInput,
	#superclass : #LabelledContainer,
	#category : #Spec-PolyWidgets-Labelled,
	#timestamp : 'Spirita 7/25/2016 11:13'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput class>>defaultSpec [
	<spec: #default>
	^ super labelLeft
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput class>>example [
	| example |
	example := self abstractExample.
	example input ghostText: 'Tilt'.
example
		extent: 400 @ 50;
		openWithSpec.
	^ example
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>acceptBlock: aBlockWithOneArgument [
	^ self input acceptBlock: aBlockWithOneArgument
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>acceptOnCR: aBoolean [
	^ self input acceptOnCR: aBoolean
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>autoAccept: aBoolean [
	^ self input autoAccept: aBoolean
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>beEncrypted [
	^ self input beEncrypted
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>enableGlobalsCompletion [
	^ self input enableGlobalsCompletion
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>encrypted: aBoolean [
	^self input encrypted: aBoolean
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>entryCompletion: anEntryCompletion [
	^self input entryCompletion: anEntryCompletion
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>ghostText: aText [
	^self input ghostText: aText
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>initializeWidgets [
	super initializeWidgets.
	self content: TextInputFieldModel.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>input [
	^ self subwidget
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>removeEntryCompletion [
	^self input removeEntryCompletion
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>selectAll [
	^self input selectAll
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>text [
	^self input text
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>text: aText [
	self input text: aText
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>whenTextChanged: aBlock [
	self input whenTextChanged: aBlock
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledTextInput>>whenTextIsAccepted: aBlock [
	self input whenTextIsAccepted: aBlock
]
