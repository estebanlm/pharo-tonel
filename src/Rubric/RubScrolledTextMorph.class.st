"
I am the common morph to represent a text area. I should be created by my model, a RubScrolledTextModel. The tool should talk to my model and not me directly 
"
Class {
	#name : #RubScrolledTextMorph,
	#superclass : #Morph,
	#instVars : [
		'hasEditingConflicts',
		'hasUnacceptedEdits',
		'alwaysAccept',
		'setTextSelector',
		'getTextSelector',
		'getSelectionSelector',
		'setSelectionSelector',
		'autoAccept',
		'scrollPane',
		'rulers',
		'enabled',
		'highlights'
	],
	#category : #Rubric-Editing-Widgets,
	#timestamp : 'FranckWarlouzet 7/29/2015 13:39'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph class>>on: aModel  [
	^ self new on: aModel
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>acceptContents [
	(self autoAccept not and: [ self canDiscardEdits and: [ self alwaysAccept not ] ])
		ifTrue: [ ^ self flash ].
	self hasEditingConflicts
		ifTrue: [  
			(self
				confirm:
					'Caution! This method may have been
changed elsewhere since you started
editing it here.  Accept anyway?' translated)
				ifFalse: [ ^ self flash ] ].
	self acceptTextInModel == true
		ifTrue: [
			self hasUnacceptedEdits: false.
			self rulers do: [ :r | r textAccepted ].
			self announcer announce: (RubTextAccepted morph: self) ]
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>acceptTextInModel [
	self model ifNil: [ ^ true ].
	 ^ self setTextSelector numArgs = 2
		ifTrue: [ self model perform: self setTextSelector with: self text with: self ]
		ifFalse: [ self model perform: self setTextSelector withEnoughArguments: (Array with: self text) ]
]

{
	#category : #'accessing segments',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>addSegment: aRubTextSegmentMorph [
	^ self textArea addSegment: aRubTextSegmentMorph

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>adornmentColor [
	"color to Indicate edit status for the given morph."

	self hasEditingConflicts
		ifTrue: [ ^ Color red ].
	self hasUnacceptedEdits
		ifTrue: [ ^ Color orange ].
	^ Color transparent
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>adornmentRuler [
	^ self rulerNamed: #adornment
]

{
	#category : #'accessing menu',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>allowMenu [
	self menuAllowed: true
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>alwaysAccept [
	^ alwaysAccept ifNil: [ alwaysAccept := false]
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>alwaysAccept: aBoolean [
	"Set the always accept flag."
	"This flag is used when there are unsaved changes in my text field and an exterior actor tries to modify me"
	"If the flag is true, I will accept to change even if I have pending modification instead of poping up the Accept/Discard/Cancel window"


	alwaysAccept := aBoolean

]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>annotationRuler [
	^ self rulerNamed: #annotation
]

{
	#category : #'acessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>appendText: stringOrText [
	"Accept new text contents with line breaks only as in the text.
	Fit my width and height to the result."

	self scrollPane appendText: stringOrText.	
	self resetState
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>autoAccept [
	"Answer whether the editor accepts its contents on each change."

	^autoAccept ifNil: [autoAccept := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>autoAccept: aBoolean [
	"Whether I should accept my contents on each change."
	autoAccept := aBoolean.
	aBoolean
		ifTrue: [ self withoutAdornment; acceptContents]
		ifFalse: [ self withAdornment ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>backgroundColor [
	^self color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>backgroundColor: aColor [
	self color: aColor
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>basicHasUnacceptedEdits: aBoolean [
	self autoAccept
		ifTrue: [ ^ self ].
	aBoolean = hasUnacceptedEdits 
		ifFalse: [ hasUnacceptedEdits := aBoolean.
			self changed].
	aBoolean 
		ifFalse: [hasEditingConflicts := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>beEditable [
	self textArea beEditable 
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>beForPlainText [
	self textArea beForPlainText
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>beForSmalltalkCode [
	self textArea beForSmalltalkCode.
	self withTextSegmentIcons.
	self textArea font: StandardFonts codeFont
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>beForSmalltalkCodeInClass: aClass [
	self textArea beForSmalltalkCodeInClass: aClass.
	self withTextSegmentIcons.
	self textArea font: StandardFonts codeFont
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>beForSmalltalkCodeWithDefaultFont [
	self textArea beForSmalltalkCodeWithDefaultFont.
	self withTextSegmentIcons
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>beForSmalltalkComment [
	self textArea beForSmalltalkComment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>beForSmalltalkScripting [
    self textArea beForSmalltalkScripting.
    self textArea font: StandardFonts codeFont

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>beForSmalltalkScriptingWithDefaultFont [
    self textArea beForSmalltalkScriptingWithDefaultFont

]

{
	#category : #'acessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>beNotWrapped [
	self scrollPane beNotWrapped 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>beReadOnly [
	self textArea beReadOnly 
]

{
	#category : #'acessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>beWrapped [
	self scrollPane beWrapped
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>borderStyleToUse [
	"Answer the borderStyle that should be used for the receiver."
	
	^self enabled
		ifTrue: [self theme rubScrolledTextMorphThemer normalBorderStyleFor: self]
		ifFalse: [self theme rubScrolledTextMorphThemer disabledBorderStyleFor: self]
]

{
	#category : #'accessing scrollbars',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>borderWidth: anInteger [
	super borderWidth: anInteger.
	self extent: self extent.
	self manageLayout 
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>canDiscardEdits [
	^self hasUnacceptedEdits not
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>cancel [

	self updateTextWith: self getTextFromModel.
	self setSelection: self getSelectionFromModel
]

{
	#category : #'rulers handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>classOfRulerNamed: aKey [
	^ RubScrolledTextExtra classOfRulerNamed: aKey
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>classOrMetaClass: aBehavior [
	self textArea classOrMetaClass: aBehavior
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>columnRuler [
	^ self rulerNamed: #column
]

{
	#category : #configure,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>configureGhostText: aTextArea [
	aTextArea width: self scrollBounds width.
	aTextArea center: self scrollBounds center
]

{
	#category : #'interactive error protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>correctFrom: start to: stop with: aString [
	self textArea correctFrom: start to: stop with: aString
]

{
	#category : #'accessing scrollbars',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>currentHScrollBarThickness [
	^self scrollPane currentHScrollBarThickness
]

{
	#category : #'accessing text area',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>cursor [
	"polymorphism with text area"
	^ self textArea cursor
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>defaultBackgroundColor  [
	^ Smalltalk ui theme backgroundColor
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>defaultBorderWidth [
	^ 0
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>defaultColor [
	^ self defaultBackgroundColor 
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>defaultGhostTextMorph [
	| gt |
	gt := RubEditingArea new.
	gt withoutAnyDecorator.
	gt backgroundColor: Color transparent.
	gt beReadOnly.
	gt beWrapped.
	^ gt
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>defaultScrollTarget [
	| textArea |
	textArea := self textAreaClass new.
	textArea backgroundColor: Color lightGray veryMuchLighter.
	^ textArea
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>drawFocusBorder [
	^ self scrollPane drawFocusBorder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>drawFocusBorder: aBoolean [
	self scrollPane drawFocusBorder: aBoolean
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>drawHighlightsOn: aCanvas [
	"Draw the highlights."

	| scrollBounds scrollOffset |
	
	scrollBounds := self scrollPane innerBounds.
	scrollOffset := self scrollPane scroller offset.
	
	aCanvas clipBy: self clippingBounds during: [ :canvas | 
		self highlights do: [ :highlight | 
			highlight drawOn: canvas in: scrollBounds offset: scrollOffset 
		] 
	]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>drawOn: aCanvas [
	super drawOn: aCanvas.
	self drawHighlightsOn: aCanvas 
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>drawOnAthensCanvas: anAthensCanvas [
	"Indicate unaccepted edits, conflicts etc."

	super drawOnAthensCanvas: anAthensCanvas. 
	self drawHighlightsOn: anAthensCanvas asCanvasWrapper
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>drawSubmorphsOn: aCanvas [
	"Display submorphs back to front"

	| drawBlock subs |
	submorphs isEmpty
		ifTrue: [ ^ self ].
	subs := submorphs copyWithoutAll: self sideRulers.
	drawBlock := [ :canvas | subs reverseDo: [ :m | canvas fullDrawMorph: m ] ].
	self clipSubmorphs
		ifTrue: [ aCanvas clipBy: (aCanvas clipRect intersect: self clippingBounds ifNone: [ ^ self ]) during: drawBlock ]
		ifFalse: [ drawBlock value: aCanvas ].
	subs := self sideRulers.
	drawBlock := [ :canvas | subs reverseDo: [ :m | canvas fullDrawMorph: m ] ].
	self clipSubmorphs
		ifTrue: [ aCanvas clipBy: (aCanvas clipRect intersect: self clippingBounds ifNone: [ ^ self ]) during: drawBlock ]
		ifFalse: [ drawBlock value: aCanvas ]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>drawSubmorphsOnAthensCanvas: anAthensCanvas [
	"Display submorphs back to front"

	| drawBlock subs |
	submorphs isEmpty
		ifTrue: [ ^ self ].
	subs := submorphs copyWithoutAll: self sideRulers.
	drawBlock := [ subs reverseDo: [ :m | anAthensCanvas fullDrawMorph: m ] ].
	self clipSubmorphs
		ifTrue: [ anAthensCanvas clipBy: (anAthensCanvas clipRect intersect: self clippingBounds ifNone: [ ^ self ]) during: drawBlock ]
		ifFalse: [ drawBlock value ].
	subs := self sideRulers.
	drawBlock := [ subs reverseDo: [ :m | anAthensCanvas fullDrawMorph: m ] ].
	self clipSubmorphs
		ifTrue: [ anAthensCanvas clipBy: (anAthensCanvas clipRect intersect: self clippingBounds ifNone: [ ^ self ]) during: drawBlock ]
		ifFalse: [ drawBlock value ]
]

{
	#category : #accessing-selection,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>editPrimarySelectionSeparately [
	self textArea editPrimarySelectionSeparately
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>editingMode [
	^  self textArea editingMode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>editingMode: anEditingMode [
	self textArea editingMode: anEditingMode.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>editingModeClass [
	^ self textArea editingMode class
]

{
	#category : #'mock for spec',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>enabled: aBoolean [
	enabled = aBoolean ifTrue: [^self].
	enabled := aBoolean.
	self textArea readOnly: aBoolean not.
	self changed
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>extent: aPoint [
	super extent: aPoint.
	self manageLayout
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>extraAreas [
	^ self rulers select: [ :r | r isOver ]

]

{
	#category : #'acessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>font [
	^ self textArea font
]

{
	#category : #'accessing text area',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>font: aFont [
	"polymorphism with text area"
	self textFont: aFont
]

{
	#category : #'accessing menu',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>forbidMenu [
	self menuAllowed: false
]

{
	#category : #formatting,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>formatSourceCode [
	self textArea formatMethodCode
]

{
	#category : #'accessing menu',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>getMenuPolicy: aGetMenuPolicy [
	self textArea getMenuPolicy: aGetMenuPolicy
]

{
	#category : #accessing-selection,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>getSelectionFromModel [
	"Answer the model's selection interval."

	^ self getSelectionSelector ifNotNil: [ :s | self model perform: s withEnoughArguments: {self} ]
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>getSelectionSelector [
	^ getSelectionSelector
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>getSelectionSelector: aSelector [
	getSelectionSelector := aSelector.

]

{
	#category : #'acessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>getText [
	"Retrieve the current view text, possibly not accepted"

	^ self textArea text
]

{
	#category : #'acessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>getTextFromModel [
	"Retrieve the current model text"

	| newText |
	self getTextSelector ifNil: [^Text new].
	newText := (self model perform: self getTextSelector withEnoughArguments: {self}).
	newText ifNil: [^Text new].
	^newText copy asText
]

{
	#category : #'acessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>getTextFromView [
	"Retrieve the current view text, possibly not accepted"

	^ self textArea text
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>getTextSelector [
	^ getTextSelector ifNil: [  getTextSelector := #getText ]
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>getTextSelector: aSymbol  [
	getTextSelector  := aSymbol
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>ghostTextRuler [
	^ self rulerNamed: #ghostText
]

{
	#category : #'accessing scrollbars',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>hScrollbarShowAlways [
	self scrollPane hScrollbarShowAlways.
	self extent: self extent.
	self manageLayout 
]

{
	#category : #'accessing scrollbars',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>hScrollbarShowNever [
	self scrollPane hScrollbarShowNever
]

{
	#category : #'accessing scrollbars',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>hScrollbarShowWhenNeeded [
	self scrollPane hScrollbarShowWhenNeeded
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>handleMouseDown: event [
	^ super handleMouseDown: event
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>handlesKeyboard: evt [
	"Yes for page up/down."
	
	^true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>handlesMouseDown: event [
	^ self scrollBounds containsPoint: event cursorPoint
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>handlesMouseWheel: evt [
	"Do I want to receive mouseWheel events?" 

	^ true
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>hasEditingConflicts [
	^ hasEditingConflicts ifNil: [ hasEditingConflicts := false ] 
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>hasEditingConflicts: aBoolean [
	hasEditingConflicts := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>hasKeyboardFocus [
	^ (self scrollPane ifNil: [ ^false ]) hasKeyboardFocus
]

{
	#category : #'rulers handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>hasRuler: aRuler [
	^ self rulers includes: aRuler
	
]

{
	#category : #'rulers handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>hasRulerNamed: aKey [
	^ self rulers anySatisfy: [ :r | r key = aKey ]
	
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>hasUnacceptedEdits [
	^ hasUnacceptedEdits ifNil: [ hasUnacceptedEdits := false ] 
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>hasUnacceptedEdits: aBoolean [
	"Set the hasUnacceptedEdits flag to the given value. "
	
	(self model respondsTo: #hasUnacceptedEdits:)
		ifTrue: [ self model hasUnacceptedEdits: aBoolean ]
		ifFalse: [ self basicHasUnacceptedEdits: aBoolean ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>highlights [
	^ highlights
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>highlights: anObject [
	highlights := anObject
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>horizontalRulers [
	^self rulers select: [ :r | r isHorizontal ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>initialize [
	super initialize.
	self clipSubmorphs: true.
	enabled := true.
	rulers := SortedCollection sortBlock: [ :a :b | b level > a level ].
	self addMorph: (scrollPane := self newScrollPane).
	self announcer when: RubConfigurationChange send: #whenConfigurationChanged: to: self.
	self textArea announcer when: RubCancelEditRequested send: #whenCancelEditRequested: to: self.
	self textArea announcer when: MorphGotFocus send: #whenGotForcus: to: self.
	self textArea announcer when: MorphLostFocus send: #whenLostFocus: to: self.
	self textArea announcer when: RubTextAcceptRequest send: #whenTextAcceptRequest: to: self.
	self textArea announcer when: RubTextChanged send: #whenTextChangedInTextArea: to: self.
	self textArea announcer when: RubReturnEntered send: #whenReturnEnteredInTextArea: to: self.
	self textArea announcer when: RubKeystroke send: #whenKeystrokeInTextArea: to: self.
	self withAdornment.
	self borderStyle: self borderStyleToUse.
	highlights := OrderedCollection new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>isReadOnly [
	^ self textArea isReadOnly 
]

{
	#category : #classification,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>isRenderer [
	^ true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>keyStroke: event [
	self scrollPane
		ifNotNil: [ :scrollpane | scrollpane keyStroke: (event transformedBy: (scrollpane transformFrom: self)) ]
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>lineNumbersRuler [
	^ self rulerNamed: #lineNumbers
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>manageLayout [
	| ret |
	self textArea ifNil: [ ^self ].
	ret := self manageLayoutInBounds: self innerBounds.
	self layoutChanged.
	^ret
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>manageLayoutInBounds: aRectangle [
	| myBounds |
	myBounds := aRectangle.
	self horizontalRulers do: [ :r | myBounds := r manageLayoutInBounds: myBounds ].
	self verticalRulers do: [ :r | myBounds := r manageLayoutInBounds: myBounds ].
	self overRulers do: [ :r | myBounds := r manageLayoutInBounds: myBounds ].
	self scrollPane
		ifNotNil: [ :scrollpane |
			scrollpane position: myBounds topLeft.
			scrollpane extent: (myBounds extent max: 0@0)].
	^ myBounds
]

{
	#category : #'accessing text area',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>margins: aRectangle [
	"polymorphism with text area"
	self textArea margins: aRectangle
]

{
	#category : #'accessing menu',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>menuAllowed: aBoolean [
	self textArea menuAllowed: aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>menuProvider: anObject selector: aSelector [
	self textArea
		getMenuPolicy:
			(RubPluggableGetMenuPolicy new
				getMenuSelector: aSelector;
				menuProvider: anObject;
				yourself)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>model  [
	^self textArea model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>model: aModel [
	self textArea model: aModel.
	self setTextWith: self getTextFromModel.
	self setSelection: self getSelectionFromModel.
	aModel announcer when: RubTextAcceptedInModel send: #whenTextAcceptedInModel: to: self.	
	aModel announcer when: RubEditsStateChangedInModel send: #whenEditsStateChangedInModel: to: self.
	aModel announcer when: RubTextSetInModel send: #whenTextSetInModel: to: self.	
	aModel announcer when: RubTextUpdatedInModel send: #whenTextUpdatedInModel: to: self.	
	aModel announcer when: RubPrimarySelectionUpdatedInModel send: #whenPrimarySelectionUpdatedInModel: to: self.
	aModel announcer when: RubCancelEditRequestedInModel send: #whenCancelEditRequestedInModel: to: self.	
	aModel announcer when: RubConfigurationChange send: #whenConfigurationChangedFromModel: to: self.

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>mouseDown: event [
	"If pane is not empty, pass the event to the last submorph,
	assuming it is the most appropriate recipient (!)"

	(self innerBounds containsPoint: event cursorPoint)
		ifTrue: [ 
			self scrollPane mouseDown: event.
			self eventHandler ifNotNil: [ self eventHandler mouseDown: event fromMorph: self ] ]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>mouseWheel: event  [
	"Handle a mouseWheel event."
	
	(self scrollPane scrollTarget handlesMouseWheel: event)
		ifTrue: [^self scrollTarget mouseWheel: event]. "pass on"
]

{
	#category : #accessing-selection,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>moveCursorToIndex: anIndex  [
	self selectFrom: anIndex to: anIndex - 1
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>newScrollPane [
	| sp |
	sp := RubTextScrollPane new.
	sp scrollTarget: self defaultScrollTarget.
	^ sp
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>noteNewOwner: aMorph  [
	super noteNewOwner: aMorph.
	self manageLayout 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>notificationStrategy: aStrategy [
	self textArea notificationStrategy: aStrategy
]

{
	#category : #'interactive error protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>notify: message at: location in: code [
	^ self textArea notify: message at: location in: code
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>offset [
	^ self scrollPane offset
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>on: aModel  [
	self model: aModel.

]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>on: aModel text: aGetTextSelector accept: aSetTextSelector readSelection: aReadSelectionSelector menu: aGetMenuSelector [
	self getTextSelector: aGetTextSelector.
	self setTextSelector: aSetTextSelector.
	self getSelectionSelector: aReadSelectionSelector.
	self menuProvider: aModel selector: aGetMenuSelector.
	self on: aModel
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>overRulers [
	^self rulers select: [ :r | r isOver ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>paragraph [
	^ self scrollPane paragraph 
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>position: aPoint [
	super position: aPoint.
	self manageLayout

	
]

{
	#category : #'rulers handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>removeAllRulers [
	[ self rulers notEmpty ] whileTrue: [ self withoutRuler: self rulers first ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>resetState [
	hasEditingConflicts := nil.
	hasUnacceptedEdits := nil.
	self changed
]

{
	#category : #'rulers handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>rulerNamed: aKey [
	^self rulers detect: [ :r | r key = aKey ] ifNone: [  ]
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>rulers [
	^ rulers 
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>scrollBounds [
	^ self scrollPane scrollBounds
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>scrollPane [
	^ scrollPane
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>scrollToBeginningOfLine [
	self scrollPane scrollToBeginningOfLine
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>scrollToBeginningOfText [
	self scrollPane scrollToBeginningOfText
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>scrollToEndOfLine [
	self scrollPane scrollToEndOfLine
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>scrollToEndOfText [
	self scrollPane scrollToEndOfText
]

{
	#category : #'accessing scrollbars',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>scrollbarsShowNever [
	self hScrollbarShowNever.
	self vScrollbarShowNever
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>scrollerExtentChanged [
	self manageLayout

]

{
	#category : #'accessing scrollbars',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>scrollerOffsetChanged [
	self rulers do: [:r | r scrollerOffsetChanged]
]

{
	#category : #'accessing segments',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>segments [
	^ self textArea segments

]

{
	#category : #'accessing segments',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>segmentsAtLine: aLineNumber [
	^ self textArea  segmentsAtLine: aLineNumber

]

{
	#category : #accessing-selection,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>selectAll [
	self selectFrom: 1 to: self text size 
]

{
	#category : #accessing-selection,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>selectFrom: firstIndex to: lastIndex [
	self selectionInterval: (firstIndex to: lastIndex)

]

{
	#category : #accessing-selection,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>selectionChanged [
	self rulers do: [ :r | r selectionChanged ].
	self setModelSelection: self selectionInterval

]

{
	#category : #accessing-selection,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>selectionInterval [
	^ self textArea selectionInterval
]

{
	#category : #accessing-selection,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>selectionInterval: anInterval [
	self setSelection: anInterval
]

{
	#category : #accessing-selection,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>setModelSelection: aSelectionInterval [
	"try to set the selection in the model"
	setSelectionSelector
		ifNotNil: [ self model perform: setSelectionSelector with: aSelectionInterval]
]

{
	#category : #accessing-selection,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>setSelection: aSelectionInterval [
	aSelectionInterval ifNil: [ ^ self ].
	self setTextAreaSelection: aSelectionInterval.
	self selectionChanged 
]

{
	#category : #'mock for spec',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>setText: aText [
	self updateTextWith: aText
]

{
	#category : #accessing-selection,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>setTextAreaSelection: aSelectionInterval [
	aSelectionInterval ifNil: [ ^ self ].
	self textArea selectFrom: aSelectionInterval first to: aSelectionInterval last.
	self scrollPane scrollSelectionIntoView
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>setTextSelector [
	^ setTextSelector ifNil: [  setTextSelector := #setText:from:]
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>setTextSelector: aSymbol  [
	setTextSelector  := aSymbol
]

{
	#category : #'acessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>setTextWith: stringOrText [
	"Accept new text contents with line breaks only as in the text.
	Fit my width and height to the result."
	self scrollPane setTextWith: stringOrText.
	self setSelection: self getSelectionFromModel.
	self resetState
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>shoutStyler [
	^ self textArea shoutStyler
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>sideRulers [
	^self rulers select: [ :r | r isSideRuler ]
]

{
	#category : #'acessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>tabWidth [
	^ self textArea tabWidth
]

{
	#category : #'acessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>tabWidth: anInteger [
	self textArea tabWidth: anInteger 
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>takeKeyboardFocus [
	self textArea takeKeyboardFocus
]

{
	#category : #'acessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>text [
	^ self textArea text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>textArea [
	^ self scrollPane ifNotNil: [:sp | sp textArea]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>textAreaClass [
	^ RubEditingArea
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>textAreaExtentChanged [
	self manageLayout

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>textChanged [
	self manageLayout.
	self autoAccept
		ifTrue: [ self acceptContents ]
		ifFalse: [ self hasUnacceptedEdits: true ].
	self rulers do: [ :r | r textChanged ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>textColor [
	^ self textArea textColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>textColor: aColor  [
	self textArea textColor: aColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>textFont: aFont [
	self textArea font: aFont
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>textMorph [
	^ self textArea
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>textSegmentIconsRuler [
	^ self rulerNamed: #textSegmentIcons
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>themeChanged [
	
	self color: self defaultColor.
	
	super themeChanged.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>unplug [
	self textArea ifNotNil: [ self textArea announcer unsubscribe: self ].
	self scrollPane
		ifNotNil: [ :scrollpane | 
			scrollpane announcer unsubscribe: self.
			scrollpane unplug ].
	super unplug
]

{
	#category : #'acessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>updateTextWith: stringOrText [
	"Accept new text contents with line breaks only as in the text.
	Fit my width and height to the result."

	self scrollPane updateTextWith: stringOrText.	
	"self setSelection: self getSelection."
	self resetState
]

{
	#category : #'accessing scrollbars',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>vScrollbarShowNever [
	self scrollPane vScrollbarShowNever
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>verticalRulers [
	^self rulers select: [ :r | r isVertical ]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenCancelEditRequested: anAnnouncement [
	self announcer announce: anAnnouncement.
	self cancel

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenCancelEditRequestedInModel: anAnnouncement [
	self announcer announce: anAnnouncement.
	self cancel

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenConfigurationChanged: anAnnouncement [
	anAnnouncement configurationBlock value: self

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenConfigurationChangedFromModel: anAnnouncement [
	self announcer announce: anAnnouncement

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenEditsStateChangedInModel: anAnnouncement [
	self announcer announce: anAnnouncement.
	self basicHasUnacceptedEdits: self model hasUnacceptedEdits.
	self changed

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenGotForcus: anAnnouncement [
	self announcer announce: anAnnouncement.
	self changed
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenKeystrokeInTextArea: anAnnouncement  [
	self announcer announce: (anAnnouncement copy morph: self)
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenLostFocus: anAnnouncement [
	self announcer announce: anAnnouncement.
	self changed
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenPrimarySelectionUpdatedInModel: anAnnouncement [
	self announcer announce: anAnnouncement.
	self setTextAreaSelection: self getSelectionFromModel.


]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenReturnEnteredInTextArea: anAnnouncement  [
	anAnnouncement morph: self.
	self announcer announce: anAnnouncement
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenTextAcceptRequest: anAnnouncement [
	self announcer announce: anAnnouncement.
	self acceptContents
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenTextAcceptedInModel: anAnnouncement [
	self announcer announce: anAnnouncement.
	self acceptContents

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenTextChangedInTextArea: anAnnouncement  [
	self announcer announce: anAnnouncement
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenTextSetInModel: anAnnouncement [
	self announcer announce: anAnnouncement.
	self scrollPane setTextWith: self getTextFromModel
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>whenTextUpdatedInModel: anAnnouncement [
	self announcer announce: anAnnouncement.
	self updateTextWith: self getTextFromModel

]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withAdornment [
	self withRulerNamed: #adornment
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withAnnotation [
	self withRulerNamed: #annotation
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withCodeSizeFeedback [
	self withRulerNamed: #codeSizeFeedback
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withColumns [
	self withRulerNamed: #column
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withCommentAnnotation [
	self withRulerNamed: #commentAnnotation
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withDecoratorNamed: aSymbol [
	self textArea withDecoratorNamed: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withFocusBorder [
	self scrollPane drawFocusBorder: true
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withGhostText: aText [
	self withRulerNamed: #ghostText.
	self ghostTextRuler updateTextWith: aText asText.
	self ghostTextRuler comeToFront
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withLineNumbers [
	self withRulerNamed: #lineNumbers
]

{
	#category : #'rulers handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withRuler: aRuler [
	(self hasRulerNamed: aRuler key)
		ifTrue: [ ^ self ].
	rulers add: aRuler.
	aRuler level >= 0 ifTrue: [self addMorphBack: aRuler].
	"Extra areas must be in the front "
	self extraAreas do: [ :r | self addMorphFront: r ].
	self manageLayout.
	" Finnally, the scrollPane must be in the front of all because text must be drawn last "
	self addMorphFront: self scrollPane.
	aRuler level < 0 ifTrue: [ self addMorphFront: aRuler ]
]

{
	#category : #'rulers handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withRulerNamed: aKey [
	"returns the ruler associated with the aKey. It can be in the receiver or in the extra hierarchy.
	aKey is a symbol i.e., #lineNumbers"
	(self hasRulerNamed: aKey)
		ifTrue: [ ^ self ].
	(self classOfRulerNamed: aKey)
		ifNotNil: [ :cls | self withRuler: cls new ]
]

{
	#category : #'rulers handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withRulersNamed: aCollection [
	"returns a collection of rulers as described by aCollection of keys. It can be in the receiver or in the extra hierarchy"
	aCollection do: [ :m | self withRulerNamed: m ]
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withSourceCodeAnnotation [
	self withRulerNamed: #SourceCodeAnnotation
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withTextSegmentIcons [
	self withRulerNamed: #textSegmentIcons

]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutAdornment [
	self withoutRulerNamed: #adornment
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutAnnotation [
	self withoutRulerNamed: #annotation
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutAnyDecorator [
	self textArea withoutAnyDecorator
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutCodeSizeFeedback [
	self withoutRulerNamed: #codeSizeFeedback
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutColumns [
	self withoutRulerNamed: #column
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutDecoratorNamed: aSymbol [
	self textArea withoutDecoratorNamed: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutFocusBorder [
	self scrollPane drawFocusBorder: false
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutGhostText [
	self withoutRulerNamed: #ghostText.

]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutLineNumbers [
	self withoutRulerNamed: #lineNumbers
]

{
	#category : #'rulers handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutRuler: aRuler [
	(self hasRuler: aRuler)
		ifFalse: [ ^ self ].
	rulers remove: aRuler.
	self removeMorph: aRuler.
	self manageLayout.
	self changed
]

{
	#category : #'rulers handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutRulerNamed: aKey [
	(self rulerNamed: aKey)
		ifNotNil: [ :m | self withoutRuler: m ].
	self changed
]

{
	#category : #'rulers handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutRulersNamed: aCollection [
	aCollection do: [ :m | self withoutRulerNamed: m ]
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutSelectionBar [
	self textArea withoutSelectionBar
]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutTextField [
	self withoutRulerNamed: #textField.

]

{
	#category : #'accessing rulers',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>withoutTextSegmentIcons [
	self withoutRulerNamed: #textSegmentIcons

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>wrapped [
	^ self scrollPane wrapped
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorph>>wrapped: aBoolean [
	self scrollPane wrapped: aBoolean
]
