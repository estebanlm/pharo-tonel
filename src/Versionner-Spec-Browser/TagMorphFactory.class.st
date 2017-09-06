"
A TagMorph is a morph used to define some tags.
It uses a rounded rectancle with a text inside.

self example
"
Class {
	#name : #TagMorphFactory,
	#superclass : #Object,
	#classVars : [
		'color',
		'text'
	],
	#category : #Versionner-Spec-Browser,
	#timestamp : '<historical>'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:38'
}
TagMorphFactory class>>example [
	(TagMorphFactory newTag: 'development') 
		morph openInHand 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:38'
}
TagMorphFactory class>>newTag: aText [
	^ self new
		text: aText;
		yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
TagMorphFactory>>color [
	^ color ifNil: [ Color green ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
TagMorphFactory>>color: aColor [
	color := aColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
TagMorphFactory>>font [
	^ (LogicalFont 
		familyName: TextStyle defaultFont familyName 
		pointSize: 8)
		emphasis: 1.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
TagMorphFactory>>height [
	^ 12
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:38'
}
TagMorphFactory>>morph [
	| textMorph width |
	textMorph := self textMorph.
	width := textMorph width + 10.
	^ BorderedMorph new
		extent: width @ self height;
		borderWidth: 1;
		color: self color;
		useRoundedCorners;
		addMorphCentered: textMorph;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
TagMorphFactory>>text [
	^ text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
TagMorphFactory>>text: aString [
	text := aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
TagMorphFactory>>textMorph [
	^ text asMorph 
		color: Color black;
		font:  self font;
		yourself.
]
