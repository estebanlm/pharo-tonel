"
This class was introduced to ease the migration to Rubric.
It is still based on change/update.
Try to not use it 
"
Class {
	#name : #RubPluggableTextMorph,
	#superclass : #RubScrolledTextMorph,
	#instVars : [
		'askBeforeDiscardingEdits',
		'getEnabledSelector'
	],
	#category : #Rubric-Editing-Widgets,
	#timestamp : 'AlainPlantec 10/5/2015 15:27'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph class>>on: anObject text: getTextSel accept: setTextSel readSelection: getSelectionSel menu: getMenuSel [

	^ self new on: anObject
		text: getTextSel
		accept: setTextSel
		readSelection: getSelectionSel
		menu: getMenuSel
		setSelection: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph class>>on: anObject text: getTextSel accept: setTextSel readSelection: getSelectionSel menu: getMenuSel setSelection: setSelectionSel [

	^ self new on: anObject
		text: getTextSel
		accept: setTextSel
		readSelection: getSelectionSel
		menu: getMenuSel
		setSelection: setSelectionSel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph>>askBeforeDiscardingEdits: aBoolean [
	"Set the flag that determines whether the user should be asked before discarding unaccepted edits."

	askBeforeDiscardingEdits := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph>>getEnabledSelector [
	"Answer the value of getEnabledSelector"

	^ getEnabledSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph>>getEnabledSelector: aSymbol [
	"Answer the value of getEnabledSelector"

	getEnabledSelector := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph>>hasUnacceptedEdits: aBoolean [
	"Set the hasUnacceptedEdits flag to the given value. "

	(self model respondsTo: #hasUnacceptedEdits:)
		ifTrue: [ self model hasUnacceptedEdits: aBoolean ]
		ifFalse: [ 
			super hasUnacceptedEdits: aBoolean.
			self changed ].
	aBoolean
		ifFalse: [ hasEditingConflicts := false ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph>>initialize [
	super initialize.
	hasUnacceptedEdits := false.
	hasEditingConflicts := false.
	askBeforeDiscardingEdits := true
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph>>model: anObject [
	super model: anObject.
	anObject addDependent: self
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph>>on: aModel text: aGetTextSelector accept: aSetTextSelector readSelection: aReadSelectionSelector menu: aGetMenuSelector [
	self getTextSelector: aGetTextSelector.
	self setTextSelector: aSetTextSelector.
	self getSelectionSelector: aReadSelectionSelector.
	aGetMenuSelector
		ifNil: [ self textArea forbidMenu ]
		ifNotNil: [ self menuProvider: aModel selector: aGetMenuSelector ].
	self on: aModel
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph>>on: anObject text: getTextSel accept: setTextSel readSelection: getSelectionSel menu: getMenuSel setSelection: setSelectionSel [
	self
		on: anObject
		text: getTextSel
		accept: setTextSel
		readSelection: getSelectionSel
		menu: getMenuSel.
	setSelectionSelector := setSelectionSel.
	self borderWidth: 1.
	self setText: self getTextFromModel.
	self setSelection: self getSelectionFromModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph>>promptForCancel [
	"Ask for the appropriate action to take when unaccepted contents
	would be overwritten."

	| choice |
	choice := UIManager default
		confirm: 'Contents has been modified.\What do you want to do?' translated withCRs
		trueChoice: 'Accept' translated
		falseChoice: 'Discard' translated
		cancelChoice: 'Cancel' translated
		default: nil.
	choice
		ifNotNil: [ 
			choice
				ifTrue: [ 
					self acceptTextInModel.
					self basicHasUnacceptedEdits: false ]
				ifFalse: [ self model 
						ifNotNil: [ :m | m clearUserEditFlag ] 
						ifNil: [ self basicHasUnacceptedEdits: false ] ] ]
]

{
	#category : #'accessing scrollbars',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph>>registerScrollChanges: aSelector [

	self announcer 
		when: PaneScrolling 
		send: aSelector
		to: self model
]

{
	#category : #'accessing scrollbars',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph>>scrollerOffsetChanged [
	super scrollerOffsetChanged.
	self announcer
		announce:
			(PaneScrolling new
				step: self scrollPane hScrollbarValue @ self scrollPane vScrollbarValue;
				scrollPane: self scrollPane;
				yourself)
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph>>update: aSymbol [
	aSymbol ifNil: [ ^ self ].
	aSymbol == #flash
		ifTrue: [ ^ self flash ].
	aSymbol == self getTextSelector
		ifTrue: [ self updateTextWith: self getTextFromModel.
			^ self setSelection: self getSelectionFromModel ].
	aSymbol == self getSelectionSelector
		ifTrue: [ ^ self setSelection: self getSelectionFromModel ].
	aSymbol == #clearUserEdits
		ifTrue: [ ^ self hasUnacceptedEdits: false ].
	aSymbol == #wantToChange
		ifTrue: [ self canDiscardEdits
				ifFalse: [ ^ self promptForCancel ].
			^ self ].
	aSymbol == #appendEntry
		ifTrue:
			[ "Hack to manage the Transcript (Gloups) "
			self textArea
				handleEdit:
					[ "Knock off first half of text"
					self text size > self model characterLimit
						ifTrue: [ self textArea selectInvisiblyFrom: 1 to: self text size // 2.
							self textArea replaceSelectionWith: Text new ].	
					self appendText: self model contents asText ].
			^ self ].
	aSymbol == #clearText
		ifTrue: [ self textArea handleEdit: [ self updateTextWith: Text new ].
			^ self ].
	aSymbol == #bs
		ifTrue: [ self handleEdit: [ self updateTextWith: (self text copyFrom: 1 to: (self text size - 1 max: 0)) ].
			^ self ].
	aSymbol == #codeChangedElsewhere
		ifTrue: [ self hasEditingConflicts: true.
			^ self ].
	aSymbol == self getEnabledSelector
		ifTrue: [ self updateEnabled ].
	^ self
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableTextMorph>>updateEnabled [
	"Update the enablement state."

	self model ifNotNil: [
		self getEnabledSelector ifNotNil: [
			self enabled: (self model perform: self getEnabledSelector)]]
]
