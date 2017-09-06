"
I represent a bar with annotations for the text area, like editing mode, line numbers etc
"
Class {
	#name : #RubAnnotationDisplayer,
	#superclass : #RubScrolledTextSideRuler,
	#instVars : [
		'lineAnnotation',
		'row',
		'wrappingPolicyMorph',
		'editingModeMorph',
		'tabWidthMorph',
		'columnDisplayMorph',
		'lineNumbersDisplayMorph'
	],
	#category : #Rubric-Editing-Widgets,
	#timestamp : 'FranckWarlouzet 7/29/2015 13:37'
}

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer class>>key [
	^ #annotation
]

{
	#category : #menus,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer class>>tabWidthMenuOn: aBuilder [
	"Specify the menu used to select the tab width"

	<contextMenu>
	<RubTabWidthMenu>
	(6 to: 200 by: 6) do: [ :t | (aBuilder item: t asString asSymbol) action: [ :model | model chosenTabWidth: t ] ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>backgroundColor [
	^ self paragraphProvider backgroundColor darker
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>changeColumnDisplay [
	self paragraphProvider columnRuler
		ifNil: [ self paragraphProvider withColumns ]
		ifNotNil: [ self paragraphProvider withoutColumns ].
	self textArea changed.
	self updateContents
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>changeLineNumbersDisplay [
	self paragraphProvider lineNumbersRuler 
		ifNil: [ self paragraphProvider withLineNumbers ]
		ifNotNil: [ self paragraphProvider withoutLineNumbers ].
	self paragraphProvider manageLayout.
	self updateContents
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>changeWrappingPolicy [
	self paragraphProvider wrapped 
		ifTrue: [ self paragraphProvider beNotWrapped  ]
		ifFalse: [ self paragraphProvider beWrapped ].
	self updateContents.
	self paragraphProvider changed
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>chooseEditingMode: anEvent [
	self modeListMenu invokeAt: anEvent position in: self world.
	self updateContents
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>chooseTabWidth: anEvent [
	self tabWidthMenu invokeAt: anEvent position in: self world
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>chosenTabWidth: anInteger [
	self paragraph tabWidth: anInteger.
	self updateContents
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>columnDisplayLabel [
	^ self paragraphProvider columnRuler 
		ifNil: [ '+C' ]
		ifNotNil: [ 'C' ]
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>columnDisplayLabelMorph [
	^ StringMorph
		contents: self columnDisplayLabel
		font: self fontToUse
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>computedHeightFrom: aRectangle [
	^ row ifNil: [0] ifNotNil: [row height]
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>computedWidthFrom: aRectangle [
	^ aRectangle width
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>editingModeLabel [
	^ self paragraphProvider editingMode label
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>editingModeLabelMorph [
	^ StringMorph
		contents: self editingModeLabel
		font: self fontToUse
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>fontToUse [
	^ RubAbstractTextArea lineNumbersFont 
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>initialize [
	super initialize.
	self side: #bottom.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>level [
	^ 1
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>lineNumbersDisplayLabel [
	^ self paragraphProvider lineNumbersRuler  
		ifNil: [ '+L' ]
		ifNotNil: [ 'L' ]
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>lineNumbersDisplayLabelMorph [
	^ StringMorph
		contents: self lineNumbersDisplayLabel
		font: self fontToUse
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>manageLayoutInBounds: aRectangle [
	| ret |
	ret := super manageLayoutInBounds: aRectangle.
	self updateContents.
	^ ret
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>modeListMenu [
	"Answer the menu to be presented to select an editing mode"

	^ (PragmaMenuBuilder pragmaKeyword: #RubEditingModeMenu model: self) menu
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>noteNewOwner: aMorph [
	super noteNewOwner: aMorph.
	self color: self backgroundColor.
	lineAnnotation := RubTextFieldArea new.
	lineAnnotation withoutAnyDecorator.
	lineAnnotation backgroundColor: Color transparent.
	lineAnnotation font: self fontToUse.
	lineAnnotation beReadOnly.
	lineAnnotation textColor: self textColor.
	wrappingPolicyMorph := self wrappingPolicyLabelMorph.
	editingModeMorph := self editingModeLabelMorph.
	tabWidthMorph := self tabWidthLabelMorph.
	columnDisplayMorph := self columnDisplayLabelMorph.
	lineNumbersDisplayMorph := self lineNumbersDisplayLabelMorph.
	row := self theme
		newRowIn: self
		for:
			{(self spacer: 2).
			lineAnnotation.
			(self spacer: 2).
			tabWidthMorph.
			(self spacer: 2).
			editingModeMorph.
			(self spacer: 2).
			wrappingPolicyMorph.
			(self spacer: 2).
			lineNumbersDisplayMorph.
			(self spacer: 2).
			columnDisplayMorph.
			(self spacer: 2)}.
	wrappingPolicyMorph on: #mouseDown send: #changeWrappingPolicy to: self.
	tabWidthMorph on: #mouseDown send: #chooseTabWidth: to: self.
	editingModeMorph on: #mouseDown send: #chooseEditingMode: to: self.
	columnDisplayMorph on: #mouseDown send: #changeColumnDisplay to: self.
	lineNumbersDisplayMorph on: #mouseDown send: #changeLineNumbersDisplay to: self.
	row color: Color transparent.
	row hResizing: #spaceFill.
	lineAnnotation hResizing: #spaceFill.
	self addMorph: row
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>selectionChanged [
	self updateContents.
	super selectionChanged
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>spacer: anInteger [
	^ Morph new
		borderWidth: 0;
		color: Color transparent;
		extent: anInteger@3
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>tabWidth [
	^ self paragraph tabWidth
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>tabWidthLabel [
	^ 'Tab width: ', self tabWidth printString
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>tabWidthLabelMorph [
	^ StringMorph
		contents: self tabWidthLabel
		font: self fontToUse
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>tabWidthMenu [
	"Answer the menu to be presented to select a tab width"

	^ (PragmaMenuBuilder pragmaKeyword: #RubTabWidthMenu model: self) menu
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>textColor [
	^ self textArea lineNumbersTextColor muchDarker

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>textOfCharBlock: aCharacterBlock [
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
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>updateContents [
	| t |
	row ifNil: [ ^self ].
	self textArea selectionStart ifNil: [ ^self ].
	self lines ifNil: [ ^self ].
	t := self textOfCharBlock: self textArea selectionStart.
	self textArea selectionStop ~= self textArea selectionStart
		ifTrue: [ t := t , ' -- ' , (self textOfCharBlock: self textArea selectionStop) ].
	lineAnnotation
		beEditableWhile: [ 
			lineAnnotation setTextWith: t.
			self layoutChanged ].
	wrappingPolicyMorph contents: self wrappingPolicyLabel.
	editingModeMorph contents: self editingModeLabel.
	tabWidthMorph contents: self tabWidthLabel.
	columnDisplayMorph contents: self columnDisplayLabel.
	lineNumbersDisplayMorph contents: self lineNumbersDisplayLabel.
	row position: self innerBounds topLeft.
	row width: self innerBounds width
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>wrappingPolicyLabel [
	^ self paragraphProvider wrapped
				ifTrue: [ 'W' ]
				ifFalse: [ 'NW' ]
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAnnotationDisplayer>>wrappingPolicyLabelMorph [
	^ StringMorph
		contents: self wrappingPolicyLabel
		font: self fontToUse
]
