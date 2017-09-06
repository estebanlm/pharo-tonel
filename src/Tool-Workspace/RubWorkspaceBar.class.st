"
A bottom bar to change the editing mode, switch with/without line numbers and switch wrapping mode
"
Class {
	#name : #RubWorkspaceBar,
	#superclass : #RubScrolledTextSideRuler,
	#instVars : [
		'row',
		'wrappingPolicyMorph',
		'editingModeMorph',
		'lineNumbersDisplayMorph'
	],
	#category : #Tool-Workspace,
	#timestamp : 'StephaneDucasse 7/4/2015 23:17'
}

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar class>>key [
	^ #workspaceBar
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>backgroundColor [
	^ self paragraphProvider backgroundColor darker
]

{
	#category : #'managing line numbers',
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>changeLineNumbersDisplay [
	self paragraphProvider lineNumbersRuler 
		ifNil: [ self paragraphProvider withLineNumbers ]
		ifNotNil: [ self paragraphProvider withoutLineNumbers ].
	self paragraphProvider manageLayout.
	self updateContents
]

{
	#category : #'managing wrapping policy',
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>changeWrappingPolicy [
	self paragraphProvider wrapped 
		ifTrue: [ self paragraphProvider beNotWrapped  ]
		ifFalse: [ self paragraphProvider beWrapped ].
	self updateContents.
	self paragraphProvider changed
]

{
	#category : #'managing editing mode',
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>chooseEditingMode: anEvent [
	self modeListMenu invokeAt: anEvent position in: self world.
	self updateContents
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>computedHeightFrom: aRectangle [
	^ row ifNil: [0] ifNotNil: [row height]
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>computedWidthFrom: aRectangle [
	^ aRectangle width
]

{
	#category : #'managing editing mode',
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>editingModeLabel [
	^ self paragraphProvider editingMode label
]

{
	#category : #'managing editing mode',
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>editingModeLabelMorph [
	^ StringMorph
		contents: self editingModeLabel
		font: self fontToUse
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>fontToUse [
	^ RubAbstractTextArea lineNumbersFont 
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>initialize [
	super initialize.
	self side: #bottom.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>level [
	^ 1
]

{
	#category : #'managing line numbers',
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>lineNumbersDisplayLabel [
	^ self paragraphProvider lineNumbersRuler  
		ifNil: [ '+L' ]
		ifNotNil: [ 'L' ]
]

{
	#category : #'managing line numbers',
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>lineNumbersDisplayLabelMorph [
	^ StringMorph
		contents: self lineNumbersDisplayLabel
		font: self fontToUse
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>manageLayoutInBounds: aRectangle [
	| ret |
	ret := super manageLayoutInBounds: aRectangle.
	self updateContents.
	^ ret
]

{
	#category : #'managing editing mode',
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>modeListMenu [
	"Answer the menu to be presented to select an editing mode"

	| menu |
	menu := MenuMorph new.
	menu add: 'Plain text' target: self selector: #switchToPlainTextMode.
	menu add: 'Smalltalk scripting' target: self selector: #switchToSmalltalkScriptingMode.
	^ menu
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>noteNewOwner: aMorph [
	super noteNewOwner: aMorph.
	self color: self backgroundColor.
	self paragraphProvider beForSmalltalkScripting.
	wrappingPolicyMorph := self wrappingPolicyLabelMorph.
	editingModeMorph := self editingModeLabelMorph.
	lineNumbersDisplayMorph := self lineNumbersDisplayLabelMorph.
	row := self theme
		newRowIn: self
		for:
			{(self spacer: 2).
			editingModeMorph.
			(self spacer: 2).
			wrappingPolicyMorph.
			(self spacer: 2).
			lineNumbersDisplayMorph.
			(self spacer: 2)}.
	wrappingPolicyMorph on: #mouseDown send: #changeWrappingPolicy to: self.
	editingModeMorph on: #mouseDown send: #chooseEditingMode: to: self.
	lineNumbersDisplayMorph on: #mouseDown send: #changeLineNumbersDisplay to: self.
	row color: Color transparent.
	row hResizing: #spaceFill.
	self addMorph: row
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>spacer: anInteger [
	^ Morph new
		borderWidth: 0;
		color: Color transparent;
		extent: anInteger@3
]

{
	#category : #'managing editing mode',
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>switchToPlainTextMode [
	self paragraphProvider beForPlainText 
]

{
	#category : #'managing editing mode',
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>switchToSmalltalkScriptingMode [
	self paragraphProvider beForSmalltalkScripting 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>textColor [
	^ self textArea lineNumbersTextColor muchDarker

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>updateContents [
	row ifNil: [ ^self ].
	wrappingPolicyMorph contents: self wrappingPolicyLabel.
	editingModeMorph contents: self editingModeLabel.
	lineNumbersDisplayMorph contents: self lineNumbersDisplayLabel.
	row bounds: self innerBounds
]

{
	#category : #'managing wrapping policy',
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>wrappingPolicyLabel [
	^ self paragraphProvider wrapped
				ifTrue: [ 'W' ]
				ifFalse: [ 'NW' ]
]

{
	#category : #'managing wrapping policy',
	#timestamp : ' 8/31/2017 05:26:18'
}
RubWorkspaceBar>>wrappingPolicyLabelMorph [
	^ StringMorph
		contents: self wrappingPolicyLabel
		font: self fontToUse
]
