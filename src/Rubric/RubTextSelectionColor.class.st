"

"
Class {
	#name : #RubTextSelectionColor,
	#superclass : #TextAttribute,
	#instVars : [
		'colorBlock',
		'backgroundColorBlock',
		'emphasisCode'
	],
	#classVars : [
		'FindReplaceSelection',
		'OppositeDelimiterSelection',
		'PrimarySelection',
		'SecondarySelection'
	],
	#category : #Rubric-Editing-Core,
	#timestamp : ''
}

{
	#category : #'default accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor class>>findReplaceSelection [
	^ FindReplaceSelection
		ifNil: [ 
			FindReplaceSelection := self new
				colorBlock: [ 
							self theme currentSettings haveFindReplaceSelectionTextColor
								ifTrue: [ self theme currentSettings findReplaceSelectionTextColor ]
								ifFalse: [  ] ];
				backgroundColorBlock: [ self theme currentSettings findReplaceSelectionColor ];
				yourself ]
]

{
	#category : #'default accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor class>>oppositeDelimiterSelection [
	^ OppositeDelimiterSelection
		ifNil: [ 
			OppositeDelimiterSelection := self new
				colorBlock: [ self theme currentSettings selectionTextColor ];
				backgroundColorBlock: [ self theme currentSettings secondarySelectionColor ];
				yourself ]
]

{
	#category : #'default accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor class>>primarySelection [
	^ PrimarySelection
		ifNil: [ 
			PrimarySelection := self new
				colorBlock: [ self theme currentSettings selectionTextColor ];
				backgroundColorBlock: [ self theme currentSettings selectionColor ];
				yourself ]
]

{
	#category : #'default accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor class>>secondarySelection [
	^ SecondarySelection
		ifNil: [ 
			SecondarySelection := self new
				colorBlock: [ 
							self theme currentSettings haveSecondarySelectionTextColor
								ifTrue: [ self theme currentSettings secondarySelectionTextColor ]
								ifFalse: [  ] ];
				backgroundColorBlock: [ self theme currentSettings secondarySelectionColor ];
				yourself ]
]

{
	#category : #'default accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor class>>theme [
	^ UITheme current 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor>>backgroundColor [
	^ self backgroundColorBlock ifNotNil: [:bcb | bcb value]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor>>backgroundColorBlock [

	^ backgroundColorBlock 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor>>backgroundColorBlock: aBlock [

	 backgroundColorBlock := aBlock 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor>>colorBlock [

	^ colorBlock ifNil: [colorBlock := [self theme currentSettings selectionTextColor]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor>>colorBlock: aBlock [
	"aBlock value gives the text color"
	colorBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor>>dominates: other [
	"There can be only one..."
	^self class == other class
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor>>emphasisCode [
	^ emphasisCode ifNil: [ 0 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor>>emphasisCode: anInteger [
	emphasisCode := anInteger
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor>>emphasizeScanner: scanner [
	"Set the emphasis for text display"
	"self backgroundColor ifNotNil: [ :bc | scanner backgroundColor: bc ]."
	self textColor ifNotNil: [:c | scanner textColor: c].
	emphasisCode ifNotNil: [ scanner addEmphasis: emphasisCode ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor>>textColor [
	^ self colorBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSelectionColor>>theme [
	^ UITheme current 
]
