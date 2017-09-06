"
I am a re-implementation of TextMorph. I'm intended as a temporary solution. Soon, I will be replaced by, or integrated with, TxText, a beautiful new text toolkit.

About the contextual menu
By default, the menu is given by the editingMode.
The model can implement a #menu method to impose a specific menu.
To change the way the menu is looked-up, one can also change the getMenuPolicy.
This menu retrieving algorithm is implemented by a dedicated objet, hold by the RubAbstractTextArea>>#getMenuPolicy instance variable. This dedicated object implements a #lookupMenu method for this.
By default, it is the textArea itself (see RubAbstractTextArea>>defaultGetMenuPolicy). 
The policy can be changed with RubAbstractTextArea>>#getMenuPolicy:, by passing whatever object that answer to #lookupMenu.

Instance Variables
	editingMode:		<Object>
	editingState:		<Object>
	editor:		<Object>
	hasFocus:		<Object>
	holder:		<Object>
	margins:		<Object>
	menuAllowed:		<Object>
	model:		<Object>
	paragraph:		<Object>
	readOnly:		<Object>
	scrollPivot:		<Object>
	text:		<Object>
	textColor:		<Object>
	textStyle:		<Object>
	wrapped:		<Object>

editingMode
	- xxxxx

editingState
	- xxxxx

editor
	- xxxxx

hasFocus
	- xxxxx

holder
	- xxxxx

margins
	- xxxxx

menuAllowed
	- xxxxx

model
	- xxxxx

paragraph
	- xxxxx

readOnly
	- xxxxx

scrollPivot
	- xxxxx

text
	- xxxxx

textColor
	- xxxxx

textStyle
	- xxxxx

wrapped
	- xxxxx



"
Class {
	#name : #RubAbstractTextArea,
	#superclass : #Morph,
	#instVars : [
		'model',
		'paragraph',
		'editor',
		'scrollPane',
		'editingState',
		'textStyle',
		'textColor',
		'margins',
		'readOnly',
		'menuAllowed',
		'editingMode',
		'cursor',
		'segments',
		'getMenuPolicy',
		'mouseDownPoint'
	],
	#classVars : [
		'BackgroundColor',
		'CaseSensitiveFinds',
		'DefaultTextColor',
		'HighlightMessageSend',
		'LineNumbersBackgroundColor',
		'LineNumbersFont',
		'LineNumbersTextColor',
		'WalkAlongDisplayedLine'
	],
	#category : #Rubric-Editing-Core,
	#timestamp : 'AlainPlantec 5/15/2015 10:44'
}

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>backgroundColor [
	^ BackgroundColor ifNil: [ BackgroundColor := Color white] 
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>backgroundColor: aColor [
	BackgroundColor := aColor
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>caseSensitiveFinds [
	^ CaseSensitiveFinds ifNil: [CaseSensitiveFinds := false] 
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>caseSensitiveFinds: aBoolean [
	CaseSensitiveFinds := aBoolean
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>defaultMaxExtent [

	"Return default large enough size of an infinite area. SmallInteger maxVal on 32-bit systems."
	
	^ 16r3FFFFFFF

]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>editorFont [
	^ StandardFonts defaultFont
]

{
	#category : #'shortcut examples',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>examplesOfEditorShortcutsOn: aBuilder [
	"No Keymap here, by default, the editor rely on a builtin keymapping engine (see TextEditor and SmallEditor)
	Here are some example on how to declare them if you want to setup different shortcuts
	
	<keymap>

	(aBuilder shortcut: #accept)
		category: #RubTextEditor
		default: $s ctrl win | $s ctrl unix | $s command mac
		do: [ :morph | morph acceptContents ]. 
		
	(aBuilder shortcut: #selectAll) 
		category: #RubTextEditor
		shortcut: $a ctrl win | $a ctrl unix | $a command mac
		do: [ :target | target handleKeymapEdition: [:editor | editor selectAll ] ].

	(aBuilder shortcut: #copySelection) 
		category: #RubTextEditor
		default: $c ctrl win | $c ctrl unix | $c command mac
		do: [ :target | target editor copySelection ].
		
	(aBuilder shortcut: #paste) 
		category: #RubTextEditor
		default: $v ctrl win | $v ctrl unix | $v command mac
		do: [ :target | target handleKeymapEdition: [:editor | editor paste]].
		
	(aBuilder shortcut: #cut) 
		category: #RubTextEditor
		default: $x ctrl win | $x ctrl unix | $x command mac
		do: [ :target :event | target handleKeymapEdition: [:editor | editor cut]  ].
				
	(aBuilder shortcut: #find) 
		category: #RubTextEditor
		default: $f ctrl win | $f ctrl unix | $f command mac
		do: [ :target | target find ].
		
	(aBuilder shortcut: #findAgain) 
		category: #RubTextEditor
		default: $g ctrl win | $g ctrl unix | $g command mac
		do: [ :target | target handleKeymapEdition: [:editor | editor findAgain ] ].
		
	(aBuilder shortcut: #exchange) 
		category: #RubTextEditor
		default: $e ctrl win | $e ctrl unix | $e command mac
		do: [ :target | target handleKeymapEdition: [:editor | editor exchange ] ].
		
	(aBuilder shortcut: #backWord)  
		category: #RubTextEditor
		default: $w ctrl win | $w ctrl unix | $w command mac
		do: [ :target |  target handleKeymapEdition: [:editor | editor backWord ] ].
		
	(aBuilder shortcut: #backWord) 
		category: #RubTextEditor
		default: Character backspace  asShortcut win | Character backspace asShortcut unix | Character backspace asShortcut mac
		do: [ :target :morph :event |  target handleKeymapEdition: [:editor | editor backspace: event ] ].
		
	(aBuilder shortcut: #(swapChars)) 
		category: #RubTextEditor
		default: $y ctrl win | $y ctrl unix | $y command mac
		do: [ :target |  target handleKeymapEdition: [:editor | editor swapChars ] ].

	(aBuilder shortcut: #setSearchString)
		category: #RubTextEditor
		default: $h ctrl win | $h ctrl unix | $h command mac
		do: [ :target | target editor setSearchString ].
		
	(aBuilder shortcut: #cancel) 
		category: #RubTextEditor
		default: $l ctrl win | $l ctrl unix | $l command mac
		do: [ :target | target editor cancel ].
		
	(aBuilder shortcut: #undo) 
		category: #RubTextEditor
		default: $z ctrl win | $z ctrl unix | $z command mac
		do: [ :target | target editor undo ].
		
	(aBuilder shortcut: #redo) 
		category: #RubTextEditor
		default: $j ctrl shift win | $j ctrl shift unix | $j command shift mac
		do: [ :target | target editor redo ].
	
	(aBuilder shortcut: #cursorHome)
		category: #RubTextEditor
		default: Character home ctrl win | Character home ctrl unix | Character home command mac
		do: [ :target :morph :event | target editor cursorHome: event ].
	
	(aBuilder shortcut: #cursorEnd)
		category: #RubTextEditor
		default: Character end ctrl win | Character end ctrl unix | Character end command mac
		do: [ :target :morph :event | target editor cursorEnd: event ].

	(aBuilder shortcut: #cursorHome)
		category: #RubTextEditor
		default: Character home asShortcut win | Character home asShortcut unix | Character home asShortcut mac
		do: [ :target :morph :event | target editor cursorHome: event ].
	
	(aBuilder shortcut: #cursorEnd)
		category: #RubTextEditor
		default: Character end asShortcut win | Character end asShortcut unix | Character end asShortcut mac
		do: [ :target :morph :event | target editor cursorEnd: event ].
	"
]

{
	#category : #'shortcut examples',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>examplesOfSmalltalkEditorShortcutsOn: aBuilder [
	"No Keymap here, by default, the editor rely on a builtin keymapping engine (see TextEditor and SmallEditor)
	Here are some example on how to declare them if you want to setup different shortcuts

	<keymap>
	(aBuilder shortcut: #browseIt)
		category: #RubSmalltalkEditor
		default: $b command mac | $b ctrl win | $b ctrl unix
		do: [ :morph | morph editor browseIt ].
					
	(aBuilder shortcut: #doIt) 
		category: #RubSmalltalkEditor
		default: $d command mac | $d ctrl win | $d ctrl unix
		do: [ :morph | morph doIt ].
			
	(aBuilder shortcut: #inspectIt) 
		category: #RubSmalltalkEditor
		default: $i command mac | $i ctrl win | $i ctrl unix
		do: [ :morph | morph inspectIt ].
		
	(aBuilder shortcut: #implementorsOfIt) 
		category: #RubSmalltalkEditor
		default: $m command mac | $m ctrl win | $m ctrl unix
		do: [ :morph | morph implementorsOfIt ].
		
	(aBuilder shortcut: #sendersOfIt)
		category: #RubSmalltalkEditor
		default: $n command mac | $n ctrl win | $n ctrl unix
		do: [ :morph | morph sendersOfIt ].
		
	(aBuilder shortcut: #printIt) 
		category: #RubSmalltalkEditor
		default: $p command mac | $p ctrl win | $p ctrl unix
		do: [ :morph | morph printIt ].
		"
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>highlightMessageSend [
	^ HighlightMessageSend ifNil: [ HighlightMessageSend := false ] 
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>highlightMessageSend: aBoolean [
	HighlightMessageSend := aBoolean
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>lineNumbersBackgroundColor [
	^ LineNumbersBackgroundColor ifNil: [ LineNumbersBackgroundColor := Smalltalk ui theme backgroundColor darker] 
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>lineNumbersBackgroundColor: aColor [
	 LineNumbersBackgroundColor := aColor
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>lineNumbersFont [
	^ LineNumbersFont ifNil: [ LineNumbersFont := TextStyle default fontOfPointSize: 7] 
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>lineNumbersFont: aFont [
	LineNumbersFont := aFont
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>lineNumbersTextColor [
	^ LineNumbersTextColor ifNil: [ LineNumbersTextColor := Smalltalk ui theme lineNumberColor ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>lineNumbersTextColor: aColor [
	LineNumbersTextColor := aColor
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>rubricSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #Rubric)
		label: 'Rubric editor';
		parent: #codeEditing;
		with: [ (aBuilder setting: #backgroundColor)
				target: self;
				description: 'The default editor background color';
				label: 'Background'.
			(aBuilder setting: #textColor)
				target: self;
				description: 'The default editor text color';
				label: 'Text color'.
			(aBuilder group: #LineNumbers)
				target: self;
				label: 'Line numbers';
				description: 'line numbers settings';
				with: [ (aBuilder setting: #lineNumbersFont)
						target: self;
						description: 'Font used for line numbers';
						label: 'Line numbers font'.
					(aBuilder setting: #lineNumbersTextColor)
						target: self;
						description: 'Color used for line numbers';
						label: 'Line numbers color'.
					(aBuilder setting: #lineNumbersBackgroundColor)
						target: self;
						description: 'Color used for line numbers background';
						label: 'Line numbers background color' ].
			(aBuilder setting: #highlightMessageSend)
				target: self;
				description: 'In a Smalltalk text editor, highlight message sends on mouse over with shift key pressed.';
				label: 'Highlight Message Send' ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>textColor [
	^ DefaultTextColor ifNil: [ DefaultTextColor := self theme textColor ]  
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>textColor: aColor [
	DefaultTextColor := aColor
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>walkAlongDisplayedLine [
	^ WalkAlongDisplayedLine ifNil: [WalkAlongDisplayedLine := true] 
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea class>>walkAlongDisplayedLine: aBoolean [
	WalkAlongDisplayedLine := aBoolean
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>aboutToBeGrabbedBy: aHand [
	self grabbedAllowed
		ifTrue: [ ^ super aboutToBeGrabbedBy: aHand ].
	^ nil
]

{
	#category : #'accessing editor',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>acceptAllowed [

	^ editingMode acceptAllowed
]

{
	#category : #editing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>acceptContents [
	"The message is sent when the user hits enter or Cmd-S.
	Accept the current contents and endediting"
	self editingMode acceptAllowed ifFalse: [ ^self ].
	self announce: (RubTextAcceptRequest morph: self).
	self changed
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>acceptDroppingMorph: aMorph event: evt [
	"This message is sent when a morph is dropped onto me."
	self addMorphFront: aMorph fromWorldPosition: aMorph position.
		"Make a TextAnchor and install it in a run."
]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>addAttribute: anAttribute [
	self text addAttribute: anAttribute 
]

{
	#category : #'accessing cursor',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>addCursor [
	self cursor ifNil: [ self addMorph: (cursor := self newCursor) ]
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>addPrimarySelection [
	self addMorph: self newPrimarySelection.

]

{
	#category : #'accessing segments',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>addSegment: aRubTextSegmentMorph [
	| seg |
	seg := aRubTextSegmentMorph inTextArea: self.
	self segments add: seg.
	self addMorphBack: seg.
	^ seg

]

{
	#category : #'public accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>allowMenu [
	self menuAllowed: true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>announce: anAnnouncement  [
	self announcer announce: anAnnouncement 
]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>appendText: aStringOrText [
	self
		handleEdit:
			[ self
				beEditableWhile:
					[ self selectInvisiblyFrom: self text size + 1 to: self text size.
					self editor replaceSelectionWith: aStringOrText.
					self selectInvisiblyFrom: self text size + 1 to: self text size ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>backgroundColor [
	^ self color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>backgroundColor: newColor [
	self color: newColor
]

{
	#category : #'public accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>beEditable [
	self readOnly
		ifTrue: [ self readOnly: false ]
]

{
	#category : #'public accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>beEditableWhile: aBlock [
	| wasEditable |
	wasEditable := self readOnly.
	self readOnly: false.
	aBlock ensure: [ self readOnly:  wasEditable]

]

{
	#category : #'public accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>beReadOnly [
	self readOnly
		ifFalse: [ self readOnly: true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>borderWidth: newWidth [
	"No border allowed"
	super borderWidth: 0
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>bounds [
	^ super bounds ifNil: [ self defaultBounds ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>canChangeText [
	^ self enabled and: [ self readOnly not ]
]

{
	#category : #editing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>cancelEdits [
	"The message is sent when the user hits enter or Cmd-L.
	Cancel the current contents and end editing.
	This default implementation does nothing."
	self announce: (RubCancelEditRequested morph: self)

]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>caseSensitiveFinds [
	^ self class caseSensitiveFinds
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>classOfDecoratorNamed: aKey [
	^ RubParagraphDecorator classOfDecoratorNamed: aKey
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>click: anEvent [
	self
		handleEdit: [ 
			self editor click: anEvent.
			self scrollSelectionIntoView: nil ]
]

{
	#category : #'accessing editor',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>closingDelimiters [
	^ self editor closingDelimiters

]

{
	#category : #composing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>compose [

	self prepareParagraphToCompose.
	self paragraph compose 
]

{
	#category : #composing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>compositionRectangle [
	^ scrollPane ifNil: [ self innerBounds ] ifNotNil: [ self innerBounds topLeft extent: scrollPane scrollBounds extent ]
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>copy [
	^ super copy
		text: self text copy
		textStyle: textStyle copy
		color: color
		textColor: textColor 
]

{
	#category : #'interactive error protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>correctFrom: start to: stop with: aString [
	self editor correctFrom: start to: stop with: aString
]

{
	#category : #'accessing cursor',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>cursor [
	^ cursor

]

{
	#category : #'accessing cursor',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>cursorClass [
	^ RubCursor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>cursorWidth [
	^ self cursorClass defaultWidth 
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>decoratorNamed: aKey [
	^self paragraph decoratorNamed: aKey
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>defaultBounds  [
	^ super defaultBounds topLeft corner: self minimumExtent
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>defaultColor [
	"answer the default color/fill style for the receiver"
	^ self class backgroundColor
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>defaultGetMenuPolicy [
	^ self
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>defaultMargins [
	^ 6 @ 6 corner: 6 @ 6
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>defaultMenuAllowed [
	^ true
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>defaultReadOnly [

	^ false
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>defaultTextColor [
	"answer the default color/fill style for the receiver"
	^ self class textColor
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>defaultTextStyle [
	| ts f |
	f := self class editorFont.
	ts := f textStyle copy ifNil: [ TextStyle fontArray: { f } ].
	ts defaultFontIndex: (ts fontIndexOf: f).
	^ ts
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>defaultYellowButtonMenuEnabled [
	^ self defaultMenuAllowed 
]

{
	#category : #submorphs-add/remove,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>delete [
	self hasFocus
		ifTrue: [ self currentHand newKeyboardFocus: nil ].
	super delete
]

{
	#category : #'interactive error protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>deselect [
	self selectFrom: 1 to: 0
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>doubleClick: anEvent [
	^ self handleEdit: [ self editor doubleClick: anEvent ]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>drawSubmorphsOn: aCanvas [
	"Draw the focus here since we are using inset bounds
	for the focus rectangle."

	super drawSubmorphsOn: aCanvas.
	aCanvas rubParagraph: self paragraph bounds: self drawingBounds color: self textColor.
	(scrollPane isNil and: [ self readOnly not and: [ self hasKeyboardFocus or: [ self hasFindReplaceFocus ] ] ])
		ifTrue: [self drawKeyboardFocusOn: aCanvas ]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>drawSubmorphsOnAthensCanvas: aCanvas [
	"Draw the focus here since we are using inset bounds
	for the focus rectangle."

	super drawSubmorphsOnAthensCanvas: aCanvas.
	self paragraph drawOnAthensCanvas: aCanvas bounds: self drawingBounds color: self textColor.
	(scrollPane isNil and: [ self readOnly not and: [ self hasKeyboardFocus or: [ self hasFindReplaceFocus ] ] ])
		ifTrue: [  self drawKeyboardFocusOnAthensCanvas: aCanvas ]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>drawingBounds [
	^ (self scrollPane isNil or: [ self wrapped ])
		ifTrue: [self innerBounds]
		ifFalse: [ self innerBounds topLeft extent: self class defaultMaxExtent @ self class defaultMaxExtent ]
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>editPrimarySelectionSeparately [
	| view |
	view := self primarySelection readWriteView.
	(view embeddedInMorphicWindowLabeled: 'Selection editing') openInHand.
]

{
	#category : #'accessing editing mode',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>editingMode [
	^ editingMode
		ifNil: [ 
			self editingMode: RubPlainTextMode new.
			editingMode ]
]

{
	#category : #'accessing editing mode',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>editingMode: anEditingMode [
	editingMode unplug.
	editingMode := anEditingMode.
	editingMode plugin: self.
 
]

{
	#category : #'accessing editing state',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>editingState [
	^ editingState ifNil: [editingState := self newEditingState]
]

{
	#category : #'accessing editing state',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>editingStateClass [
	^ RubEditingState
]

{
	#category : #'accessing editor',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>editor [
	"Return my current editor, or install a new one."
	^ editor ifNil: [ editor := self newEditor ]
]

{
	#category : #'accessing editor',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>editorClass [
	"Answer the class used to create the receiver's editor"

	^ RubTextEditor
]

{
	#category : #'accessing editing state',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>emphasisHere [
	^ self editingState emphasisHere

]

{
	#category : #'accessing editing state',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>emphasisHere: aListOfAttributes [
	self editingState emphasisHere: aListOfAttributes

]

{
	#category : #'mock for spec',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>enabled: aBoolean [

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>escapePressed [
	"do nothing. do not simulate a right click
	because Esc is too useful as a shortcut for other purposes
	to be used for popping a menu"
	"^ self yellowButtonActivity: false"

]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>extent: aPoint [
	self
		handleBoundsChange: [ 
			self wrapped
				ifTrue: [ 
					(bounds notNil and: [ bounds width = aPoint x ])
						ifTrue: [ ^ self ].
					super extent: ((self paragraph withoutDecorator extentFromClientBottomRight: aPoint) max: self minimumExtent).
					self recomputeSelection ] ]
]

{
	#category : #find-replace,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>findAndSelect: aRegex startingAt: anIndex searchBackwards: searchBackwards [
	| where |
	self
		handleEdit: [
			where := self editor
				findAndSelect: aRegex
				startingAt: anIndex
				searchBackwards: searchBackwards.
			self scrollSelectionIntoView: nil].
	^ where
]

{
	#category : #find-replace,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>findNextString: aSubstring startingAt: searchIdx [
	| where |
	self
		handleEdit: [where := self editor findNextString: aSubstring startingAt: searchIdx].
	^ where

]

{
	#category : #find-replace,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>findRegex [
	^ self editor findRegex
]

{
	#category : #find-replace,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>findText [
	^ self editor findText
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>focusChanged  [
	super focusChanged.
	self editor focusChanged.
	self changed.

	

]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>font [
	"Answer the probable font"
	^ self textStyle fonts at: self textStyle defaultFontIndex

]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>font: aFont [
	| newTextStyle |
	newTextStyle := aFont textStyle copy ifNil: [ TextStyle fontArray: { aFont } ].
	newTextStyle defaultFontIndex: (newTextStyle fontIndexOf: aFont).
	self textStyle: newTextStyle

]

{
	#category : #'public accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>forbidMenu [
	self menuAllowed: false
]

{
	#category : #composing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>forceCompose [

	self prepareParagraphToCompose.
	self paragraph forceCompose 
]

{
	#category : #'accessing cursor',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>forceCursorVisibleWhile: aBlock [
	self cursor
		ifNotNil: [ :cur | 
			| prev |
			prev := cur stayVisible.
			cur stayVisible: true.
			aBlock
				ensure: [ cur stayVisible: prev ] ]
]

{
	#category : #'paragraph feedbacks',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>forceExtentTo: aPoint [
	super extent: aPoint
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>getMenu: shiftKeyState [
	"Ask the getMenuPolicy to lookup the menu to popup if any"

	^ shiftKeyState
		ifTrue: [ self getMenuPolicy lookupShiftMenu ]
		ifFalse: [ self getMenuPolicy lookupMenu ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>getMenuPolicy [
	^ getMenuPolicy ifNil: [ getMenuPolicy := self defaultGetMenuPolicy ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>getMenuPolicy: aGetMenuPolicy [
	getMenuPolicy := aGetMenuPolicy
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>grabbedAllowed [
	^ scrollPane isNil
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>handleBoundsChange: aBlock [
	| oldBounds |
	oldBounds := self bounds copy.
	aBlock value.
	oldBounds topLeft ~= self bounds topLeft
		ifTrue: [ self announce: ((RubPositionChanged morph: self) previousBounds: oldBounds)].
	oldBounds extent ~= self bounds extent
		ifTrue: [ 
			self scrollPane ifNotNil: [ :sp | sp textAreaExtentChanged ].
			self announce: ((RubExtentChanged morph: self) previousBounds: oldBounds) ].

]

{
	#category : #editing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>handleEdit: editBlock [
	"Ensure that changed areas get suitably redrawn"
	editBlock value.
	self selectionChanged.  "Note new selection"

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>handleKeystroke: anEvent  [
	"System level event handling."

	anEvent wasHandled
		ifTrue: [^ self].
	self allowsKeymapping
		ifTrue: [ self dispatchKeystrokeForEvent: anEvent ] .
	anEvent wasHandled
		ifTrue: [
			"We need to check for completion here because otherwise it will try to handle the keystroke, 
			even if it was already processed."
			(Smalltalk tools hasToolNamed: #codeCompletion) 
				ifTrue: [ Smalltalk tools codeCompletion uniqueInstance closeMenu ].
			^ self].
	(self handlesKeyStroke: anEvent)
		ifFalse: [^ self].
	self keyStroke: anEvent.
	anEvent wasHandled: true.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>handleMouseMove: anEvent [
	"Re-implemented to allow for mouse-up move events"

	anEvent wasHandled
		ifTrue: [ ^ self ].	"not interested"
	anEvent hand hasSubmorphs
		ifTrue: [ ^ self ].
	anEvent wasHandled: true.
	self mouseMove: anEvent.
	(anEvent anyButtonPressed and: [ anEvent hand mouseFocus == self ])
		ifFalse: [ ^ self ].
	super handleMouseMove: anEvent
	
]

{
	#category : #composing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>handleParagraphChange: aBlock [
	aBlock value.
	self compose.
	self changed
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>handleReturnKey [
	| answer |
	answer := RubReturnEntered morph: self.
	self announce: answer.
	answer accepted
		ifTrue: [ self editor textWasAccepted ].
	^ answer accepted
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>handleSelectionChange: aBlock [
	| prevMarkBlock prevPointBlock |
	self flag: 'hack here because text segments are not well designed regarding text editing'.
	self primarySelection ifNil: [ self addPrimarySelection  ].
	prevMarkBlock := self markBlock.
	prevPointBlock := self pointBlock.
	aBlock value.
	(prevMarkBlock ~= self markBlock or: [ prevPointBlock ~= self pointBlock ])
		ifTrue: [ 
			"have to invalidate the full surface because of the selection"
			self invalidRect: (self expandFullBoundsForDropShadow: self drawingBounds).
			self scrollPane ifNotNil: [ :sp | sp selectionChanged ].
			self announce: (RubSelectionChanged from: self previousMarkBlock: prevMarkBlock previousPointBlock: prevPointBlock) ] 
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>handlesKeyboard: evt [
	^true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>handlesMouseDown: evt [
	^ self innerBounds containsPoint: evt cursorPoint
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>handlesMouseOver: evt  [
	"Do I want to receive mouseEnter: and mouseLeave: when the button is up and the hand is empty?"
	^ self enabled
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>hasDecorator: aDecorator [
	^ self paragraph hasDecorator: aDecorator
	
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>hasDecoratorNamed: aKey [
	^ self paragraph hasDecoratorNamed: aKey
	
]

{
	#category : #find-replace,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>hasFindReplaceFocus [
	^ RubFindReplaceService default dialogIsActiveFor: self
]

{
	#category : #'accessing editing state',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>hasFocus [
	^ ( editingState ifNil: [^ false ] ) hasFocus
]

{
	#category : #'accessing editing state',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>hasFocus: aBoolean [
	^ self editingState hasFocus: aBoolean 
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>hasSelection [
	^ self editor hasSelection 
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>hideOverEditableTextCursor   [
	self currentHand showTemporaryCursor: nil
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>highlightMessageSend [
	^ self class highlightMessageSend
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>initialize [
	super initialize.
	self compose.
	self addCursor.
	self plugFindReplace.
	DefaultTextColor := self theme textColor
]

{
	#category : #keymapping,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>initializeShortcuts: aKMDispatcher [
	"we delegate the creation of default shortcuts to the editor
	because it is the one that knows more details about the goal of editing"
	super initializeShortcuts: aKMDispatcher.
	self editor initializeShortcuts: aKMDispatcher
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>interactive [
	^ self editingMode interactive
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>isReadOnly [
	^ self readOnly
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>keyStroke: anEvent [
	"Handle a keystroke event."
	anEvent keyCharacter = Character cr
		ifTrue: [ self handleReturnKey ifTrue: [ ^ self ] ].
	anEvent hand anyButtonPressed ifTrue: [ ^self ].
	self scrollPane ifNotNil: [ :sp | (sp scrollByKeyboard: anEvent) ifTrue: [^self] ].
	anEvent isUserInterrupt ifTrue: [^self].
	self handleEdit: [ self editor keystroke: anEvent ].
	self scrollSelectionIntoView: nil
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>keyboardFocusChange: aBoolean [
	aBoolean
		ifTrue: [
			self hasFocus: true.
			self showOverEditableTextCursor ]
		ifFalse: [ 
			self hasFocus: false.
			self hideOverEditableTextCursor ].
	super keyboardFocusChange: aBoolean.
	self focusChanged.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>lineNumbersBackgroundColor [
	^ self class lineNumbersBackgroundColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>lineNumbersTextColor [
	^ self class lineNumbersTextColor 

]

{
	#category : #'accessing paragraph',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>lines [
	^ self paragraph lines
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>lookupMenu [
	"default implementation of the algorithm that lookup the menu"

	^ self model 
		ifNil: [ self editingMode menu ] 
		ifNotNil: [ :m | m menu ifNil: [ self editingMode menu ] ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>lookupShiftMenu [
	"default implementation of the algorithm that lookup the menu"

	| default |
	default := [ self editingMode shiftMenu ].
	^ self model 
		ifNil: [ default value ] 
		ifNotNil: [ :m | m shiftMenu ifNil: [ default value ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>margins [
	^  margins ifNil: [margins := self defaultMargins ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>margins: aRectangle [
	margins := aRectangle withRight: (aRectangle right max: self cursorWidth ).

]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>markBlock [
	^ self editingState markBlock
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>markBlock: aCharacterBlock [
	self handleSelectionChange: [ self editingState markBlock:  aCharacterBlock]
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>markBlock: markCharacterBlock pointBlock: pointCharacterBlock [
	self handleSelectionChange: [ self editingState markBlock: markCharacterBlock pointBlock: pointCharacterBlock ]
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>markIndex [
	^ self editingState markIndex

]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>markIndex: markIndex pointIndex: pointIndex [
	self handleSelectionChange: [ self editingState markIndex: markIndex pointIndex: pointIndex ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>menuAllowed [
	^ menuAllowed ifNil: [ menuAllowed := self defaultMenuAllowed  ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>menuAllowed: aBoolean [
	menuAllowed := aBoolean
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>minExtent [
	| minH |
	minH := scrollPane ifNil: [ 0 ] ifNotNil: [ 60 ].
	^ ((self textStyle defaultFont widthOfString: 'XXX') + self margins left + self margins right)
		@ (self textStyle lineGrid + self margins top + self margins bottom)
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>minimumExtent [
	^ self minExtent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>model  [
	^model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>model: aModel [
	model := aModel
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>modifySelection: aCharacterBlock [
	"the aCharacterBlock becomes always the new point block. Whether the old point block or
	the old mark block becomes the new mark block, depends on the distance. If the new character block
	is near the old point block, we leave the old mark block unchaned."

	(self pointBlock distance: aCharacterBlock) < (self markBlock distance: aCharacterBlock)
		ifTrue: [ self pointBlock: aCharacterBlock ]
		ifFalse: [ self markBlock: self pointBlock pointBlock: aCharacterBlock ]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>mouseDown: evt [
	"Make this TextMorph be the keyboard input focus, if it isn't  
	already, and repond to the text selection gesture.
	Changed to not take keyboard focus if an owner is a
	PluggableTextMorph that doesn't want focus."

	(evt yellowButtonPressed and: [ evt commandKeyPressed not ])
		ifTrue: [ ^ self yellowButtonActivity: evt shiftPressed ].	"First check for option (menu) click"
	(self paragraph click: evt for: self model controller: self)
		ifTrue: [ self click: evt.
			evt hand releaseKeyboardFocus: self.
			^ self ].
	(evt yellowButtonChanged or: [ evt commandKeyPressed ])
		ifTrue: [ (self yellowButtonActivity: evt shiftPressed)
				ifTrue: [ ^ self ] ].
	"no matter what, if shift is pressed extend the selection"
	evt shiftPressed
		ifTrue: [ ^ self mouseMove: evt ].
	mouseDownPoint := evt cursorPoint.
	(self hasFocus or: [ self editor hasSelection not ])
		ifTrue:
			[ | selectors |
			self scrollPivot: evt hand position.
			selectors := Array
				with: #click:
				with: #doubleClick:
				with: nil
				with: nil.
			evt hand
				waitForClicksOrDrag: self
				event: evt
				selectors: selectors
				threshold: 5 ].
	self hasKeyboardFocus
		ifFalse: [ self takeKeyboardFocus ]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>mouseEnter: evt [
	"Handle a mouseEnter event, meaning the mouse just entered my bounds with no button pressed."
	super mouseEnter: evt.
	self showOverEditableTextCursor
	
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>mouseLeave: evt [
	"Handle a mouseLeave event, meaning the mouse just left my bounds with no button pressed."
	super mouseLeave: evt.
	self hideOverEditableTextCursor
	
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>mouseMove: evt [
   self paragraph move: evt for: model controller: self editor.
	evt redButtonPressed
		ifFalse: [ ^ self ].
	evt shiftPressed
		ifTrue: [ self modifySelection: (self paragraph characterBlockAtPoint: evt cursorPoint) ]
		ifFalse: [ mouseDownPoint
				ifNotNil: [ self markBlock: (self paragraph characterBlockAtPoint: mouseDownPoint) pointBlock: (self paragraph characterBlockAtPoint: evt cursorPoint) ]
				ifNil: [ self markBlock: (self paragraph characterBlockAtPoint: evt cursorPoint) ] ].
	self editor storeSelectionInText.

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>mouseUp: evt [
	self scrollPivot: nil.
	(self boundsInWorld containsPoint: self currentHand position)
		ifFalse: [ self hideOverEditableTextCursor ].
	mouseDownPoint := nil
]

{
	#category : #'accessing cursor',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>newCursor [
	^ self cursorClass new
]

{
	#category : #'accessing editing state',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>newEditingState [
	^ self editingStateClass new textArea: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>newEditor [
	"Return my current editor, or install a new one."
	^ self editorClass forTextArea: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>newParagraph [
	| newParagraph |
	newParagraph := RubOpeningClosingDelimiterDecorator next: RubParagraph new.
	newParagraph textArea: self.
	newParagraph container: self compositionRectangle.
	^ newParagraph
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>newPrimarySelection [
	^ RubPrimarySelectionMorph inTextArea: self from: self markIndex to: self pointIndex.

]

{
	#category : #'interactive error protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>nextTokenFrom: start direction: dir [
	^ self editor nextTokenFrom: start direction: dir
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>notificationStrategy: aStrategy [
	self editor notificationStrategy: aStrategy
]

{
	#category : #'interactive error protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>notify: aString at: anInteger in: aStream [
	^ self editor notify: aString at: anInteger in: aStream
]

{
	#category : #composing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>offset [
	^ scrollPane
		ifNil: [ 0@0 ]
		ifNotNil: [ :h | scrollPane offset ]
]

{
	#category : #find-replace,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>openFindDialog [
	self sharesFindReplace 
		ifTrue: [ self announce: RubFindReplaceWindowRequired ]
		ifFalse: [self flash]
]

{
	#category : #'accessing editor',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>openingDelimiters [
	^ self editor openingDelimiters

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>paragraph [
	"Paragraph instantiation is lazy -- create it only when needed"

	paragraph
		ifNil: [
			paragraph := self newParagraph.
			self compose.
			self selectAll].
	^ paragraph 
]

{
	#category : #'paragraph feedbacks',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>paragraphReplacedTextFrom: start to: stop with: aText [
	"A text change has taken place in my paragraph, as a result of editing and I must be updated"
	self
		handleBoundsChange: [ 
			self wrapped
				ifTrue: [ self updateBottomFromParagraph ]
				ifFalse: [ self updateExtentFromParagraph ] ].
	self scrollPane ifNotNil: [ :sp | sp textChanged ].
	self announce: (RubTextChanged from: start to: stop with: aText).

]

{
	#category : #'paragraph feedbacks',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>paragraphWasComposedFrom: startIndex to: stopIndex [
	self
		handleBoundsChange: [ 
			self wrapped
				ifTrue: [ self updateBottomFromParagraph ]
				ifFalse: [ self updateExtentFromParagraph ] ]
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>plugFindReplace [
	self announcer 
		when:  MorphGotFocus send: #whenTextAreaGotFocus: to: RubFindReplaceService default;
	 	when:  MorphLostFocus send: #whenTextAreaLostFocus: to: RubFindReplaceService default;	
		when:  RubSelectionChanged send: #whenTextAreaSelectionChanged: to: RubFindReplaceService default
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>pointBlock [
	^ self editingState pointBlock
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>pointBlock: aCharacterBlock [
	self handleSelectionChange: [ self editingState pointBlock: aCharacterBlock ]
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>pointIndex [
	^ self editingState pointIndex
]

{
	#category : #composing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>prepareParagraphToCompose [
	self paragraph container: self compositionRectangle.

]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>primarySelection [
	^ self submorphThat: [ :sm | sm isKindOf: RubPrimarySelectionMorph ] ifNone:  [ ]

]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>primarySelectionBounds [
	^ self primarySelection bounds
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>primarySelectionColor [
	^ self primarySelection ifNil: [ Color transparent] ifNotNil: [:ps | ps color ]
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>privateMoveBy: delta [
	self
		handleBoundsChange: [ 
			self paragraph moveBy: delta truncated.
			super privateMoveBy: delta truncated ]
]

{
	#category : #editing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>privateReplaceFrom: start to: stop with: aText [
	self paragraph replaceFrom: start to: stop with: aText.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>privateSetParagraph: aParagraph [
	paragraph := aParagraph
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>privateSetTextStyle: aTextStyle [
	textStyle := aTextStyle
]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>privateText: stringOrText [
	"Accept new text contents."

	| fontNumber |
	stringOrText isText
		ifTrue: [ self paragraph text: stringOrText ]
		ifFalse: [ 
			fontNumber := self textStyle defaultFontIndex.
			self paragraph text: (Text string: stringOrText asString attributes: {(TextFontChange fontNumber: fontNumber)}) ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>privateTextStyle: aTextStyle [
	textStyle := aTextStyle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>readOnly [
	^readOnly ifNil: [ readOnly := self defaultReadOnly ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>readOnly: aBoolean [
	 readOnly := aBoolean
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>recomputeSelection [
	"The same characters are selected but their coordinates may have changed.
	Redetermine the selection according to the start and stop block indices; 
	do not highlight."

	self markIndex: self markIndex pointIndex: self pointIndex
]

{
	#category : #'multi level undo',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>redoTypeIn: aText interval: anInterval  [
	self handleEdit: [self editor redoTypeIn: aText interval: anInterval]
]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>releaseCachedState [
	super releaseCachedState.
	self releaseParagraph
]

{
	#category : #'accessing editing state',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>releaseEditingState [
	editingState ifNotNil: [ 
		editingState unplug.
		editingState := nil]
]

{
	#category : #'accessing editor',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>releaseEditor [
	"Release the editor for my paragraph."

	editor
		ifNotNil: [ 
			editor unplug.
			editor := nil ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>releaseParagraph [
	paragraph
		ifNotNil: [ 
			self withoutAnyDecorator.
			paragraph unplug.
			paragraph := nil ].

]

{
	#category : #'accessing cursor',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>removeCursor [
	self cursor ifNotNil: [ :c | 
		self cursor aboutToBeRemoved.
		self removeMorph: c ].
	cursor := nil
]

{
	#category : #'accessing segments',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>removeSegment: aRubTextSegmentMorph [
	self announcer unsubscribe: aRubTextSegmentMorph.
	self segments remove: aRubTextSegmentMorph ifAbsent: [].

]

{
	#category : #find-replace,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>replaceAll: aRegex with: aText [
	self
		handleEdit: [self editor replaceAll: aRegex with: aText].

]

{
	#category : #find-replace,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>replaceAll: aRegex with: aText startingAt: startIdx [
	self
		handleEdit: [self editor replaceAll: aRegex with: aText startingAt: startIdx].

]

{
	#category : #editing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>replaceFrom: start to: stop with: aText [
	self
		handleEdit: [ self editor replaceTextFrom: start to: stop with: aText ]

]

{
	#category : #find-replace,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>replaceSelectionWith: aText [
	self
		handleEdit: [self editor replaceSelectionWith: aText]
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>resistsRemoval [
	^ self grabbedAllowed not
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>restoreSelectionIndexesAfter: aBlock [
	| prevStart prevStop |
	prevStart := self markIndex min: self pointIndex.
	prevStop := self pointIndex max: self markIndex.
	aBlock value.
	self selectFrom: prevStart to: prevStop - 1
]

{
	#category : #composing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>scrollBounds [
	^ scrollPane
		ifNil: [ self innerBounds  ]
		ifNotNil: [ :h | scrollPane scrollBounds ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>scrollPane [
	^ scrollPane
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>scrollPane: aScrollPane [
	scrollPane := aScrollPane.
	self color: Color transparent
]

{
	#category : #'accessing editing state',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>scrollPivot [
	^self editingState scrollPivot
]

{
	#category : #'accessing editing state',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>scrollPivot: aPoint [
	^self editingState scrollPivot: aPoint
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>scrollSelectionIntoView: evt  [
	scrollPane ifNotNil: [ scrollPane scrollSelectionIntoView: evt ]	

]

{
	#category : #'accessing segments',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>segments [
	^ segments ifNil: [ segments := OrderedCollection new ]

]

{
	#category : #'accessing segments',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>segmentsAtLine: aLineNumber [
	^ self segments select: [ :s | s firstLineIndex = aLineNumber ]
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>select [
	self editor select
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>selectAll [
	self editor selectAll
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>selectFrom: a to: b [
	self editor selectFrom: a to: b
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>selectInvisiblyFrom: start to: stop [
	self editor selectInvisiblyFrom: start to: stop
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>selection [
	^ self editor selection
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>selectionChanged [
	"Invalidate all the selection rectangles. 
	Make sure that any drop shadow is accounted for too."
	paragraph ifNil: [ ^ self ].
	self recomputeSelection.

]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>selectionInterval [
	^self editor selectionInterval 
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>selectionRects [
	^ Array
		streamContents: [ :strm | 
			strm nextPutAll: self paragraph selectionRects.
			self cursor ifNotNil: [ strm nextPut: self cursor bounds ] ]
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>selectionStart [
	^ self editingState selectionStart
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>selectionStop [
	^ self editingState selectionStop
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>setEmphasisHere [
	self editor setEmphasisHere
]

{
	#category : #'public accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>setTextWith: stringOrText [
	"Accept new text contents."

	self handleParagraphChange: [self privateText: stringOrText]
]

{
	#category : #find-replace,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>sharesFindReplace [
	^ true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>showOverEditableTextCursor [
	| o |
	owner isNil
		ifTrue: [^ self].
	o := owner isWorldMorph 
		ifTrue: [self] 
		ifFalse: [owner].
	(o boundsInWorld containsPoint: self currentHand position)
		ifTrue: [self currentHand showTemporaryCursor: (self theme overTextCursorFor: self)]

]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>startIndex [
	^ self selectionStart stringIndex
]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>stopIndex [
	^ self selectionStop stringIndex
]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>string [
	"obtain a string value from the receiver"

	^ self text string
]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>tabWidth [
	^ self paragraph tabWidth
]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>tabWidth: anInteger [
	self paragraph tabWidth: anInteger
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>takeKeyboardFocus [
	"Answer whether the receiver can normally take keyboard focus."
	self takesKeyboardFocus ifFalse: [ ^self ].
	^ super takeKeyboardFocus 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>takesKeyboardFocus [
	"Answer whether the receiver can normally take keyboard focus."

	^true
]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>text [
	^ self paragraph text
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>text: t textStyle: s color: c textColor: tc [
	"Private -- for use only in morphic duplication"	
	self releaseParagraph.
	super text: t textStyle: s color: c textColor: tc.

]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>textColor [
	^ textColor ifNil: [ textColor := self defaultTextColor ]
]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>textColor: newColor [
	textColor = newColor ifTrue: [^ self].
	textColor := newColor.
	self addAttribute: (TextColor color: newColor).
	self changed.
]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>textFont: aFont [
	self addAttribute: (TextFontReference toFont: aFont).
	self paragraph compose.
	self recomputeSelection.
	self  announce: (RubTextStyleChanged morph: self).

]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>textStyle [
	^textStyle ifNil: [ textStyle := self defaultTextStyle  ]
]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>textStyle: aTextStyle [
	self privateTextStyle: aTextStyle.
	self addAttribute: (TextFontChange fontNumber: (textStyle defaultFontIndex)).
	self paragraph compose.
	self recomputeSelection.
	self  announce: (RubTextStyleChanged morph: self).

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>themeChanged [
	
	(self decoratorNamed: #shoutStyler) ifNotNil: [ :styler | 
		styler refreshStyling 
	].

	super themeChanged
]

{
	#category : #structure,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>topRendererOrSelf [

	^ scrollPane 
		ifNil: [ super topRendererOrSelf ]
		ifNotNil: [ scrollPane topRendererOrSelf ]
]

{
	#category : #'multi level undo',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>undoRedoExchange: aninterval with: anotherInterval [
	self handleEdit: [self editor undoRedoExchange: aninterval with: anotherInterval]
]

{
	#category : #'multi level undo',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>undoTypeIn: aText interval: anInterval  [
	self handleEdit: [self editor undoTypeIn: aText interval: anInterval]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>unplug [
	self unplugFindReplace.
	self releaseEditingState.
	self releaseParagraph.
	self releaseEditor.
	super unplug
	
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>unplugFindReplace [
	self announcer unsubscribe: RubFindReplaceService default

]

{
	#category : #'accessing selection',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>unselect [
	self handleSelectionChange: [ self editingState unselect ]
]

{
	#category : #'paragraph feedbacks',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>updateBottomFromParagraph [
	paragraph
		ifNotNil: [ 
			| newExtent |
			newExtent := self paragraph extent max: self paragraph minimumExtent.
			self forceExtentTo: self extent x @ newExtent y]
]

{
	#category : #'paragraph feedbacks',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>updateExtentFromParagraph [
	(paragraph notNil and: [ bounds notNil ])
		ifTrue: [ 
			| newExtent |
			newExtent := self paragraph extent max: self minimumExtent.
			self forceExtentTo: (newExtent x + self margins right) @ newExtent y]
]

{
	#category : #'public accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>updateMarginsWith: aRectangle [
	self handleParagraphChange: [self margins: aRectangle ]
]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>updateTextWith: aStringOrText [
	self
		handleEdit: [ 
			self
				beEditableWhile: [ 
					aStringOrText = self text
						ifFalse: [ 
							self selectAll.							
							self editor replaceSelectionWith: aStringOrText.
							self deselect ] ] ]
]

{
	#category : #'accessing text',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>userString [
	"Do I have a text string to be searched on?"

	^ self text string
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>veryDeepInner: deepCopier  [
	"Copy all of my instance variables. Some need to be not copied at all, but shared.
	Warning!! Every instance variable defined in this class must be handled.
	We must also implement veryDeepFixupWith:.  See DeepCopier class comment."

	super veryDeepInner: deepCopier.
	textStyle := textStyle veryDeepCopyWith: deepCopier.
	paragraph := paragraph veryDeepCopyWith: deepCopier.
	textColor := textColor veryDeepCopyWith: deepCopier.
	editor := editor veryDeepCopyWith: deepCopier.

]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>wantsYellowButtonMenu [
	^ self menuAllowed 
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>whenFindTextChanged: anAnnouncement  [
	self changed
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>withDecorator: aDecorator [
	(self hasDecoratorNamed: aDecorator key)
		ifTrue: [ ^ self ].
	paragraph := aDecorator next: paragraph.
	self compose
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>withDecoratorNamed: aKey [
	(self hasDecoratorNamed: aKey)
		ifTrue: [ ^ self ].
	(self classOfDecoratorNamed: aKey)
		ifNotNil: [ :cls | self withDecorator: cls new ]
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>withDecoratorsNamed: aCollection [
	aCollection do: [ :m | self withDecoratorNamed: m ]
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>withFindReplaceSelection [
	self withDecoratorNamed: #findReplaceSelection
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>withOpeningClosingDelimitersHighlight [
	self withDecoratorNamed: #openingClosingDelimitersHighlight
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>withoutAnyDecorator [
	[ self paragraph key notNil ] whileTrue: [ self withoutDecorator: paragraph ]
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>withoutDecorator: aDecorator [
	| n p |
	(self hasDecorator: aDecorator)
		ifFalse: [ ^ self ].
	n := paragraph.
	[ n notNil and: [ n ~= aDecorator ] ]
		whileTrue: [ 
			p := n.
			n := p next ].
	n ifNil: [ ^ self ].
	p ifNil: [ paragraph := aDecorator next ] ifNotNil: [ p next: aDecorator next ].
	aDecorator aboutToBeUnplugged.
	aDecorator next: nil.
	aDecorator unplug.
	self changed
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>withoutDecoratorNamed: aKey [
	(self decoratorNamed: aKey)
		ifNotNil: [ :m | self withoutDecorator: m ].
	self changed
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>withoutDecoratorsNamed: aCollection [
	aCollection do: [ :m | self withoutDecoratorNamed: m ]
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>withoutFindReplaceSelection [
	self withoutDecoratorNamed: #findReplaceSelection
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>withoutSecondarySelection [
	self withoutDecoratorNamed: #secondarySelection
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>wouldAcceptKeyboardFocusUponTab [
	"Answer whether the receiver might accept keyboard focus if 
	tab were hit in some container playfield"
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>wrapped [
	^ false
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAbstractTextArea>>yellowButtonActivity: shiftKeyState  [
	"Invoke the text-editing menu.
	Check if required first!"
	self wantsYellowButtonMenu
		ifFalse: [ ^ false ].	
	(self getMenu: shiftKeyState)
		ifNotNil: [ :menu|
			menu setInvokingView: self editor.
			menu invokeModal. 
			self changed.
			^ true].
		
	^ true
]
