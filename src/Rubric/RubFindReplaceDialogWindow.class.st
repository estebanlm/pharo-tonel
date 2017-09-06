"
I am the window to find and replace text in a text area
"
Class {
	#name : #RubFindReplaceDialogWindow,
	#superclass : #DialogWindow,
	#instVars : [
		'findTextField'
	],
	#classVars : [
		'Finds',
		'Replacements'
	],
	#category : #Rubric-Editing-FindReplaceService,
	#timestamp : 'FranckWarlouzet 7/29/2015 13:31'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow class>>finds [
	^ Finds ifNil: [Finds := OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow class>>maxPreviousListSize [
	^ 15
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow class>>replacements [
	^ Replacements ifNil: [Replacements := OrderedCollection new]
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>buildWindowMenu [
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
	aMenu lastItem icon: self theme smallHelpIcon.
	^ aMenu
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>cancel [
	self model findText: ''.
	super cancel 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>caseSensitive [
	^ self model ifNil: [false] ifNotNil: [:m | m caseSensitive] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>caseSensitive: aBoolean [
	self model caseSensitive: aBoolean.

]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>defaultButton [
	"Answer the default button."
	^self
		findDeepSubmorphThat: [:m |
			(m isKindOf: PluggableButtonMorph) and: [m actionSelector = #find]]
		ifAbsent: [] 
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>defaultFocusMorph [
	^ self findTextFieldMorph textMorph
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>delete [
	| m |
	m := model.
	[ super delete ]
		ensure: [ 
			model := m.
			model textArea ifNotNil: [ :ta | ta takeKeyboardFocus ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>entireWordsOnly [
	^ self model ifNil: [false] ifNotNil: [:m | m entireWordsOnly] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>entireWordsOnly: aBoolean [
	self model entireWordsOnly: aBoolean.

]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>extent: anExtent [
	^ super extent: anExtent x @ self initialExtent y
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>find [
	self newFinding.
	^ self model find
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>findEnabled [
	^ self findString isEmptyOrNil not 
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>findPolicyChanged [
	self changed: #findText.
	self changed: #caseSensitive.
	self changed: #isRegex.
	self changed: #entireWordsOnly.
	self changed: #findEnabled.
	self changed: #replaceText.
	self changed: #replaceEnabled.
	self changed: #replaceAllEnabled.
	self findTextFieldMorph textColor: self theme textColor


]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>findString [
	^ self model ifNil: ['' asText] ifNotNil: [:m | m findString]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>findText [
	^ self model ifNil: ['' asText] ifNotNil: [:m | m findText]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>findText: aStringOrText [
	^ self model findText: aStringOrText.

]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>findTextFieldMorph [
	^ findTextField
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>initialExtent  [
	^ 400 @ super initialExtent y
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>isRegex [
	^ self model ifNil: [false] ifNotNil: [:m | m isRegex] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>isRegex: aBoolean [
	self model isRegex: aBoolean.

]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>isResizeable [
	"Answer whether we are not we can be resized."

	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>maxPreviousListSize [
	^ self class maxPreviousListSize
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>newButtons [
	"Answer new buttons as appropriate."

	^{self newFindButton isDefault: true. self newReplaceButton. self newReplaceAllButton. self newCancelButton}
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>newContentMorph [
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
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>newFindButton [
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
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>newFindTextEntryMorph [
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
	findTextField := pt.
	^ pt

]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>newFinding [
	| t |
	(t := self findText asString) ifEmpty: [^ self ].
	(self prevFinds includes: t)
		ifFalse: [self prevFinds addFirst: t].
	self prevFinds size > self maxPreviousListSize
		ifTrue: [self prevFinds removeLast]
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>newReplaceAllButton [
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
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>newReplaceButton [
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
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>newReplaceTextEntryMorph [
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
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>newReplacement [
	| t |
	(t := self replaceText asString) ifEmpty: [^ self ].
	(self prevReplacements includes: t)
		ifFalse: [self prevReplacements addFirst: t].
	self prevReplacements size > self maxPreviousListSize
		ifTrue: [self prevReplacements removeLast]
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>open [
	self openAsIsIn: World.
	self extent: self extent.
	self activate

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>prevFinds [
	^ self class finds
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>prevReplacements [
	^ self class replacements
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>regexError [
	self findTextFieldMorph textColor: Color  red
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>replace [
	self newReplacement.
	self model replace.
	self find
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>replaceAll [
	self model replaceAll
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>replaceAllEnabled [
	^ self textView notNil
		and: [self findText notEmpty]
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>replaceEnabled [
	^ self textView notNil
		and: [self findText notEmpty]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>replaceText [
	^ self model ifNil: [ '' asText] ifNotNil: [:m | m replaceText]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>replaceText: aStringOrText [
	self model replaceText: aStringOrText asString.
	^ true


]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>searchBackwards [
	^ self model ifNil: [false] ifNotNil: [:m | m searchBackwards]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>searchBackwards: aBoolean [
	self searchBackwards = aBoolean
		ifFalse: [ 
			self model searchBackwards: aBoolean.
			self findPolicyChanged ]
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>taskbarButtonFor: aTaskBar [
	"No taskbar button because always on top"
	^nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>textView [
	^ self model ifNotNil: [ :m | m textArea ]
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>title [
	^ 'Find & Replace' translated.

]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>update: aSymbol [
	self textView ifNotNil: [
		aSymbol = #regexError
				ifTrue: [self regexError].
		aSymbol = #newFinding
				ifTrue: [^ self newFinding].
		aSymbol = #findPolicy
			ifTrue: [self findPolicyChanged]].
	super update: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>wrapAround [
	^ self model ifNil: [true] ifNotNil: [:m | m wrapAround] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubFindReplaceDialogWindow>>wrapAround: aBoolean [
	self model wrapAround: aBoolean.

]
