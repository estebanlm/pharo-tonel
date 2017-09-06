"
A find/replace dialog window for editors
"
Class {
	#name : #EditorFindReplaceDialogWindow,
	#superclass : #DialogWindow,
	#instVars : [
		'state',
		'textFieldMorph'
	],
	#classVars : [
		'Finds',
		'Replacements',
		'Singleton'
	],
	#category : #Text-Edition,
	#timestamp : 'TorstenBergmann 1/31/2014 12:21'
}

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow class>>cleanUp [
	Singleton ifNotNil: [ 
			Singleton close.
			Singleton := nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow class>>finds [
	^ Finds ifNil: [Finds := OrderedCollection new]
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow class>>initialize [
	"EditorFindReplaceDialogWindow initialize"
	Singleton := nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow class>>maxPreviousListSize [
	^ 15
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow class>>on: aTextView [
	^ self singleton on: aTextView
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow class>>replacements [
	^ Replacements ifNil: [Replacements := OrderedCollection new]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow class>>singleton  [
	^ Singleton ifNil: [Singleton := self new].

]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>buildWindowMenu [
	"Build and answer the window menu."

	| aMenu |
	aMenu := self theme newMenuIn: self for: self.
	aMenu
		addToggle: 'Close' translated
		target: self
		selector: #closeBoxHit
		getStateSelector: nil
		enablementSelector: #allowedToClose.
	aMenu lastItem icon: self theme windowCloseForm.
	aMenu addLine.
	aMenu add: 'About' selector: #showAbout.
	aMenu lastItem icon: (self iconNamed: #smallHelpIcon).
	^ aMenu
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>cancel [
	self state findText: ''.
	super cancel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>caseSensitive [
	^ self state caseSensitive
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>caseSensitive: aBoolean [
	self state caseSensitive: aBoolean.

]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>defaultButton [
	"Answer the default button."
	^self
		findDeepSubmorphThat: [:m |
			(m isKindOf: PluggableButtonMorph) and: [m actionSelector = #find]]
		ifAbsent: [] 
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>defaultFocusMorph [
	^ self findTextFieldMorph textMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>entireWordsOnly [
	^ self state entireWordsOnly
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>entireWordsOnly: aBoolean [
	self state entireWordsOnly: aBoolean.

]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>extent: anExtent [
	^ super extent: anExtent x @ self initialExtent y
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>find [
	self newFinding.
	^ self state findInTextMorph: self model
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>findEnabled [
	^ self findString isEmptyOrNil not 
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>findPolicyChanged [
	self changed: #findText.
	self findTextFieldMorph textColor: Color  black.
	self changed: #caseSensitive.
	self changed: #isRegex.
	self changed: #entireWordsOnly.
	self changed: #findEnabled.
	self changed: #replaceText.
	self changed: #replaceEnabled.
	self changed: #replaceAllEnabled.
	self model ifNotNil: [self model selectionChanged].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>findString [
	^ self state findString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>findText [
	^ self state findText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>findText: aStringOrText [
	self state findText: aStringOrText.
	^ true

]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>findTextFieldMorph [
	^ textFieldMorph
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>initialExtent  [
	^ 400 @ super initialExtent y
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>isRegex [
	^ self state isRegex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>isRegex: aBoolean [
	self state isRegex: aBoolean.

]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>isResizeable [
	"Answer whether we are not we can be resized."

	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>maxPreviousListSize [
	^ self class maxPreviousListSize
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>newButtons [
	"Answer new buttons as appropriate."

	^{self newFindButton isDefault: true. self newReplaceButton. self newReplaceAllButton. self newCancelButton}
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>newContentMorph [
	^(self newColumn: {	
			(self newGroupbox: nil for: 
				(self newColumn: {
					self newFindTextEntryMorph.
					(self newRow: {
						(self newColumn: {
							(self newCheckboxFor: self getSelected: #isRegex setSelected: #isRegex: getEnabled: nil label: 'Regular expression' translated help: nil).
							(self newCheckboxFor: self getSelected: #caseSensitive setSelected: #caseSensitive: getEnabled: nil label: 'Case sensitive' translated help: nil).
							(self newCheckboxFor: self getSelected: #entireWordsOnly setSelected: #entireWordsOnly: getEnabled: nil label: 'Entire words only'  translated help: nil) }
						).
						(self newColumn: {
							(self newCheckboxFor: self getSelected: #searchBackwards setSelected: #searchBackwards: getEnabled: nil label: 'Search backwards'  translated help: nil).
							(self newCheckboxFor: self getSelected: #wrapAround setSelected: #wrapAround: getEnabled: nil label: 'Wrap around'  translated help: nil) }
						) }	
					) }
				)
			).
			(self newLabelGroup: {'Replace with: ' translated -> self newReplaceTextEntryMorph}) vResizing: #shrinkWrap}
		) 


]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>newFindButton [
	^(self theme
			newButtonIn: self
			for: self
			getState: nil
			action: #find
			arguments: nil
			getEnabled: #findEnabled
			label: 'Find' translated
			help: 'Find the next occurence' translated)
		hResizing: #rigid;
		vResizing: #rigid
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>newFindTextEntryMorph [
	| entryCompletion pt |
	entryCompletion := EntryCompletion new
				dataSourceBlock: [:currText | self prevFinds ];
				filterBlock: [:currApplicant :currText | currText size = 0
						or: [currApplicant asUppercase includesSubstring: currText asString asUppercase]].
	pt := (self newAutoAcceptTextEntryFor: self
			get: #findText
			set: #findText:
			class: String 
			getEnabled: nil
			help: 'Enter the text to find' translated
			entryCompletion: entryCompletion) 
		acceptOnCR: false;
		ghostText: 'Text to find';
		withDropListButton;
		crAction: [:t | self find];
		yourself.
	pt textMorph
		autoFit: true;
		wrapFlag: false;
		margins: (2@1 corner: 2@1).
	textFieldMorph := pt. 
	^ pt

]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>newFinding [
	| t |
	(t := self findText asString) ifEmpty: [^ self ].
	(self prevFinds includes: t)
		ifFalse: [self prevFinds addFirst: t].
	self prevFinds size > self maxPreviousListSize
		ifTrue: [self prevFinds removeLast]
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>newReplaceAllButton [
	^ (self theme
		newButtonIn: self
		for: self
		getState: nil
		action: #replaceAll
		arguments: nil
		getEnabled: #replaceAllEnabled
		label: 'Replace all' translated
		help: 'Replace all occurences' translated) hResizing: #rigid;
		 vResizing: #rigid
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>newReplaceButton [
	^ (self theme
		newButtonIn: self
		for: self
		getState: nil
		action: #replace 
		arguments: nil
		getEnabled: #replaceEnabled
		label: 'Replace' translated
		help: 'Replace the next occurence' translated) hResizing: #rigid;
		 vResizing: #rigid
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>newReplaceTextEntryMorph [
	| entryCompletion pt |
	entryCompletion := EntryCompletion new
				dataSourceBlock: [:currText | self prevReplacements ];
				filterBlock: [:currApplicant :currText | currText size = 0
						or: [currApplicant asUppercase includesSubstring: currText asString asUppercase]].

	pt := (self
		newAutoAcceptTextEntryFor: self
		get: #replaceText
		set: #replaceText:
		class: String
		getEnabled: nil
		help: 'Enter the replacement text' translated
		entryCompletion: entryCompletion)
			acceptOnCR: true;
			crAction: [:t | self replace];
			withDropListButton;
			yourself.
	pt textMorph
		autoFit: true;
		wrapFlag: false;
		margins: (2@1 corner: 2@1).
	^ pt

]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>newReplacement [
	| t |
	(t := self replaceText asString) ifEmpty: [^ self ].
	(self prevReplacements includes: t)
		ifFalse: [self prevReplacements addFirst: t].
	self prevReplacements size > self maxPreviousListSize
		ifTrue: [self prevReplacements removeLast]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>on: aTextView [
	(model isNil or: [model  ~= aTextView])
		ifTrue: [self findText: self findText.
			self model: aTextView.
			self changed: #findText.
			self changed: #caseSensitive.
			self changed: #replaceEnabled.
			self owner ifNotNil: [self findText: self findText]].

]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>open [
	self openAsIsIn: World.
	self extent: self extent.
	self activate

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>prevFinds [
	^ self class finds
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>prevReplacements [
	^ self class replacements
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>replace [
	self newReplacement.
	self state replaceInTextMorph: self model.
	self find
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>replaceAll [
	self model takeKeyboardFocus.
	self state replaceAllInTextMorph: self model
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>replaceAllEnabled [
	^ self model notNil
		and: [self findText notEmpty]
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>replaceEnabled [
	^ self model notNil
		and: [self findText notEmpty]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>replaceText [
	^ self state replaceText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>replaceText: aStringOrText [
	self state replaceText: aStringOrText asString.
	^ true


]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>searchBackwards [
	^ self state searchBackwards
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>searchBackwards: aBoolean [
	self searchBackwards = aBoolean
		ifFalse: [self state searchBackwards: aBoolean.
			self state updateFindStartIndexForTextMorph: self model]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>state [
	^ state ifNil: [self state: FindReplaceService new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>state: aFindReplaceService [
	state ifNotNil: [state removeDependent: self].
	state := aFindReplaceService.
	state ifNotNil: [state addDependent: self].

]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>taskbarButtonFor: aTaskBar [
	"No taskbar button because always on top"
	^nil
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>taskbarIcon [
	^ self iconNamed: #smallFindIcon
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>title [
	^ 'Find & Replace' translated.

]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>update: aSymbol [
	| si |
	model ifNotNil: [
		aSymbol = #regexError
				ifTrue: [self findTextFieldMorph textColor: Color  red].
		aSymbol = #newFinding
				ifTrue: [^ self newFinding].
		aSymbol = #findPolicy
			ifTrue: [self findPolicyChanged].
		aSymbol = #findReplaceSelection 
			ifTrue: [self changed: #replaceEnabled.
				self state updateFindStartIndexForTextMorph: self model]].
	super update: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>wrapAround [
	^ self state wrapAround 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
EditorFindReplaceDialogWindow>>wrapAround: aBoolean [
	self state wrapAround: aBoolean.

]
