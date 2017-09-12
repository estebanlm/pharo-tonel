"
A dark theme for pharo, inspired on 

http://blog.jetbrains.com/blog/2013/06/11/inside-darcula-look-and-feel-an-interview-with-konstantin-bulenkov/

This theme works well with the ""Dark"" text styling. 
You can have ""the full experience"", executing: 

self installFullTheme.
"
Class {
	#name : #Pharo3DarkTheme,
	#superclass : #UIThemeWatery,
	#category : #Polymorph-Widgets-Themes
}

{ #category : #accessing }
Pharo3DarkTheme class >> baseColor [
	^ Color veryDarkGray
]

{ #category : #accessing }
Pharo3DarkTheme class >> basePassiveBackgroundColor [
	^ Color darkGray
]

{ #category : #accessing }
Pharo3DarkTheme class >> baseSelectionColor [
	^ Color r: 97 g: 163 b: 225 range: 255
]

{ #category : #accessing }
Pharo3DarkTheme class >> darkBaseColor [
	^ Color veryDarkGray
]

{ #category : #testing }
Pharo3DarkTheme class >> isAbstract [
	"Answer whether the receiver is considered to be abstract."

	^false
]

{ #category : #accessing }
Pharo3DarkTheme class >> lightBaseColor [
	^ Color darkGray
]

{ #category : #accessing }
Pharo3DarkTheme class >> lightSelectionColor [
	^ Color r: 175 g: 213 b: 250 range: 255
]

{ #category : #settings }
Pharo3DarkTheme class >> newDefaultSettings [
	self setPreferredPreferences.
	
	^super newDefaultSettings
		menuColor: self baseColor;
		menuTitleColor: self baseColor;
		windowColor: self baseColor;
		selectionColor: self lightSelectionColor;
		menuSelectionColor: self baseSelectionColor;
		progressBarColor: self baseColor;
		standardColorsOnly: true;
		autoSelectionColor: false;
		preferRoundCorner: false;
		fadedBackgroundWindows: false;
		secondarySelectionColor: self veryLightSelectionColor;
		flatMenu: true
]

{ #category : #settings }
Pharo3DarkTheme class >> setPreferredPreferences [
	"NECPreferences 
		expandPrefixes: true;
		popupShowWithShortcut: Character tab asShortcut."
]

{ #category : #accessing }
Pharo3DarkTheme class >> themeName [
	^ 'Pharo3 Dark'
]

{ #category : #accessing }
Pharo3DarkTheme class >> veryLightSelectionColor [
	^ self lightSelectionColor muchLighter
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> backgroundColor [
	^ Color r: 0.130 g: 0.130 b: 0.130
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> balloonBackgroundColor [

	^Color veryDarkGray lighter
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> borderColor [ 
	^ Color darkGray darker darker darker
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> buttonColor [
	^ self backgroundColor lighter lighter
]

{ #category : #border-styles-buttons }
Pharo3DarkTheme >> buttonCornerStyleIn: aThemedMorph [
	"If asked, we only allow square corners"
	
	^ #square
]

{ #category : #label-styles }
Pharo3DarkTheme >> buttonLabelForText: aTextOrString [
	"Answer the label to use for the given text."
	^aTextOrString isString
		ifTrue: [(LabelMorph contents: aTextOrString) color: self textColor ]
		ifFalse: [super buttonLabelForText: aTextOrString]
]

{ #category : #border-styles-buttons }
Pharo3DarkTheme >> buttonNormalBorderStyleFor: aButton [
	"Return the normal button borderStyle for the given button."
	
	(aButton valueOfProperty: #noBorder ifAbsent: [ false ]) 
		ifTrue: [ 
			^ SimpleBorder new 
				width: 0; 
				baseColor: Color transparent ].
	
	^ SimpleBorder new
		width: 1;
		baseColor: self buttonColor lighter
]

{ #category : #fill-styles-buttons }
Pharo3DarkTheme >> buttonNormalFillStyleFor: aButton [
	"Return the normal button fillStyle for the given button."
	
	(aButton valueOfProperty: #noFill ifAbsent: [false]) 
		ifTrue: [ ^ SolidFillStyle color: Color transparent ].
		
	^ SolidFillStyle color: self buttonColor.
]

{ #category : #fill-styles-buttons }
Pharo3DarkTheme >> buttonSelectedFillStyleFor: aButton [
	"Return the normal button fillStyle for the given button."
	
	^ SolidFillStyle color: self selectionColor.
	"| top bottom |
	
	top := self secondarySelectionColor.
	bottom := self selectionColor.

	^(GradientFillStyle ramp: {
			0.0->top.
			0.7->bottom.})
		origin: aButton bounds origin;
		direction: 0 @ aButton height;
		radial: false"
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> caretColor [
	^ Color lightBlue.
]

{ #category : #forms }
Pharo3DarkTheme >> checkboxForm [
	"Answer the form to use for a normal checkbox."

	^self  checkboxUnselectedForm
]

{ #category : #forms }
Pharo3DarkTheme >> checkboxSelectedForm [
	"Answer the form to use for a selected checkbox."

	^ self iconNamed: #checkboxSelectedForm
]

{ #category : #forms }
Pharo3DarkTheme >> checkboxUnselectedForm [
	"Answer the form to use for a selected checkbox."

	^ self iconNamed: #checkboxUnselectedForm
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> classExtensionColor [
	^ Color gray lighter lighter
]

{ #category : #configure }
Pharo3DarkTheme >> configureMorphTreeMorph: aMorph [
	aMorph preferedPaneColor: self backgroundColor.
	aMorph 
		rowColorForEven: self backgroundColor
		odd: self backgroundColor.
]

{ #category : #configure }
Pharo3DarkTheme >> configurePluggableTextMorph: textMorph [ 
	textMorph 	
		color: self backgroundColor;
		textColor: self textColor;
		borderWidth: 1.
]

{ #category : #configure }
Pharo3DarkTheme >> configureScrollPane: aMorph [ 
	"aMorph color: self backgroundColor"
]

{ #category : #configure }
Pharo3DarkTheme >> configureSystemWindow: aWindow [
	
]

{ #category : #configure }
Pharo3DarkTheme >> configureTextMorph: textMorph [ 
	textMorph 
		"backgroundColor: self backgroundColor;"
		color: self textColor.
]

{ #category : #'watcher window' }
Pharo3DarkTheme >> configureWatcherWindowLabelAreaFor: aWindow [
	"Configure the label area for the given Watcher window."

	|padding|
	padding := 0.
	aWindow labelArea
		addMorphBack: (Morph new extent: aWindow class borderWidth @ 0).
	aWindow hasCloseBox ifTrue: [aWindow addCloseBox. padding := padding + 1].
"	aWindow hasCollapseBox ifTrue: [aWindow addCollapseBox. padding := padding + 1].
	aWindow hasExpandBox ifTrue: [aWindow addExpandBox. padding := padding + 1].
	aWindow hasMenuBox ifTrue: [padding := padding - 1].
"	aWindow labelArea
		addMorphBack: (Morph new extent: aWindow class borderWidth @ 0; hResizing: #spaceFill).
	aWindow basicLabel ifNotNil: [:label | aWindow labelArea addMorphBack: label; hResizing: #shrinkWrap].
	aWindow labelArea
		addMorphBack: (Morph new extent: aWindow class borderWidth @ 0; hResizing: #spaceFill).
	padding > 0 ifTrue: [
		aWindow labelArea
			addMorphBack: (Morph new extent: (aWindow boxExtent x * padding) @ 0)].
"	aWindow hasMenuBox ifTrue: [aWindow addMenuControl]."
	aWindow labelArea
		addMorphBack: (Morph new extent: aWindow class borderWidth @ 0)
]

{ #category : #border-styles }
Pharo3DarkTheme >> configureWindowBorderFor: aWindow [
"	super configureWindowBorderFor: aWindow.
	aWindow roundedCorners: #()"
	| aStyle |
	
	aStyle := 
		SimpleBorder new 
			color: self borderColor;
			width: 1.
			
	aWindow borderStyle: aStyle.
]

{ #category : #border-styles }
Pharo3DarkTheme >> configureWindowDropShadowFor: aWindow [

	aWindow hasDropShadow: false
]

{ #category : #label-styles }
Pharo3DarkTheme >> configureWindowLabelAreaFor: aWindow [
	"Configure the label area for the given window."

	|padding|
	padding := 0.
	aWindow labelArea
		addMorphBack: (Morph new extent: aWindow class borderWidth @ 0).
	aWindow hasCloseBox ifTrue: [aWindow addCloseBox. padding := padding + 1].
	aWindow hasCollapseBox ifTrue: [aWindow addCollapseBox. padding := padding + 1].
	aWindow hasExpandBox ifTrue: [aWindow addExpandBox. padding := padding + 1].
	aWindow hasMenuBox ifTrue: [padding := padding - 1].
	aWindow labelArea
		addMorphBack: (Morph new extent: aWindow class borderWidth @ 0; hResizing: #spaceFill).
	aWindow basicLabel ifNotNil: [:label | 
		label color: self textColor.
		aWindow labelArea 
			addMorphBack: label; 
			hResizing: #shrinkWrap ].
	aWindow labelArea
		addMorphBack: (Morph new extent: aWindow class borderWidth @ 0; hResizing: #spaceFill).
	padding > 0 ifTrue: [
		aWindow labelArea
			addMorphBack: (Morph new extent: (aWindow boxExtent x * padding) @ 0)].
	aWindow hasMenuBox ifTrue: [aWindow addMenuControl].
	aWindow labelArea
		addMorphBack: (Morph new extent: aWindow class borderWidth @ 0)
]

{ #category : #fill-styles-buttons }
Pharo3DarkTheme >> controlButtonNormalFillStyleFor: aButton [
	"Return the normal control button fillStyle for the given button.
	Control buttons are generally used for drop-lists and expanders."
	
	^self buttonNormalFillStyleFor: aButton
]

{ #category : #label-styles }
Pharo3DarkTheme >> createMenuBoxFor: aSystemWindow [
	"Answer a button for the window menu."
	
"	^aSystemWindow createBox
		labelGraphic: (self windowMenuIconFor: aSystemWindow);
		extent: aSystemWindow boxExtent;
		actWhen: #buttonDown;
		actionSelector: #offerWindowMenu;
		setBalloonText: 'window menu' translated"
	
	|form msb|
	form := self windowMenuForm.
	msb := MultistateButtonMorph new extent: form extent.
	msb activeEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowMenuPassiveForm.
	msb extent: form extent.
	msb activeDisabledNotOverUpFillStyle: (ImageFillStyle form: form).
	msb passiveEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	msb passiveDisabledNotOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowMenuForm.
	msb extent: form extent.
	msb
		activeEnabledOverUpFillStyle: (ImageFillStyle form: form);
		passiveEnabledOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowMenuPassiveForm.
	msb
		extent: form extent;
		activeEnabledOverDownFillStyle: (ImageFillStyle form: form);
		passiveEnabledOverDownFillStyle: (ImageFillStyle form: form);
		addUpAction: [aSystemWindow offerWindowMenu];
		setBalloonText: 'window menu' translated;
		extent: aSystemWindow boxExtent.
	^msb
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> dangerTextColor [
	^ Color
		r: 239
		g: 83
		b: 80
		range: 255
]

{ #category : #fill-styles }
Pharo3DarkTheme >> desktopColor [

	^Color darkGray darker
]

{ #category : #defaults }
Pharo3DarkTheme >> dialogWindowPreferredCornerStyleFor: aDialogWindow [
	"Answer the preferred corner style for the given dialog."

	^ self windowPreferredCornerStyleFor:aDialogWindow
]

{ #category : #basic-colors-diffs }
Pharo3DarkTheme >> diffAdditionalLineBackgroundColor [
	"Answer the color used to highlight additional text lines in a diff view."
	^ Color r: 0.0 g: 0.76 b: 0.0 alpha: 0.2
]

{ #category : #basic-colors-diffs }
Pharo3DarkTheme >> diffEdgeColor [
	"Answer the color used to show the border of the changes."
	^ Color white alpha: 0.5
]

{ #category : #basic-colors-diffs }
Pharo3DarkTheme >> diffModificatedLineBackgroundColor [
	"Answer the color used to highlight changed text lines in a diff view."
	^ Color gray alpha: 0.2
]

{ #category : #basic-colors-diffs }
Pharo3DarkTheme >> diffRemovedLinesBackgroundColor [
	"Answer the color used to highlight removed text lines in a diff view."
	^ Color r: 0.84 g: 0.0 b: 0.0 alpha: 0.2
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> disabledColor [ 
	^ Color gray lighter
]

{ #category : #fill-styles }
Pharo3DarkTheme >> dockingBarNormalFillStyleFor: aToolDockingBar [
	^ SolidFillStyle color: Color transparent
]

{ #category : #fill-styles }
Pharo3DarkTheme >> dropListDisabledFillStyleFor: aDropList [
	"Return the disabled fillStyle for the given drop list."
	
	^ self textEditorDisabledFillStyleFor: aDropList
]

{ #category : #border-styles }
Pharo3DarkTheme >> dropListNormalBorderStyleFor: aDropList [
	"Return the normal borderStyle for the given drop list"

	^ self buttonNormalBorderStyleFor: aDropList
]

{ #category : #fill-styles }
Pharo3DarkTheme >> dropListNormalFillStyleFor: aDropList [
	"Return the normal fillStyle for the given drop list."
	
	^ self backgroundColor
]

{ #category : #border-styles }
Pharo3DarkTheme >> dropListNormalListBorderStyleFor: aDropList [
	"Return the normal borderStyle for the list of the given given drop list"

	^BorderStyle inset
		width: 1;
		baseColor: self buttonColor lighter.
]

{ #category : #fill-styles }
Pharo3DarkTheme >> dropListNormalListFillStyleFor: aDropList [
	"Return the normal fillStyle for the list of the given drop list."
	
	^ self backgroundColor
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> enabledColor [ 
	^ self textColor
]

{ #category : #basic-colors }
Pharo3DarkTheme >> errorPopperBackgroundColor [
	^ Color red muchDarker 
]

{ #category : #fill-styles }
Pharo3DarkTheme >> expanderTitleNormalFillStyleFor: anExpanderTitle [
	"Return the normal expander title fillStyle for the given expander title."
	
	^ self buttonNormalFillStyleFor: anExpanderTitle
]

{ #category : #private }
Pharo3DarkTheme >> glamorousBaseColorFor: aButton [
	^ self class baseColor
	"unfortunately, it looks like paneColor does not always return the wanted color"
	"aButton paneColorOrNil ifNil: [Color r: 200 g: 200 b: 200 range: 255]"
]

{ #category : #private }
Pharo3DarkTheme >> glamorousBasePassiveBackgroundColorFor: aButton [
	^ self class basePassiveBackgroundColor
]

{ #category : #private }
Pharo3DarkTheme >> glamorousBaseSelectionColorFor: aButton [
	^ self class baseSelectionColor
]

{ #category : #private }
Pharo3DarkTheme >> glamorousDarkBaseColorFor: aButton [
	^ self class darkBaseColor
]

{ #category : #private }
Pharo3DarkTheme >> glamorousLightColorFor: aButton [
	^ self class lightBaseColor
]

{ #category : #private }
Pharo3DarkTheme >> glamorousLightSelectionColorFor: aMorph [
	^ self class lightSelectionColor
]

{ #category : #private }
Pharo3DarkTheme >> glamorousNormalFillStyleFor: aMorph height: anInteger [
	"Return the normal button fillStyle for the given button."
	
"	| baseColor |
	baseColor := self glamorousBaseColorFor: aMorph.
	^ self glamorousNormalFillStyleWithBaseColor: baseColor for: aMorph height: anInteger
"

	^ SolidFillStyle color: (self glamorousLightColorFor: aMorph)
]

{ #category : #private }
Pharo3DarkTheme >> glamorousNormalFillStyleWithBaseColor: aColor for: aMorph height: anInteger [	
	| top bottom |
	top := aColor darker.
	bottom := aColor.
	^(GradientFillStyle ramp: {
			0.0->top.
			0.7->bottom.})
		origin: aMorph bounds origin;
		direction: 0 @ anInteger;
		radial: false
]

{ #category : #border-styles }
Pharo3DarkTheme >> groupPanelBorderStyleFor: aGroupPanel [
	"Answer the normal border style for a group panel."

	^ SimpleBorder new
		width: 1;
		baseColor: ((self glamorousBaseColorFor: aGroupPanel))
]

{ #category : #'growl - specific' }
Pharo3DarkTheme >> growlBorderColorFor: aGrowlMorph [
	^ Color white alpha: 0.5
]

{ #category : #'growl - specific' }
Pharo3DarkTheme >> growlDismissHandleFor: aGrowlMorph [
	| form image |
	form := self windowCloseForm.
	image := ImageMorph new.
	image image: form.
	image color: Color yellow.
	^ image
]

{ #category : #'growl - specific' }
Pharo3DarkTheme >> growlFillColorFor: aGrowlMorph [
	^ Color darkGray alpha: 0.5
]

{ #category : #'growl - specific' }
Pharo3DarkTheme >> growlLabelColorFor: aGrowlMorph [
	^ Color white twiceDarker
]

{ #category : #initialize-release }
Pharo3DarkTheme >> initialize [
	"self beCurrent"

	super initialize.
	self windowActiveDropShadowStyle: #diffuse.
	self settings preferGradientFill: false.
]

{ #category : #initialize-release }
Pharo3DarkTheme >> initializeForms [
	"Initialize the receiver's image forms."

	|inactiveForm|
	super initializeForms.
	inactiveForm := self newWindowInactiveControlForm.
	self forms
		at: #windowCloseOver put: self newWindowCloseOverForm;
		at: #windowMinimizeOver put: self newWindowMinimizeOverForm;
		at: #windowMaximizeOver put: self newWindowMaximizeOverForm;
		at: #windowClosePassive put: inactiveForm;
		at: #windowMinimizePassive put: inactiveForm;
		at: #windowMaximizePassive put: inactiveForm
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> lessConspicuousColorFrom: aColor [

	^	aColor slightlyLighter
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> lightBackgroundColor [ 
	^ Color r: 0.218 g: 0.217 b: 0.217
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> lineNumberColor [ 
	^ Color gray lighter lighter
]

{ #category : #fill-styles }
Pharo3DarkTheme >> listDisabledFillStyleFor: aList [
	"Return the disabled fillStyle for the given list."
	
	^ self textEditorDisabledFillStyleFor: aList
]

{ #category : #fill-styles }
Pharo3DarkTheme >> listNormalFillStyleFor: aList [
	"Return the normal fillStyle for the given list."
	
	^ self backgroundColor
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> listTextColor [
	"Answer the list text color to use."

	^ self textColor
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> menuBorderColor [
	^ self borderColor
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> menuBorderWidth [
	^ self borderWidth
]

{ #category : #defaults }
Pharo3DarkTheme >> menuItemDisabledTextColorFor: aMenuItem [

	^ Color lightGray
]

{ #category : #fill-styles-buttons }
Pharo3DarkTheme >> menuItemInDockingBarSelectedFillStyleFor: aMenuItem [
	"Answer the selected fill style to use for the given menu item that is in a docking bar."
	^ self buttonSelectedFillStyleFor: aMenuItem
]

{ #category : #forms }
Pharo3DarkTheme >> menuPinForm [
	"Answer the form to use for the pin button of a menu."

	^ self iconNamed: #menuPinForm
]

{ #category : #fill-styles }
Pharo3DarkTheme >> morphTreeSplitterNormalFillStyleFor: aSplitter [	
	^ self splitterNormalFillStyleFor: aSplitter
]

{ #category : #fill-styles }
Pharo3DarkTheme >> morphTreeSplitterPressedFillStyleFor: aSplitter [	
	^ self splitterPressedFillStyleFor: aSplitter
]

{ #category : #forms }
Pharo3DarkTheme >> newCheckboxMarkerForm [
	"Answer a new checkbox marker form."

	^ self iconNamed: #checkboxMarkerForm
]

{ #category : #'morph creation' }
Pharo3DarkTheme >> newFocusIndicatorMorphFor: aMorph [
	"Answer a new focus indicator for the given morph."

	^ BorderedMorph new
		fillStyle: Color transparent;
		borderStyle: (SimpleBorder new
			 width: 1;
			baseColor: (self glamorousBaseSelectionColorFor: aMorph));
		bounds: aMorph focusBounds
]

{ #category : #forms }
Pharo3DarkTheme >> newRadioButtonMarkerForm [
	"Answer a new radio button marker form. We make it empty because we already have the selected radio button take care of the state."

	^ self iconNamed: #radioButtonMarkerForm
]

{ #category : #initialize-release }
Pharo3DarkTheme >> newRadioMarkerForm [
	"Answer a new checkbox marker form."

	^Form extent: 12@12 depth: 32
]

{ #category : #forms }
Pharo3DarkTheme >> newWindowCloseForm [
	"Answer a new form for a window close box."

	^ self iconNamed: #windowCloseForm
]

{ #category : #forms }
Pharo3DarkTheme >> newWindowCloseOverForm [
	"Answer a new form for a window menu box."

	^ self newWindowCloseForm
]

{ #category : #forms }
Pharo3DarkTheme >> newWindowMaximizeForm [
	"Answer a new form for a window maximize box."

	^ self iconNamed: #windowMaximizeForm
]

{ #category : #forms }
Pharo3DarkTheme >> newWindowMaximizeOverForm [
	"Answer a new form for a window menu box."

	^ self newWindowMaximizeForm
]

{ #category : #forms }
Pharo3DarkTheme >> newWindowMenuForm [
	"Answer a new form for a window menu box."

	^ self iconNamed: #windowMenuForm
]

{ #category : #forms }
Pharo3DarkTheme >> newWindowMenuPassiveForm [
	"Answer a new form for a window menu box."

	^ self iconNamed: #windowMenuInactiveForm
]

{ #category : #forms }
Pharo3DarkTheme >> newWindowMinimizeForm [
	"Answer a new form for a window minimize box."

	^ self iconNamed: #windowMinimizeForm
]

{ #category : #forms }
Pharo3DarkTheme >> newWindowMinimizeOverForm [
	"Answer a new form for a window menu box."

	^ self newWindowMinimizeForm
]

{ #category : #border-styles }
Pharo3DarkTheme >> plainGroupPanelBorderStyleFor: aGroupPanel [
	"Answer the normal border style for a plain group panel."

	^SimpleBorder new
		width: 1;
		baseColor: Color transparent
]

{ #category : #fill-styles }
Pharo3DarkTheme >> progressBarFillStyleFor: aProgressBar [
	^ self glamorousBasePassiveBackgroundColorFor: aProgressBar
]

{ #category : #fill-styles }
Pharo3DarkTheme >> progressBarProgressFillStyleFor: aProgressBar [
	^ (self glamorousLightSelectionColorFor: aProgressBar)
]

{ #category : #fill-styles }
Pharo3DarkTheme >> progressFillStyleFor: aProgress [
	"Return the progress fillStyle for the given progress morph."
	^ self windowActiveFillStyleFor: aProgress  
]

{ #category : #forms }
Pharo3DarkTheme >> radioButtonForm [
	"Answer the form to use for a normal radio button."

	^ self iconNamed: #radioButtonUnselectedForm
]

{ #category : #forms }
Pharo3DarkTheme >> radioButtonSelectedForm [
	"Answer the form to use for a selected radio button."

	^ self iconNamed: #radioButtonSelectedForm
]

{ #category : #scrollbars }
Pharo3DarkTheme >> scrollBarButtonArrowVertices: aRectangle [ 
	^ self verticesForSimpleArrow: aRectangle
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> scrollbarColor [ 
	^ self buttonColor
]

{ #category : #fill-styles-scrollbars }
Pharo3DarkTheme >> scrollbarNormalButtonFillStyleFor: aScrollbar [
	"Return the normal scrollbar button fillStyle for the given scrollbar."
	
	^ self scrollbarNormalThumbFillStyleFor: aScrollbar
]

{ #category : #border-styles-scrollbars }
Pharo3DarkTheme >> scrollbarNormalFillStyleFor: aScrollbar [
	"Return the normal scrollbar fillStyle for the given scrollbar."
	
	^ SolidFillStyle color: self backgroundColor lighter.
]

{ #category : #border-styles-scrollbars }
Pharo3DarkTheme >> scrollbarNormalThumbBorderStyleFor: aScrollbar [
	"Return the normal thumb borderStyle for the given scrollbar."

	^ BorderStyle simple
		width: 0;
		baseColor: Color transparent
]

{ #category : #fill-styles-scrollbars }
Pharo3DarkTheme >> scrollbarNormalThumbFillStyleFor: aScrollbar [
	"Return the normal scrollbar fillStyle for the given scrollbar."
	^ self glamorousNormalFillStyleFor: aScrollbar height: aScrollbar height
]

{ #category : #border-styles-scrollbars }
Pharo3DarkTheme >> scrollbarPagingAreaCornerStyleIn: aThemedMorph [	
	^#square
]

{ #category : #border-styles-scrollbars }
Pharo3DarkTheme >> scrollbarPressedThumbFillStyleFor: aScrollbar [
	"Return the normal scrollbar button fillStyle for the given scrollbar."
	
	^ self buttonSelectedFillStyleFor: aScrollbar
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> secondarySelectionColor [
	^ Color r: 0.31 g: 0.31 b: 0.36
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> selectionColor [
	^ Color r: 16r07 g: 16r63 b: 16rAD range: 255
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> selectionTextColor [
	^ Color r: 16rE0 g: 16rE2 b: 16rE4 range: 255
]

{ #category : #fill-styles }
Pharo3DarkTheme >> separatorFillStyleFor: aSeparator [
	"Return the separator fillStyle for the given separator."
	
	^ SolidFillStyle color: (self glamorousBaseColorFor: aSeparator) darker
]

{ #category : #defaults }
Pharo3DarkTheme >> shStyleTable [

	^SHTextStylerST80 darkStyleTable
]

{ #category : #fill-styles }
Pharo3DarkTheme >> sliderDisabledFillStyleFor: aSlider [
	"Return the disabled fillStyle for the given slider."
	
	^ self textEditorDisabledFillStyleFor: aSlider
]

{ #category : #fill-styles }
Pharo3DarkTheme >> splitterNormalFillStyleFor: aSplitter [
	"Return the normal splitter fillStyle for the given splitter."
	
	^ SolidFillStyle color: Color transparent
]

{ #category : #fill-styles }
Pharo3DarkTheme >> splitterPressedFillStyleFor: aSplitter [
	"Return the pressed splitter fillStyle for the given splitter."
	
	|aColor|
	aColor := self glamorousBaseColorFor: aSplitter.
	^ (GradientFillStyle ramp: {0.0->aColor lighter. 0.9-> aColor})
		origin: aSplitter topLeft;
		direction: (aSplitter splitsTopAndBottom
			ifTrue: [0 @ aSplitter height]
			ifFalse: [aSplitter width @ 0]);
		radial: false
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> spotlightWindowColor [ 
	^ self windowColor
]

{ #category : #basic-colors }
Pharo3DarkTheme >> subgroupColorFrom: paneColor [
	"Answer the colour for a subgroup given the pane colour."

	^ self glamorousLightColorFor: paneColor" self class baseColor"
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> successTextColor [
	^ Color green darker darker darker
]

{ #category : #border-styles }
Pharo3DarkTheme >> tabLabelNormalBorderStyleFor: aTabLabel [
"	^SimpleBorder new
		width: 0;
		baseColor: (self buttonBaseColorFor: aTabLabel) darker
"	^ self buttonNormalBorderStyleFor: aTabLabel
]

{ #category : #fill-styles-buttons }
Pharo3DarkTheme >> tabLabelNormalFillStyleFor: aTabLabel [
	^ self buttonNormalFillStyleFor: aTabLabel 
]

{ #category : #fill-styles-buttons }
Pharo3DarkTheme >> tabLabelSelectedFillStyleFor: aTabLabel [
	^ self buttonSelectedFillStyleFor: aTabLabel 
]

{ #category : #border-styles }
Pharo3DarkTheme >> tabPanelBorderStyleFor: aTabGroup [
	^ Pharo3TabPanelBorder new 
		width: 1;
		baseColor: ((self glamorousDarkBaseColorFor: aTabGroup));
		tabSelector: aTabGroup tabSelectorMorph
]

{ #category : #basic-colors }
Pharo3DarkTheme >> taskbarButtonLabelColorFor: aButton [
	"Answer the colour for the label of the given taskbar button."

	^aButton model
		ifNil: [super taskbarButtonLabelColorFor: aButton]
		ifNotNil: [:win |
			win isActive
				ifTrue: [Color black]
				ifFalse: [Color gray darker]]
]

{ #category : #basic-colors }
Pharo3DarkTheme >> taskbarButtonLabelColorForCollapsed: aButton [
	"Answer the colour for the label of the given taskbar button, given that the corresponding window is collapsed."

	^ self textColor
]

{ #category : #basic-colors }
Pharo3DarkTheme >> taskbarButtonLabelColorForExpanded: aButton [
	"Answer the colour for the label of the given taskbar button, given that the corresponding window is expanded."

	^ self textColor
]

{ #category : #fill-styles }
Pharo3DarkTheme >> taskbarFillStyleFor: aTaskbar [
	^ "self buttonNormalFillStyleFor: aTaskbar"
	SolidFillStyle color: Color transparent 
]

{ #category : #border-styles }
Pharo3DarkTheme >> taskbarThumbnailCornerStyleFor: aMorph [
	"Answer the corner style for the taskbar thumbnail/tasklist."
	
	^#square
]

{ #category : #border-styles }
Pharo3DarkTheme >> taskbarThumbnailNormalBorderStyleFor: aWindow [
	^ self buttonNormalBorderStyleFor: aWindow
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> textColor [
	^ Color white
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> textColorForNonStandardBackground [
	^ Color black
]

{ #category : #fill-styles }
Pharo3DarkTheme >> textEditorDisabledFillStyleFor: aTextEditor [
	"Return the disabled fillStyle for the given text editor."
	
	^self glamorousBasePassiveBackgroundColorFor: aTextEditor
]

{ #category : #border-styles }
Pharo3DarkTheme >> textEditorNormalBorderStyleFor: aTextEditor [
	"Return the normal text editor borderStyle for the given text editor."

	^self buttonNormalBorderStyleFor: aTextEditor
]

{ #category : #fill-styles }
Pharo3DarkTheme >> textEditorNormalFillStyleFor: aTextEditor [
	^ self backgroundColor
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> unfocusedSelectionColor [
	^ self secondarySelectionColor
]

{ #category : #'accessing colors' }
Pharo3DarkTheme >> warningTextColor [
	^ Color yellow darker darker
]

{ #category : #'watcher window' }
Pharo3DarkTheme >> watcherWindowActiveFillStyleFor: aWindow [

	^ SolidFillStyle color: (Color veryVeryLightGray alpha: 0.6)
]

{ #category : #'watcher window' }
Pharo3DarkTheme >> watcherWindowInactiveFillStyleFor: aWindow [

	^ SolidFillStyle color: (Color veryVeryLightGray alpha: 0.6)
]

{ #category : #fill-styles }
Pharo3DarkTheme >> windowActiveFillStyleFor: aWindow [
	"We do not want the lighting effect when the window goes inactive"
	^SolidFillStyle color: self class baseColor
]

{ #category : #fill-styles }
Pharo3DarkTheme >> windowActiveLabelFillStyleFor: aWindow [
	^ self textColor
]

{ #category : #fill-styles }
Pharo3DarkTheme >> windowActiveTitleFillStyleFor: aWindow [
	"self glamorousNormalFillStyleFor: aWindow height: aWindow labelHeight"
	^ SolidFillStyle color: Color transparent
]

{ #category : #forms }
Pharo3DarkTheme >> windowClosePassiveForm [
	"Answer the form to use for passive (background) window close buttons"

	^ self iconNamed: #windowCloseInactiveForm
]

{ #category : #fill-styles }
Pharo3DarkTheme >> windowInactiveFillStyleFor: aWindow [
	"We do not want the lighting effect when the window goes inactive"
	^self windowActiveFillStyleFor: aWindow
]

{ #category : #fill-styles }
Pharo3DarkTheme >> windowInactiveTitleFillStyleFor: aWindow [
	"We do not want the lighting effect when the window goes inactive"
	^ SolidFillStyle color: Color transparent
]

{ #category : #label-styles }
Pharo3DarkTheme >> windowLabelForText: aTextOrString [
	^ (super windowLabelForText: aTextOrString)
		color: self textColor;
		yourself.
]

{ #category : #forms }
Pharo3DarkTheme >> windowMaximizePassiveForm [
	"Answer the form to use for passive (background) window maximize/restore buttons"

	^ self iconNamed: #windowMaximizeInactiveForm
]

{ #category : #label-styles }
Pharo3DarkTheme >> windowMenuPassiveForm [
	"Answer the form to use for passive (background) window menu buttons"

	^self newWindowMenuPassiveForm
]

{ #category : #forms }
Pharo3DarkTheme >> windowMinimizePassiveForm [
	"Answer the form to use for passive (background) window minimize buttons"

	^ self iconNamed: #windowMinimizeInactiveForm
]

{ #category : #defaults }
Pharo3DarkTheme >> windowShadowColor [
	"Answer the window shadow color to use."

	^ Color gray
]
