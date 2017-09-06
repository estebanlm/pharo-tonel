"
Trait providing useful theme-related methods.
"
Trait {
	#name : #TEasilyThemed,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Polymorph-Widgets,
	#timestamp : 'gvc 5/18/2007 11:55'
}

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>abort: aStringOrText [
	"Open an error dialog."

	^self abort: aStringOrText title: 'Error' translated
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>abort: aStringOrText title: aString [
	"Open an error dialog."

	^self theme
		abortIn: self
		text: aStringOrText
		title: aString
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>alert: aStringOrText [
	"Open an alert dialog."

	^self alert: aStringOrText title: 'Alert' translated
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>alert: aStringOrText title: aString [
	"Open an alert dialog."

	^self
		alert: aStringOrText
		title: aString
		configure: [:d | ]
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>alert: aStringOrText title: aString configure: aBlock [
	"Open an alert dialog.
	Configure the dialog with the 1 argument block
	before opening modally."

	^self theme
		alertIn: self
		text: aStringOrText
		title: aString
		configure: aBlock
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>centeredAlert: aStringOrText title: aString configure: aBlock [
	"Open an alert dialog.
	Configure the dialog with the 1 argument block
	before opening modally."

	^self theme
		centeredAlertIn: self
		text: aStringOrText
		title: aString
		configure: aBlock
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>chooseColor [
	"Answer the result of a color selector dialog ."

	^self chooseColor: Color black
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>chooseColor: aColor  [
	"Answer the result of a color selector dialog with the given color."

	^self theme
		chooseColorIn: self
		title: 'Colour Selector' translated
		color: aColor
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>chooseColor: aColor title: title [
	"Answer the result of a color selector dialog with the given title and initial colour."

	^self theme
		chooseColorIn: self
		title: title
		color: aColor
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>chooseDirectory: title  [
	"Answer the result of a file dialog with the given title, answer a directory."

	^self
		chooseDirectory: title
		path: nil
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>chooseDirectory: title path: path [
	"Answer the result of a file dialog with the given title, answer a directory."

	^self theme
		chooseDirectoryIn: self
		title: title
		path: path
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>chooseDropList: aStringOrText list: aList [
	"Open a drop list chooser dialog."

	^self
		chooseDropList: aStringOrText
		title: 'Choose' translated
		list: aList
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>chooseDropList: aStringOrText title: aString list: aList [
	"Open a drop list chooser dialog."

	^self theme
		chooseDropListIn: self
		text: aStringOrText
		title: aString
		list: aList
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>chooseFileName: title extensions: exts path: path preview: preview [
	"Answer the result of a file name chooser dialog with the given title, extensions
	to show, path and preview type."

	^self theme
		chooseFileNameIn: self
		title: title
		extensions: exts
		path: path
		preview: preview
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>chooseFont [
	"Answer the result of a font selector dialog."

	^self chooseFont: nil
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>chooseFont: aFont  [
	"Answer the result of a font selector dialog with the given initial font."

	^self theme
		chooseFontIn: self
		title: 'Font Selector' translated
		font: aFont
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>deny: aStringOrText [
	"Open a denial dialog."

	^self deny: aStringOrText title: 'Access Denied' translated
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>deny: aStringOrText title: aString [
	"Open a denial dialog."

	^self theme
		denyIn: self
		text: aStringOrText
		title: aString
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>fileOpen: title [
	"Answer the result of a file open dialog with the given title."

	^self
		fileOpen: title
		extensions: nil
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>fileOpen: title extensions: exts [
	"Answer the result of a file open dialog with the given title and extensions to show."

	^self
		fileOpen: title
		extensions: exts
		path: nil
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>fileOpen: title extensions: exts path: path [
	"Answer the result of a file open dialog with the given title, extensions to show and path."

	^self 
		fileOpen: title
		extensions: exts
		path: path
		preview: nil
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>fileOpen: title extensions: exts path: path preview: preview [
	"Answer the result of a file open dialog with the given title, extensions to show, path and preview type."

	^self theme
		fileOpenIn: self
		title: title
		extensions: exts
		path: path
		preview: preview
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>fileSave: title [
	"Answer the result of a file save dialog with the given title."

	^self
		fileSave: title
		extensions: nil
		path: nil
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>fileSave: title extensions: exts [
	"Answer the result of a file save dialog with the given title."

	^self
		fileSave: title
		extensions: exts
		path: nil
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>fileSave: title extensions: exts path: path [
	"Answer the result of a file save dialog with the given title, extensions to show and path."

	^self theme
		fileSaveIn: self
		title: title
		extensions: exts
		path: path
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>fileSave: title initialAnswer: aFileName extensions: exts path: path [

	^self theme
		fileSaveIn: self
		title: title
		initialAnswer: aFileName
		extensions: exts
		path: path
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>fileSave: title path: path [
	"Answer the result of a file save open dialog with the given title."

	^self
		fileSave: title
		extensions: nil
		path: path
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>longMessage: aStringOrText title: aString [
	"Open a (long) message dialog."

	^self theme
		longMessageIn: self
		text: aStringOrText
		title: aString
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>message: aStringOrText [
	"Open a message dialog."

	^self message: aStringOrText title: 'Information' translated
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>message: aStringOrText title: aString [
	"Open a message dialog."

	^self theme
		messageIn: self
		text: aStringOrText
		title: aString
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newAlphaImage: aForm help: helpText [
	"Answer an alpha image morph."

	^self theme
		newAlphaImageIn: self
		image: aForm
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newAlphaSelector: aModel getAlpha: getSel setAlpha: setSel help: helpText [
	"Answer an alpha channel selector with the given selectors."

	^self theme
		newAlphaSelectorIn: self
		for: aModel
		getAlpha: getSel
		setAlpha: setSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newAutoAcceptTextEntryFor: aModel get: getSel set: setSel class: aClass getEnabled: enabledSel font: aFont help: helpText [
	"Answer a text entry for the given model."

	^self theme
		newAutoAcceptTextEntryIn: self
		for: aModel
		get: getSel
		set: setSel
		class: aClass
		getEnabled: enabledSel
		font: aFont
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newAutoAcceptTextEntryFor: aModel get: getSel set: setSel class: aClass getEnabled: enabledSel font: aFont help: helpText entryCompletion: anEntryCompletion [
	"Answer a text entry for the given model."

	^self theme
		newAutoAcceptTextEntryIn: self
		for: aModel
		get: getSel
		set: setSel
		class: aClass
		getEnabled: enabledSel
		font: aFont
		help: helpText
		entryCompletion: anEntryCompletion
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newAutoAcceptTextEntryFor: aModel get: getSel set: setSel class: aClass getEnabled: enabledSel help: helpText [
	"Answer a text entry for the given model."

	^self theme
		newAutoAcceptTextEntryIn: self
		for: aModel
		get: getSel
		set: setSel
		class: aClass
		getEnabled: enabledSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newAutoAcceptTextEntryFor: aModel get: getSel set: setSel class: aClass getEnabled: enabledSel help: helpText entryCompletion: anEntryCompletion [
	"Answer a text entry for the given model."

	^self theme
		newAutoAcceptTextEntryIn: self
		for: aModel
		get: getSel
		set: setSel
		class: aClass
		getEnabled: enabledSel
		help: helpText
		entryCompletion: anEntryCompletion
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newAutoAcceptTextEntryFor: aModel getText: getSel setText: setSel getEnabled: enabledSel font: aFont help: helpText [
	"Answer a text entry for the given model."

	^self theme
		newAutoAcceptTextEntryIn: self
		for: aModel
		get: getSel
		set: setSel
		class: String
		getEnabled: enabledSel
		font: aFont
		help: helpText

]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newAutoAcceptTextEntryFor: aModel getText: getSel setText: setSel getEnabled: enabledSel font: aFont help: helpText entryCompletion: anEntryCompletion [
	"Answer a text entry for the given model."

	^self theme
		newAutoAcceptTextEntryIn: self
		for: aModel
		get: getSel
		set: setSel
		class: String
		getEnabled: enabledSel
		font: aFont
		help: helpText
		entryCompletion: anEntryCompletion

]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newAutoAcceptTextEntryFor: aModel getText: getSel setText: setSel getEnabled: enabledSel help: helpText [
	"Answer a text entry for the given model."

	^self theme
		newAutoAcceptTextEntryIn: self
		for: aModel
		get: getSel
		set: setSel
		class: String
		getEnabled: enabledSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newAutoAcceptTextEntryFor: aModel getText: getSel setText: setSel getEnabled: enabledSel help: helpText entryCompletion: anEntryCompletion [
	"Answer a text entry for the given model."

	^self theme
		newAutoAcceptTextEntryIn: self
		for: aModel
		get: getSel
		set: setSel
		class: String
		getEnabled: enabledSel
		help: helpText
		entryCompletion: anEntryCompletion
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newBalloonHelp: aTextStringOrMorph for: aMorph [
	"Answer a new balloon help with the given contents for aMorph
	at a given corner."

	^self theme
		newBalloonHelpIn: self
		contents: aTextStringOrMorph
		for: aMorph
		corner: #bottomLeft
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newBalloonHelp: aTextStringOrMorph for: aMorph corner: cornerSymbol [
	"Answer a new balloon help with the given contents for aMorph
	at a given corner."

	^self theme
		newBalloonHelpIn: self
		contents: aTextStringOrMorph
		for: aMorph
		corner: cornerSymbol
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newBracketSliderFor: aModel getValue: getSel setValue: setSel min: minValue max: maxValue quantum: quantum getEnabled: enabledSel help: helpText [
	"Answer a bracket slider with the given selectors."

	^self theme
		newBracketSliderIn: self
		for: aModel
		getValue: getSel
		setValue: setSel
		min: minValue
		max: maxValue
		quantum: quantum
		getEnabled: enabledSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newBracketSliderFor: aModel getValue: getSel setValue: setSel min: minValue max: maxValue quantum: quantum help: helpText [
	"Answer a bracket slider with the given selectors."

	^self
		newBracketSliderFor: aModel
		getValue: getSel
		setValue: setSel
		min: minValue
		max: maxValue
		quantum: quantum 
		getEnabled: nil
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newButtonFor: aModel action: actionSel getEnabled: enabledSel label: stringOrText help: helpText [
	"Answer a new button."

	^self
		newButtonFor: aModel
		getState: nil
		action: actionSel
		arguments: nil
		getEnabled: enabledSel 
		label: stringOrText
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newButtonFor: aModel action: actionSel label: stringOrText help: helpText [
	"Answer a new button."

	^self
		newButtonFor: aModel
		getState: nil
		action: actionSel
		arguments: nil
		getEnabled: nil 
		label: stringOrText
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newButtonFor: aModel getState: stateSel action: actionSel arguments: args getEnabled: enabledSel getLabel: labelSel help: helpText [
	"Answer a new button."

	^self theme
		newButtonIn: self for: aModel
		getState: stateSel
		action: actionSel
		arguments: args
		getEnabled: enabledSel 
		getLabel: labelSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newButtonFor: aModel getState: stateSel action: actionSel arguments: args getEnabled: enabledSel label: stringOrText help: helpText [
	"Answer a new button."

	^self theme
		newButtonIn: self for: aModel
		getState: stateSel
		action: actionSel
		arguments: args
		getEnabled: enabledSel 
		label: stringOrText
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newButtonFor: aModel getState: stateSel action: actionSel arguments: args getEnabled: enabledSel labelForm: aForm help: helpText [
	"Answer a new button."

	^self theme
		newButtonIn: self for: aModel
		getState: stateSel
		action: actionSel
		arguments: args
		getEnabled: enabledSel 
		label: (AlphaImageMorph new image: aForm)
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newButtonLabel: aString [
	"Answer a new button text label."

	^self
		newButtonLabelFor: nil
		label: aString
		getEnabled: nil
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newButtonLabelFor: aModel label: aString getEnabled: enabledSel [
	"Answer a new button text label."

	^self theme
		newButtonLabelIn: self
		for: aModel
		label: aString
		getEnabled: enabledSel
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newCancelButton [
	"Answer a new cancel button."

	^self newCancelButtonFor: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newCancelButtonFor: aModel [
	"Answer a new cancel button."

	^self theme
		newCancelButtonIn: self
		for: aModel
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newCheckboxFor: aModel getSelected: getSel setSelected: setSel getEnabled: enabledSel getLabel: labelSel help: helpText [
	"Answer a checkbox with the given label."

	^self theme
		newCheckboxIn: self
		for: aModel
		getSelected: getSel
		setSelected: setSel
		getEnabled: enabledSel
		getLabel: labelSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newCheckboxFor: aModel getSelected: getSel setSelected: setSel getEnabled: enabledSel label: stringOrText help: helpText [
	"Answer a checkbox with the given label."

	^self theme
		newCheckboxIn: self
		for: aModel
		getSelected: getSel
		setSelected: setSel
		getEnabled: enabledSel
		label: stringOrText
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newCheckboxFor: aModel getSelected: getSel setSelected: setSel label: stringOrText help: helpText [
	"Answer a checkbox with the given label."

	^self theme
		newCheckboxIn: self
		for: aModel
		getSelected: getSel
		setSelected: setSel
		getEnabled: nil
		label: stringOrText
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newCloseButton [
	"Answer a new close button."

	^self newCloseButtonFor: self 
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newCloseButtonFor: aModel [
	"Answer a new close button."

	^self theme
		newCloseButtonIn: self
		for: aModel
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newCloseControlFor: aModel action: aValuable help: helpText [
	"Answer a new cancel button."

	^self theme
		newCloseControlIn: self
		for: aModel
		action: aValuable
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newColorChooserFor: aModel getColor: getSel setColor: setSel getEnabled: enabledSel help: helpText [
	"Answer a color chooser with the given selectors."

	^self theme
		newColorChooserIn: self
		for: aModel
		getColor: getSel
		setColor: setSel
		getEnabled: enabledSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newColorChooserFor: aModel getColor: getSel setColor: setSel help: helpText [
	"Answer a color chooser with the given selectors."

	^self theme
		newColorChooserIn: self
		for: aModel
		getColor: getSel
		setColor: setSel
		getEnabled: nil
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newColorPresenterFor: aModel getColor: getSel help: helpText [
	"Answer a color presenter with the given selectors."

	^self theme
		newColorPresenterIn: self
		for: aModel
		getColor: getSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newColumn: controls [
	"Answer a morph laid out with a column of controls."

	^self theme
		newColumnIn: self
		for: controls
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newDialogPanel [
	"Answer a new main dialog panel."

	^self theme
		newDialogPanelIn: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newDropListFor: aModel list: listSel getSelected: getSel setSelected: setSel getEnabled: enabledSel help: helpText [
	"Answer a drop list for the given model."

	^self theme
		newDropListIn: self
		for: aModel
		list: listSel
		getSelected: getSel
		setSelected: setSel
		getEnabled: enabledSel
		useIndex: true
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newDropListFor: aModel list: listSel getSelected: getSel setSelected: setSel getEnabled: enabledSel useIndex: useIndex help: helpText [
	"Answer a drop list for the given model."

	^self theme
		newDropListIn: self
		for: aModel
		list: listSel
		getSelected: getSel
		setSelected: setSel
		getEnabled: enabledSel
		useIndex: useIndex
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newDropListFor: aModel list: listSel getSelected: getSel setSelected: setSel help: helpText [
	"Answer a drop list for the given model."

	^self
		newDropListFor: aModel
		list: listSel
		getSelected: getSel
		setSelected: setSel
		getEnabled: nil
		useIndex: true
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newEditableDropListFor: aModel list: listSel getSelected: getSel setSelected: setSel addToList: addSel class: aClass default: defaultValue ghostText: ghostText getEnabled: enabledSel useIndex: useIndex help: helpText [
	"Answer an editable drop list for the given model."

	^self theme
		newEditableDropListIn: self
		for: aModel
		list: listSel
		getSelected: getSel
		setSelected: setSel
		addToList: addSel
		class: aClass
		default: defaultValue
		ghostText: ghostText
		getEnabled: enabledSel
		useIndex: useIndex
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newEditableDropListFor: aModel list: listSel getSelected: getSel setSelected: setSel addToList: addSel ghostText: ghostText getEnabled: enabledSel help: helpText [
	"Answer an editable drop list for the given model."

	^self theme
		newEditableDropListIn: self
		for: aModel
		list: listSel
		getSelected: getSel
		setSelected: setSel
		addToList: addSel
		class: String
		default: ''
		ghostText: ghostText
		getEnabled: enabledSel
		useIndex: false
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newEmbeddedMenu [
	"Answer a new menu."

	^self theme
		newEmbeddedMenuIn: self
		for: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newExpander: aString [
	"Answer an expander with the given label."

	^self theme
		newExpanderIn: self
		label: aString
		forAll: #()
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newExpander: aString for: aControl [
	"Answer an expander with the given label and control."

	^self theme
		newExpanderIn: self
		label: aString
		forAll: {aControl}
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newExpander: aString forAll: controls [
	"Answer an expander with the given label and controls."

	^self theme
		newExpanderIn: self
		label: aString
		forAll: controls
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newFuzzyLabel: aString [
	"Answer a new fuzzy label."

	^self theme
		newFuzzyLabelIn: self
		for: nil
		label: aString
		offset: 1
		alpha: 0.5
		getEnabled: nil
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newFuzzyLabelFor: aModel label: aString getEnabled: enabledSel [
	"Answer a new fuzzy label."

	^self theme
		newFuzzyLabelIn: self
		for: aModel
		label: aString
		offset: 1
		alpha: 0.5
		getEnabled: enabledSel
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newFuzzyLabelFor: aModel label: aString offset: offset alpha: alpha getEnabled: enabledSel [
	"Answer a new fuzzy label."

	^self theme
		newFuzzyLabelIn: self
		for: aModel
		label: aString
		offset: offset
		alpha: alpha
		getEnabled: enabledSel
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newGroupbox [
	"Answer a plain groupbox."

	^self theme
		newGroupboxIn: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newGroupbox: aString [
	"Answer a groupbox with the given label."

	^self theme
		newGroupboxIn: self
		label: aString
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newGroupbox: aString for: control [
	"Answer a groupbox with the given label and control."

	^self theme
		newGroupboxIn: self
		label: aString
		for: control
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newGroupbox: aString forAll: controls [
	"Answer a groupbox with the given label and controls."

	^self theme
		newGroupboxIn: self
		label: aString
		forAll: controls
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newGroupboxFor: control [
	"Answer a plain groupbox with the given control."

	^self theme
		newGroupboxIn: self
		for: control
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newGroupboxForAll: controls [
	"Answer a plain groupbox with the given controls."

	^self theme
		newGroupboxIn: self
		forAll: controls
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newHSVASelector: aColor help: helpText [
	"Answer a hue-saturation-volume selector with the given color."

	^self theme
		newHSVASelectorIn: self
		color: aColor
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newHSVSelector: aColor help: helpText [
	"Answer a hue-saturation-volume selector with the given color."

	^self theme
		newHSVSelectorIn: self
		color: aColor
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newHueSelector: aModel getHue: getSel setHue: setSel help: helpText [
	"Answer a hue selector with the given selectors."

	^self theme
		newHueSelectorIn: self
		for: aModel
		getHue: getSel
		setHue: setSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newImage: aForm [
	"Answer a new image."

	^self theme
		newImageIn: self
		form: aForm
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newImage: aForm size: aPoint [
	"Answer a new image."

	^self theme
		newImageIn: self
		form: aForm
		size: aPoint
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newImageFor: aModel get: getSel help: helpText [
	"Answer a text entry for the given model."

	^self theme
		newImageIn: self
		for: aModel
		get: getSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newIncrementalSliderFor: aModel getValue: getSel setValue: setSel min: min max: max quantum: quantum getEnabled: enabledSel help: helpText [
	"Answer an inremental slider with the given selectors."

	^self theme
		newIncrementalSliderIn: self
		for: aModel
		getValue: getSel
		setValue: setSel
		min: min
		max: max
		quantum: quantum
		getEnabled: enabledSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newLabel: aString [
	"Answer a new text label."

	^self
		newLabelFor: nil
		label: aString
		getEnabled: nil
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newLabelFor: aModel getLabel: labelSel getEnabled: enabledSel [
	"Answer a new text label."

	^self theme
		newLabelIn: self
		for: aModel
		getLabel: labelSel
		getEnabled: enabledSel
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newLabelFor: aModel label: aString getEnabled: enabledSel [
	"Answer a new text label."

	^self theme
		newLabelIn: self
		for: aModel
		label: aString
		getEnabled: enabledSel
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newLabelGroup: labelsAndControls [
	"Answer a morph laid out with a column of labels and a column of associated controls.
	Controls having a vResizing value of #spaceFill will
	cause their row to use #spaceFill also, otherwise #shrinkWrap."

	^self theme
		newLabelGroupIn: self
		for: labelsAndControls
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newLabelGroup: labelsAndControls font: aFont labelColor: aColor [
	"Answer a morph laid out with a column of labels and a column of associated controls.
	Controls having a vResizing value of #spaceFill will
	cause their row to use #spaceFill also, otherwise #shrinkWrap."

	^self theme
		newLabelGroupIn: self
		for: labelsAndControls
		font: aFont
		labelColor: aColor

]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newListFor: aModel list: listSelector selected: getSelector changeSelected: setSelector getEnabled: enabledSel help: helpText [
	"Answer a list for the given model."

	^self theme
		newListIn: self
		for: aModel
		list: listSelector
		selected: getSelector
		changeSelected: setSelector
		getEnabled: enabledSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newListFor: aModel list: listSelector selected: getSelector changeSelected: setSelector help: helpText [
	"Answer a list for the given model."

	^self
		newListFor: aModel
		list: listSelector
		selected: getSelector
		changeSelected: setSelector
		getEnabled: nil
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newListFor: aModel list: listSelector selected: getSelector changeSelected: setSelector icon: iconSelector getEnabled: enabledSel help: helpText [
	"Answer a list for the given model."

	^self theme
		newListIn: self
		for: aModel
		list: listSelector
		selected: getSelector
		changeSelected: setSelector
		icon: iconSelector
		getEnabled: enabledSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newMenu [
	"Answer a new menu."

	^self theme
		newMenuIn: self
		for: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newMenuFor: aModel [
	"Answer a new menu."

	^self theme
		newMenuIn: self
		for: aModel
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newMorphDropListFor: aModel list: listSel getSelected: getSel setSelected: setSel getEnabled: enabledSel help: helpText [
	"Answer a morph drop list for the given model."

	^self 
		newMorphDropListFor: aModel
		list: listSel
		getSelected: getSel
		setSelected: setSel
		getEnabled: enabledSel
		useIndex: true
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newMorphDropListFor: aModel list: listSel getSelected: getSel setSelected: setSel getEnabled: enabledSel useIndex: useIndex help: helpText [
	"Answer a morph drop list for the given model."

	^self theme
		newMorphDropListIn: self
		for: aModel
		list: listSel
		getSelected: getSel
		setSelected: setSel
		getEnabled: enabledSel
		useIndex: useIndex
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newMorphDropListFor: aModel list: listSel getSelected: getSel setSelected: setSel help: helpText [
	"Answer a morph drop list for the given model."

	^self 
		newMorphDropListFor: aModel
		list: listSel
		getSelected: getSel
		setSelected: setSel
		getEnabled: nil
		useIndex: true
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newMorphListFor: aModel list: listSelector getSelected: getSelector setSelected: setSelector getEnabled: enabledSel help: helpText [
	"Answer a morph list for the given model."

	^self theme
		newMorphListIn: self
		for: aModel
		list: listSelector
		getSelected: getSelector
		setSelected: setSelector
		getEnabled: enabledSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newMorphListFor: aModel list: listSelector getSelected: getSelector setSelected: setSelector help: helpText [
	"Answer a morph list for the given model."

	^self
		newMorphListFor: aModel
		list: listSelector
		getSelected: getSelector
		setSelected: setSelector
		getEnabled: nil
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newMultistateButton [
	"Answer a new multistate button morph.
	To be usable it needs to have fill styles assigned to various states along
	with mouse-up/down actions."
	
	^self theme
		newMultistateButtonIn: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newNoButton [
	"Answer a new No button."

	^self newNoButtonFor: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newNoButtonFor: aModel [
	"Answer a new No button."

	^self theme
		newNoButtonIn: self
		for: aModel
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newOKButton [
	"Answer a new OK button."

	^self newOKButtonFor: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newOKButtonFor: aModel [
	"Answer a new OK button."

	^self
		newOKButtonFor: aModel
		getEnabled: nil
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newOKButtonFor: aModel getEnabled: enabledSel [
	"Answer a new OK button."

	^self theme
		newOKButtonIn: self
		for: aModel
		getEnabled: enabledSel
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newOverflowRowForAll: aCollectionOfMorphs [
	"Answer a new overflow row morph that provides a drop down for
	the given contents that are unable to fit the bounds."
	
	^self theme
		newOverflowRowIn: self
		forAll: aCollectionOfMorphs
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newPanel [
	"Answer a new panel."

	^self theme
		newPanelIn: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newPluggableDialogWindow [
	"Answer a new pluggable dialog."

	^self
		newPluggableDialogWindow: 'Dialog'
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newPluggableDialogWindow: title [
	"Answer a new pluggable dialog with the given content."

	^self
		newPluggableDialogWindow: title
		for: nil
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newPluggableDialogWindow: title for: contentMorph [
	"Answer a new pluggable dialog with the given content."

	^self theme
		newPluggableDialogWindowIn: self
		title: title
		for: contentMorph
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newRadioButtonFor: aModel getSelected: getSel setSelected: setSel getEnabled: enabledSel label: stringOrText help: helpText [
	"Answer a checkbox (radio button appearance) with the given label."

	^self theme
		newRadioButtonIn: self
		for: aModel
		getSelected: getSel
		setSelected: setSel
		getEnabled: enabledSel
		label: stringOrText
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newRadioButtonFor: aModel getSelected: getSel setSelected: setSel label: stringOrText help: helpText [
	"Answer a checkbox (radio button appearance) with the given label."

	^self
		newRadioButtonFor: aModel
		getSelected: getSel
		setSelected: setSel
		getEnabled: nil
		label: stringOrText
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newRow [
	"Answer a morph laid out as a row."

	^self theme
		newRowIn: self
		for: #()
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newRow: controls [
	"Answer a morph laid out with a row of controls."

	^self theme
		newRowIn: self
		for: controls
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newSVSelector: aColor help: helpText [
	"Answer a saturation-volume selector with the given color."

	^self theme
		newSVSelectorIn: self
		color: aColor
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newScrollPaneFor: aMorph [
	"Answer a new scroll pane morph to scroll the given morph."
	
	^self theme
		newScrollPaneIn: self
		for: aMorph
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newSeparator [
	"Answer an horizontal separator."

	^self theme
		newSeparatorIn: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newSliderFor: aModel getValue: getSel setValue: setSel getEnabled: enabledSel help: helpText [
	"Answer a slider with the given selectors."

	^self theme
		newSliderIn: self
		for: aModel
		getValue: getSel
		setValue: setSel
		min: 0
		max: 1
		quantum: nil
		getEnabled: enabledSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newSliderFor: aModel getValue: getSel setValue: setSel help: helpText [
	"Answer a slider with the given selectors."

	^self theme
		newSliderIn: self
		for: aModel
		getValue: getSel
		setValue: setSel
		min: 0
		max: 1
		quantum: nil
		getEnabled: nil
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newSliderFor: aModel getValue: getSel setValue: setSel min: min max: max quantum: quantum getEnabled: enabledSel help: helpText [
	"Answer a slider with the given selectors."

	^self theme
		newSliderIn: self
		for: aModel
		getValue: getSel
		setValue: setSel
		min: min
		max: max
		quantum: quantum
		getEnabled: enabledSel
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newStack [
	"Answer a morph laid out as a stack."

	^self theme
		newStackIn: self
		for: #()
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newStack: controls [
	"Answer a morph laid out with a stack of controls."

	^self theme
		newStackIn: self
		for: controls
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newString: aStringOrText [
	"Answer a new embossed string."

	^self theme
		newStringIn: self
		label: aStringOrText
		font: self theme labelFont
		style: #plain
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newString: aStringOrText font: aFont style: aStyle [
	"Answer a new embossed string."

	^self theme
		newStringIn: self
		label: aStringOrText
		font: aFont
		style: aStyle
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newString: aStringOrText style: aStyle [
	"Answer a new embossed string."

	^self theme
		newStringIn: self
		label: aStringOrText
		font: self theme labelFont
		style: aStyle
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newTabGroup: labelsAndPages [
	"Answer a tab group with the given tab labels associated with pages."

	^self theme
		newTabGroupIn: self
		for: labelsAndPages
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newText: aStringOrText [
	"Answer a new text."

	^self theme
		newTextIn: self
		text: aStringOrText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newTextEditorFor: aModel getText: getSel setText: setSel [
	"Answer a text editor for the given model."

	^self
		newTextEditorFor: aModel
		getText: getSel
		setText: setSel
		getEnabled: nil
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newTextEditorFor: aModel getText: getSel setText: setSel getEnabled: enabledSel  [
	"Answer a text editor for the given model."

	^self 
		newTextEditorFor: aModel
		getText: getSel
		setText: setSel
		getEnabled: enabledSel
		menu: nil
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newTextEditorFor: aModel getText: getSel setText: setSel getEnabled: enabledSel menu: menuSelector [
	"Answer a text editor for the given model."

	^self theme
		newTextEditorIn: self
		for: aModel
		getText: getSel
		setText: setSel
		getEnabled: enabledSel
		menu: menuSelector
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newTextEntryFor: aModel get: getSel set: setSel class: aClass getEnabled: enabledSel help: helpText [
	"Answer a text entry for the given model."

	^self theme
		newTextEntryIn: self
		for: aModel
		get: getSel
		set: setSel
		class: aClass
		getEnabled: enabledSel 
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newTextEntryFor: aModel getText: getSel setText: setSel getEnabled: enabledSel help: helpText [
	"Answer a text entry for the given model."

	^self theme
		newTextEntryIn: self
		for: aModel
		get: getSel
		set: setSel
		class: String
		getEnabled: enabledSel 
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newTextEntryFor: aModel getText: getSel setText: setSel getEnabled: enabledSel help: helpText entryCompletion: anEntryCompletion [

	"Answer a text entry for the given model."

	^self theme
		newTextEntryIn: self
		for: aModel
		get: getSel
		set: setSel
		class: String
		getEnabled: enabledSel 
		help: helpText
		entryCompletion: anEntryCompletion
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newTextEntryFor: aModel getText: getSel setText: setSel help: helpText [
	"Answer a text entry for the given model."

	^self
		newTextEntryFor: aModel
		get: getSel
		set: setSel
		class: String
		getEnabled: nil 
		help: helpText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newTitle: aString for: control [
	"Answer a morph laid out with a column with a title."

	^self theme
		newTitleIn: self
		label: aString
		for: control
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newToolDockingBar [
	"Answer a tool docking bar."

	^self theme
		newToolDockingBarIn: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newToolSpacer [
	"Answer a tool spacer."

	^self theme
		newToolSpacerIn: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newToolbar [
	"Answer a toolbar."

	^self theme
		newToolbarIn: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newToolbar: controls [
	"Answer a toolbar with the given controls."

	^self theme
		newToolbarIn: self
		for: controls
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newToolbarHandle [
	"Answer a toolbar handle."

	^self theme
		newToolbarHandleIn: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newTreeFor: aModel list: listSelector selected: getSelector changeSelected: setSelector [
	"Answer a new tree morph."
	
	^self theme
		newTreeIn: self
		for: aModel
		list: listSelector
		selected: getSelector
		changeSelected: setSelector
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newVerticalSeparator [
	"Answer a vertical separator."

	^self theme
		newVerticalSeparatorIn: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newWindowFor: aModel title: titleString [
	"Answer a new window morph."
	
	^self theme
		newWindowIn: self
		for: aModel
		title: titleString
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newYesButton [
	"Answer a new Yes button."

	^self newYesButtonFor: self
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>newYesButtonFor: aModel [
	"Answer a new yes button."

	^self theme
		newYesButtonIn: self
		for: aModel
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>proceed: aStringOrText [
	"Open a proceed dialog."

	^self proceed: aStringOrText title: 'Proceed' translated
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>proceed: aStringOrText title: aString [
	"Open a proceed dialog and answer true if not cancelled, false otherwise."

	^self theme
		proceedIn: self
		text: aStringOrText
		title: aString
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>question: aStringOrText [
	"Open a question dialog."

	^self question: aStringOrText title: 'Question' translated
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>question: aStringOrText title: aString [
	"Open a question dialog and answer true if yes,
	false if no and nil if cancelled."

	^self theme
		questionIn: self
		text: aStringOrText
		title: aString
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>questionWithoutCancel: aStringOrText [
	"Open a question dialog."

	^self questionWithoutCancel: aStringOrText title: 'Question' translated
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>questionWithoutCancel: aStringOrText title: aString [
	"Open a question dialog and answer true if yes,
	false if no and nil if cancelled."

	^self theme
		questionWithoutCancelIn: self
		text: aStringOrText
		title: aString
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>textEntry: aStringOrText [
	"Open a text entry dialog."

	^self textEntry: aStringOrText title: 'Entry' translated
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>textEntry: aStringOrText title: aString [
	"Open a text entry dialog."

	^self
		textEntry: aStringOrText
		title: aString
		entryText: ''
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>textEntry: aStringOrText title: aString entryText: defaultEntryText [
	"Open a text entry dialog."

	^self theme
		textEntryIn: self
		text: aStringOrText
		title: aString
		entryText: defaultEntryText
]

{
	#category : #theme,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEasilyThemed>>theme [
	"Answer the ui theme that provides controls."

	^ Smalltalk ui theme
]
