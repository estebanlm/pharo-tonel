"
I am a TextArea that only has one line of text.
"
Class {
	#name : #RubTextFieldArea,
	#superclass : #RubAbstractTextArea,
	#category : #Rubric-Editing-Core,
	#timestamp : 'SeanDeNigris 4/28/2015 19:15'
}

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldArea>>defaultMargins [
	^ 2 @ 0 corner: 2 @ 1
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldArea>>newParagraph [
	^ RubExtraSelectionDecorator next: super newParagraph

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldArea>>privateReplaceFrom: start to: stop with: aText [

	super privateReplaceFrom: start to: stop with: (self sanitize: aText)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldArea>>sanitize: aText [
	| lineEndings |
	lineEndings := { Character cr. Character lf }.
	"Remove line endings that may have been introduced via copy-paste, but only if we have to because it will remove all text attributes"
	^ (aText includesAnyOf: lineEndings)
		ifTrue: [ aText copyWithoutAll: lineEndings ]
		ifFalse: [ aText ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldArea>>walkAlongDisplayedLine [
	^ false
]
