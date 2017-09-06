"
""When the text is wrapped, it is slower but the text has 1798 lines""
[self openWrapped] timeToRun  
     
""Enjoy the speed when not wrapped! ""
[self openNotWrapped] timeToRun 
 
"
Class {
	#name : #RubLipsumBasicExample,
	#superclass : #Model,
	#instVars : [
		'textModel'
	],
	#category : #Rubric-Editing-Widgets-Examples,
	#timestamp : 'AlainPlantec 3/17/2014 13:38'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubLipsumBasicExample class>>openNotWrapped [
	"self openNotWrapped"

	self openScrolledText: self new newScrolledTextNotWrapped.

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubLipsumBasicExample class>>openScrolledText: aScrolledText [

	|  window |
	window := StandardWindow new.
	window addMorph: aScrolledText fullFrame: (0@0 corner: 1@1) asLayoutFrame.
	window title: self title.
	self spyAnnouncer ifTrue: [ aScrolledText textArea announcer open ].
	window openInWorld
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubLipsumBasicExample class>>openWrapped [
	"self openWrapped"
	self openScrolledText: self new newScrolledTextWrapped.

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubLipsumBasicExample class>>spyAnnouncer [
	"Set it to true if you want to observe textArea announcements"
	^ false
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubLipsumBasicExample class>>title [
	^ 'Lorem Ipsum example'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubLipsumBasicExample>>loremIpsum [
	^ String loremIpsum: 81233
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubLipsumBasicExample>>newScrolledText [
	| st |
	st := self textModel newScrolledText
		withAdornment;
		withLineNumbers;
		withColumns;
		withGhostText: 'Hello, the text is now empty. Don''t worry, I will disappear if you enter some text.';
		withAnnotation;
		yourself.
	st ghostTextRuler fontName: 'Bitmap DejaVu Sans' pointSize: 18; centered.
	^ st
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubLipsumBasicExample>>newScrolledTextNotWrapped [
	^ self newScrolledText 
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubLipsumBasicExample>>newScrolledTextWrapped [
	^ self newScrolledText beWrapped
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubLipsumBasicExample>>textModel [
	^ textModel ifNil: [textModel := RubScrolledTextModel new text: self loremIpsum ]
]
