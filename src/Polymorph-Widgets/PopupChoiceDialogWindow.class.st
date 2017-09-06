"
Presents a list of options in a popup format. If the list is long it will split into multiple columns. If very long, the columns will be scrollable. Maximum extent of the content area is half the display extent.
"
Class {
	#name : #PopupChoiceDialogWindow,
	#superclass : #ModelDependentDialogWindow,
	#instVars : [
		'choice',
		'labels',
		'lines',
		'choicesMorph',
		'choiceMenus',
		'filter',
		'filterMorph'
	],
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 5/18/2007 12:26'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow class>>chooseFrom: aList lines: lines title: title [
	"self chooseFrom: #('yes' 'no') lines: #(1 2)  title: 'Foo is the question'"
	"self chooseFrom: #('yes' 'no') lines: #()  title: 'Foo is the question'"
	| pd |
	pd := (self newWithTheme: World theme)
		title: (title isEmpty ifTrue: ['Choose' translated] ifFalse: [title asString]);
		labels: aList;
		lines: (lines ifNil: [#()]);
		model: aList.
	"World may be not the best choice because a window may want to be in controlaList 
	this point should be investigated based on UIManager default modalMorph"
	^(World openModal: pd) choice
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow class>>chooseIn: aThemedMorph title: title labels: labels values: values lines: lines [
	"self chooseIn: World title: 'foo is the question'  labels: #('yes' 'no') values: #(true false) lines: #(1 2)"
	"self chooseIn: World title: 'foo is the question'  labels: #('yes' 'no') values: #(true false) lines: #()"
	| pd |
	pd := (self newWithTheme: aThemedMorph theme)
		title: (title isEmpty ifTrue: ['Choose' translated] ifFalse: [title asString]);
		labels: labels;
		lines: (lines ifNil: [#()]);
		model: values.
	^(aThemedMorph openModal: pd) choice
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow class>>taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^#smallQuestionIcon
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>activate: evt [
	"Backstop."
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>choice [
	"Answer the value of choice"

	^ choice
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>choice: anObject [
	"Set the value of choice"

	choice := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>choiceMenus [
	"Answer the value of choiceMenus"

	^ choiceMenus ifNil: [#()] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>choiceMenus: anObject [
	"Set the value of choiceMenus"

	choiceMenus := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>choicesMorph [
	"Answer the value of choicesMorph"

	^ choicesMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>choicesMorph: anObject [
	"Set the value of choicesMorph"

	choicesMorph := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>choose: index [
	"Set the given choice and ok."

	self choice: (self model
		ifNil: [index]
		ifNotNil: [self model at: index]).
	self ok
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>deleteIfPopUp: evt [
	"For compatibility with MenuMorph."
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>extent: aPoint [
	"Make the choices area at least fill the scroll area."

	|m|
	super extent: aPoint.
	m := self choicesMorph.
	m ifNotNil: [m width: (m width max: self scrollPane width)]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>filter [
	"Answer the value of filter"

	^ filter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>filter: aString [
	"Set the value of filter, used to match the valid choices."

	filter := aString.
	self changed: #filter.
	self filterMorph ifNil: [^self].
	(self choiceMenus ifNil: [^self]) do: [:embeddedMenu |
		embeddedMenu selectItem: nil event: nil]. "clear selection in other menus"
	self choiceMenus do: [:embeddedMenu | 
		embeddedMenu selectMatch: self filter asLowercase].
	self filterMorph hasKeyboardFocus ifFalse: [
		self activeHand newKeyboardFocus: self filterMorph.
		self filterMorph selectFrom: filter size + 1 to: filter size + 1]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>filterMorph [
	"Answer the value of filterMorph"

	^ filterMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>filterMorph: anObject [
	"Set the value of filterMorph"

	filterMorph := anObject
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>handlesKeyboard: evt [
	"True when either the filter morph doesn't have the focus and the key
	is a text key or backspace or no menus have the focus and is up or down arrow."
	
	^(super handlesKeyboard: evt) or: [
		(self choiceMenus anySatisfy: [:m | m hasKeyboardFocus])
			ifTrue: [evt keyCharacter = Character backspace
						or: [evt keyCharacter > Character space
						or: [evt keyCharacter = Character cr
						or: [evt keyCharacter = Character arrowLeft
						or: [evt keyCharacter = Character arrowRight]]]]]
			ifFalse: [evt keyCharacter = Character arrowUp
						or: [evt keyCharacter = Character arrowDown
						or: [self filterMorph hasKeyboardFocus not]]]]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		labels: #();
		lines: #();
		filter: ''
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>keyStroke: anEvent [
	"Look for a matching item?"
	(super keyStroke: anEvent) ifTrue: [^true].
	anEvent keyCharacter = Character backspace
		ifTrue: [self filter ifNotEmpty: [self filter: self filter allButLast]].
	anEvent keyCharacter = Character arrowUp ifTrue: [self selectLastEnabledItem. ^true].
	anEvent keyCharacter = Character arrowDown ifTrue: [self selectFirstEnabledItem. ^true].
	anEvent keyCharacter = Character arrowLeft ifTrue: [self switchToPreviousColumn. ^true].
	anEvent keyCharacter = Character arrowRight ifTrue: [self switchToNextColumn. ^true].
	(anEvent keyCharacter ~= Character cr and: [
		anEvent keyCharacter < Character space]) ifTrue: [^false]. "ignore pageup/down etc."
	(anEvent keyCharacter = Character space or: [ anEvent keyCharacter = Character cr]) 
		ifTrue: [ ^self processEnter: anEvent ].
	anEvent keyCharacter = Character backspace ifFalse: [
		self filter: self filter, anEvent keyCharacter asString].
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>labels [
	"Answer the value of labels"

	^ labels
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>labels: anObject [
	"Set the value of labels"

	labels := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>lines [
	"Answer the value of lines"

	^ lines
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>lines: anObject [
	"Set the value of lines"

	lines := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>newButtons [
	"Answer new buttons as appropriate."

	self filterMorph: self newFilterEntry.
	^{self filterMorph. self newCancelButton}
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>newChoiceButtonFor: index [
	"Answer a new choice button."

	^(ToggleMenuItemMorph new
		contents: (self labels at: index) asString;
		target: self;
		selector: #choose:;
		arguments: {index};
		getStateSelector: nil;
		enablementSelector: nil)
		cornerStyle: #square;
		hResizing: #spaceFill
		
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>newChoicesMorph [
	"Answer a row of columns of buttons and separators based on the model."

	|answer morphs str maxLines|
	answer := self newRow
		cellPositioning: #topLeft;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
	self labels ifEmpty: [^answer].
	maxLines := Display height - 100 // 2 // (self newChoiceButtonFor: 1) height.
	morphs := OrderedCollection new.
	1 to: self labels size do: [:i |
		morphs add: (self newChoiceButtonFor: i).
		(self lines includes: i) ifTrue: [
			morphs add: self newSeparator]].
	str := morphs readStream.
	[str atEnd] whileFalse: [
		answer
			addMorphBack: (self newMenuWith: (str next: maxLines));
			addMorphBack: self newVerticalSeparator].
	answer removeMorph: answer submorphs last.
	answer submorphs last
		hResizing: #spaceFill.
	self choiceMenus: (answer submorphs select: [:m| m isKindOf: MenuMorph]).
	^answer
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>newContentMorph [
	"Answer a new content morph."

	|sp choices|
	self choicesMorph: (choices := self newChoicesMorph).
	sp := (self newScrollPaneFor: choices)
		scrollTarget: choices;
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	sp
		minWidth: ((choices width min: Display width // 2) + sp scrollBarThickness max: TextEntryDialogWindow minimumWidth);
		minHeight: (choices height min: Display height // 2).
	choices width > sp minWidth
		ifTrue: [sp minHeight: sp minHeight + sp scrollBarThickness].
	sp
		updateScrollbars.
	^self newGroupboxFor: sp
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>newFilterEntry [
	"Answer a new filter entry field."

	|entry|
	entry := self
		newAutoAcceptTextEntryFor: self
		getText: #filter
		setText: #filter:
		getEnabled: nil
		help: 'Filters the options according to a matching substring' translated.
	entry acceptOnCR: false.
	entry textMorph crAction: (MessageSend receiver: self selector: #ok).
	^entry 

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>newMenuWith: morphs [
	"Answer menu with the given morphs."

	^(self newEmbeddedMenu addAllMorphs: morphs)
		borderWidth: 0;
		removeDropShadow;
		color: Color transparent;
		hResizing: #spaceFill;
		cornerStyle: #square;
		stayUp: true;
		beSticky;
		popUpOwner: (MenuItemMorph new privateOwner: self)
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>processEnter: anEvent [
	self choiceMenus do: [:embeddedMenu | 
		embeddedMenu selectedItem ifNotNil: [:item |
			item invokeWithEvent: anEvent.
			^true ] ].
	^false
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>rootMenu [
	"Answer the root menu. Answer self."

	^self
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>scrollPane [
	"Answer the scroll pane."

	^self findDeeplyA: GeneralScrollPane
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>selectFirstEnabledItem [
	"Select the first enabled item in any of the embedded menus"

	|found|
	found := false.
	(self choiceMenus ifNil: [^self]) do: [:embeddedMenu |
		embeddedMenu selectItem: nil event: nil]. "clear selection in other menus"
	self choiceMenus do: [:embeddedMenu | 
		(embeddedMenu selectMatch: self filter)
			ifNotNil: [:menuItem |
				found ifFalse: [
					embeddedMenu selectItem: menuItem event: nil.
					self activeHand newKeyboardFocus: embeddedMenu.
					found := true]]]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>selectLastEnabledItem [
	"Select the last enabled item in any of the embedded menus"

	|found|
	found := false.
	(self choiceMenus ifNil: [^self]) do: [:embeddedMenu |
		embeddedMenu selectItem: nil event: nil]. "clear selection in other menus"
	self choiceMenus reverseDo: [:embeddedMenu | 
		(embeddedMenu selectLastMatch: self filter)
			ifNotNil: [:menuItem |
				found ifFalse: [
					embeddedMenu selectItem: menuItem event: nil.
					self activeHand newKeyboardFocus: embeddedMenu.
					found := true]]]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>switchToNextColumn [
	"Give the next embedded menu keyboard focus."

	(self choiceMenus isNil or: [ self choiceMenus isEmpty ])
		ifTrue: [ ^ self ].
	self choiceMenus detect: [ :m | m hasKeyboardFocus ] ifFound: [ :menuWithFocus | menuWithFocus navigateFocusForward ].
	self choiceMenus detect: [ :m | m hasKeyboardFocus ] ifNone: [ self choiceMenus first takeKeyboardFocus ]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindow>>switchToPreviousColumn [
	"Give the previous embedded menu keyboard focus."

	(self choiceMenus isNil or: [ self choiceMenus isEmpty ])
		ifTrue: [ ^ self ].
	self choiceMenus detect: [ :m | m hasKeyboardFocus ] ifFound: [ :menuWithFocus | menuWithFocus navigateFocusBackward ].
	self choiceMenus detect: [ :m | m hasKeyboardFocus ] ifNone: [ self choiceMenus last takeKeyboardFocus ]
]
