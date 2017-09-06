"
|browser|
browser := GLMTabulator new.
browser row: #row.

browser transmit to: #row; andShow: [ :composite |
	composite custom: (GLMRubricHighlightedTextPresentation new
		editingMode: [GLMHighlighterTextRubEditingMode 
			withStylerDecorator: (RbEPersonDecorator new
				styler:  (GLMHighlighterTextParserStyler new
					parser: RbEPersonColorizer new))]) ].
	
browser openOn: '
person {	
	name	=	''Phil'';
	age = ''23'';	
}
person {}
'.
"
Class {
	#name : #GLMRubricHighlightedTextPresentation,
	#superclass : #GLMRubricTextPresentation,
	#instVars : [
		'editingMode',
		'font'
	],
	#category : #Glamour-Rubric-Presentations,
	#timestamp : 'AndreiChis 9/2/2014 16:39'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricHighlightedTextPresentation>>editingMode [
	^ editingMode isNil 
		ifTrue: [nil] 
		ifFalse: [editingMode glamourValue: self]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricHighlightedTextPresentation>>editingMode: aBlock [
	
	editingMode := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricHighlightedTextPresentation>>font [
	^ font
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricHighlightedTextPresentation>>font: anObject [
	font := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricHighlightedTextPresentation>>morphicFont [
	^ self font 
		ifNil: [ StandardFonts defaultFont  ]
		ifNotNil: [ :f | f glamourValue: self entity ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricHighlightedTextPresentation>>renderGlamorouslyOn: aRenderer [
	self registerAnnouncements.
	^ aRenderer renderRubricHighlightedTextPresentation: self
]
