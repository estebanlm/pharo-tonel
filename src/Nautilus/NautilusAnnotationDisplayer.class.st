"
Allow the annotation display in source code pane
"
Class {
	#name : #NautilusAnnotationDisplayer,
	#superclass : #RubScrolledTextSideRuler,
	#instVars : [
		'lineAnnotation',
		'row',
		'wrappingPolicyMorph',
		'lineNumbersDisplayMorph',
		'formatAsYouReadMorph'
	],
	#category : #Nautilus-Widgets,
	#timestamp : 'FranckWarlouzet 6/3/2015 12:59'
}

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer class>>key [
	^ #SourceCodeAnnotation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>backgroundColor [
	
	| clr |
	
	clr := self paragraphProvider color.
	
	^clr luminance > 0.5 
		ifTrue: [ clr darker ]
		ifFalse: [ clr lighter]
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>changeLineNumbersDisplay [
	self paragraphProvider lineNumbersRuler 
		ifNil: [ self paragraphProvider withLineNumbers ]
		ifNotNil: [ self paragraphProvider withoutLineNumbers ].
	self paragraphProvider manageLayout.
	self updateContents
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>changeWrappingPolicy [
	self paragraphProvider wrapped 
		ifTrue: [ self paragraphProvider beNotWrapped  ]
		ifFalse: [ self paragraphProvider beWrapped ].
	self updateContents.
	self paragraphProvider changed
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>computedHeightFrom: aRectangle [
	^ row ifNil: [0] ifNotNil: [row height]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>fontToUse [
	^ self theme textFont
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>formatAsYouRead [
	 
	^ RBProgramNode formatterClass formatAsYouReadPolicy
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>formatAsYouReadLabel [
	^ 'Format as you read'
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>formatAsYouReadMorph [
	^ (CheckboxMorph on: self selected: #formatAsYouRead changeSelected: #toggleFormatAsYouRead)
		getLabelSelector: #formatAsYouReadLabel;
		labelClickable: true;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		setBalloonText:
			'Autoformat code without editing. Useful when reading some old/unformatted code. You can configure your own format in the settings browser.';
		yourself
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>initialize [
	super initialize.
	self side: #bottom
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>level [
	^ 1
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>lineAnnotationMorph [
	^ (RubTextFieldArea new
		withoutAnyDecorator;
		backgroundColor: Color transparent;
		font: self fontToUse;
		beReadOnly;
		textColor: self textColor)
		setBalloonText: 'Current line number/Total line number [Current character number]';
		yourself
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>lineNumbersDisplayLabel [
	^ self paragraphProvider lineNumbersRuler  
		ifNil: [ '+L' ]
		ifNotNil: [ 'L' ]
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>lineNumbersDisplayLabelMorph [
	^ (StringMorph contents: self lineNumbersDisplayLabel font: self fontToUse)
		setBalloonText: 'Let you decide if the code pane should show the line numbers at the left of the code pane or not. +L: Click to add the lines number/L: Click to hide them.';
		yourself
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>manageLayoutInBounds: aRectangle [
	| ret |
	ret := super manageLayoutInBounds: aRectangle.
	self updateContents.
	^ ret
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>nautilusUI [
	^ self owner model interactionModel
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>noteNewOwner: aMorph [
	super noteNewOwner: aMorph.
	self color: self backgroundColor.
	self paragraphProvider announcer when: MorphGotFocus send: #updateContents to: self.
	lineAnnotation := self lineAnnotationMorph.
	wrappingPolicyMorph := self wrappingPolicyLabelMorph.
	lineNumbersDisplayMorph := self lineNumbersDisplayLabelMorph.
	formatAsYouReadMorph := self formatAsYouReadMorph.
	row := self theme
		newRowIn: self
		for:
			{self spacer: 2.
			lineAnnotation.
			self spacer: 2.
			formatAsYouReadMorph.
			self spacer: 2.
			wrappingPolicyMorph.
			self spacer: 2.
			lineNumbersDisplayMorph.
			self spacer: 2}.	
	wrappingPolicyMorph on: #mouseDown send: #changeWrappingPolicy to: self.
	lineNumbersDisplayMorph on: #mouseDown send: #changeLineNumbersDisplay to: self.
	row color: Color transparent.
	row hResizing: #spaceFill.
	lineAnnotation hResizing: #spaceFill.
	self addMorph: row
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>selectionChanged [
	self updateContents.
	super selectionChanged
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>spacer: anInteger [
	^ Morph new
		borderWidth: 0;
		color: Color transparent;
		extent: anInteger@3;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>textColor [
	^ self theme textColor

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>textOfCharBlock: aCharacterBlock [
	| t l c |
	l := aCharacterBlock textLine.
	c := aCharacterBlock stringIndex - l first + 1.
	t := l lineNumber printString , '/' , self lines size printString
		, ' [', c printString.
	self paragraphProvider annotationRuler
		ifNotNil: [ :r | 
			| tabIdx |
			tabIdx := ((aCharacterBlock left + 1) // self paragraph tabWidth) + 1.
			t := t , ':' , tabIdx printString ].
	t := t, ']'.
	^ t
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>themeChanged [

	self color: self backgroundColor .
	
	self allMorphsDo: [ :morph | 
		(morph isKindOf: StringMorph) ifTrue: [ 
			morph color: self textColor		
		] 
	].

	super themeChanged
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>toggleFormatAsYouRead [
	| formatter |
	formatter := RBProgramNode formatterClass new.
	formatter class formatAsYouReadPolicy
		ifTrue: [ 
			formatter class formatAsYouReadPolicy: false. 
			self owner model canDiscardEdits
				ifTrue: [ self owner model cancelEdits ] ]
		ifFalse: [ 
			formatter class formatAsYouReadPolicy: true.
			self owner model
				formatSourceCodeInView;
				clearUserEdits ].
	self updateContents.
	self paragraphProvider changed
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>updateContents [
	| t |
	row ifNil: [ ^ self ].
	self textArea selectionStart ifNil: [ ^ self ].
	self lines ifNil: [ ^ self ].
	t := self textOfCharBlock: self textArea selectionStart.
	self textArea selectionStop ~= self textArea selectionStart
		ifTrue: [ t := t , ' -- ' , (self textOfCharBlock: self textArea selectionStop) ].
	lineAnnotation
		beEditableWhile: [ 
			lineAnnotation setTextWith: t.
			self layoutChanged ].
	wrappingPolicyMorph contents: self wrappingPolicyLabel.
	lineNumbersDisplayMorph contents: self lineNumbersDisplayLabel.
	formatAsYouReadMorph updateSelection.
	row position: self innerBounds topLeft.
	row width: self innerBounds width
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>wrappingPolicyLabel [
	^ self paragraphProvider wrapped
				ifTrue: [ 'W' ]
				ifFalse: [ 'NW' ]
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusAnnotationDisplayer>>wrappingPolicyLabelMorph [
	^ (StringMorph contents: self wrappingPolicyLabel font: self fontToUse)
		setBalloonText:
			'Let you decide if the code pane should automaticaly wrap lines if a line reach the end of the line. W: Wrap / NW: Add a scrollbar.';
		yourself
]
