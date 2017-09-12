"
The theme is developed in the context of the Glamour project, and its goal is to create a look that:
- does not look like a specific operating system. In particular, the icons should be operating system agnostic, because, for example, people in Windows are confused by the red, yellow, green buttons of apple.
- uses a limited amount of colors and effects.
- is fast.

self defaultSettings: nil.
self beCurrent. 

Is adopted as the theme for Pharo3, but it was renamed to avoid collisions with the glamour team,
"
Class {
	#name : #Pharo3Theme,
	#superclass : #UIThemeWatery,
	#category : #Polymorph-Widgets-Themes
}

{ #category : #accessing }
Pharo3Theme class >> baseColor [
	^ Color r: 210 g: 210 b: 210 range: 255
]

{ #category : #accessing }
Pharo3Theme class >> basePassiveBackgroundColor [
	^ Color r: 245 g: 245 b: 245 range: 255
]

{ #category : #accessing }
Pharo3Theme class >> baseSelectionColor [
	^ Color r: 97 g: 163 b: 225 range: 255
]

{ #category : #accessing }
Pharo3Theme class >> darkBaseColor [
	^ Color r: 200 g: 200 b: 200 range: 255
]

{ #category : #testing }
Pharo3Theme class >> isAbstract [
	"Answer whether the receiver is considered to be abstract."

	^false
]

{ #category : #accessing }
Pharo3Theme class >> lightBaseColor [
	^ Color r: 230 g: 230 b: 230 range: 255
]

{ #category : #accessing }
Pharo3Theme class >> lightSelectionColor [
	^ Color r: 175 g: 213 b: 250 range: 255
]

{ #category : #settings }
Pharo3Theme class >> newDefaultSettings [
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
Pharo3Theme class >> setPreferredPreferences [
	"NECPreferences 
		expandPrefixes: true;
		popupShowWithShortcut: Character tab asShortcut."
]

{ #category : #settings }
Pharo3Theme class >> setPreferredShoutColors [
	"self setPreferredShoutColors"

	SHTextStylerST80 styleTable: 
		#(
			"(symbol color [emphasisSymbolOrArray [textStyleName [pixelHeight]]])" 
			(default 								black)
			(invalid 									red)
			(excessCode 							red)
			(comment 								(gray darker))
			(unfinishedComment 					(red muchDarker))
			(#'$' 									(red muchDarker))
			(character 								(red muchDarker))
			(integer 								(red muchDarker))
			(number 								(red muchDarker)) 
			(#- 										(red muchDarker))
			(symbol 								(magenta muchDarker)) 
			(stringSymbol 							(magenta muchDarker)) 
			(literalArray 							(magenta muchDarker))
			(string 									(magenta muchDarker) normal)
			(unfinishedString 						red normal)
			(assignment 							nil)
			(ansiAssignment 						nil)
			(literal 									nil italic)
			(keyword 								(black))
			(binary 									(black)) 
			(unary 									(black))
			(incompleteKeyword 					red)
			(incompleteBinary 						red) 
			(incompleteUnary 						red )
			(undefinedKeyword 					red)
			(undefinedBinary 						red) 
			(undefinedUnary 						red) 
			(patternKeyword 						nil bold)
			(patternBinary 							nil bold)
			(patternUnary 							nil bold) 
			(#self 									(cyan muchDarker ))
			(#super 								(cyan muchDarker ))
			(#true 									(red muchDarker))
			(#false 									(red muchDarker))
			(#nil 									(red muchDarker))
			(#thisContext 							(cyan muchDarker ))
			(#return 								(cyan muchDarker ) bold)
			(patternArg 							(blue muchDarker)) 
			(methodArg 							(blue muchDarker))
			(blockPatternArg 						(blue muchDarker))
			(blockArg 								(blue muchDarker))
			(argument 								(blue muchDarker))
			(blockArgColon 						black)
			(leftParenthesis 						black)
			(rightParenthesis 						black)
			(leftParenthesis1 						(green muchDarker))
			(rightParenthesis1 						(green muchDarker))
			(leftParenthesis2 						(magenta muchDarker))
			(rightParenthesis2 						(magenta muchDarker))
			(leftParenthesis3 						(red muchDarker))
			(rightParenthesis3 						(red muchDarker))
			(leftParenthesis4 						(green darker))
			(rightParenthesis4 						(green darker))
			(leftParenthesis5 						(orange darker))
			(rightParenthesis5 						(orange darker))
			(leftParenthesis6 						(magenta darker))
			(rightParenthesis6 						(magenta darker))
			(leftParenthesis7 						blue)
			(rightParenthesis7 						blue)
			(blockStart 								black)
			(blockEnd 								black)
			(blockStart1 							(green muchDarker))
			(blockEnd1 								(green muchDarker))
			(blockStart2 							(magenta muchDarker))
			(blockEnd2 								(magenta muchDarker))
			(blockStart3 							(red muchDarker))
			(blockEnd3 								(red muchDarker))
			(blockStart4 							(green darker))
			(blockEnd4 								(green darker))
			(blockStart5 							(orange darker))
			(blockEnd5 								(orange darker))
			(blockStart6 							(magenta darker))
			(blockEnd6 								(magenta darker))
			(blockStart7 							blue)
			(blockEnd7 								blue) 
			(arrayStart 								black)
			(arrayEnd 								black)
			(arrayStart1 							black)
			(arrayEnd1 								black)
			(leftBrace 								black)
			(rightBrace 								black)
			(cascadeSeparator 					black)
			(statementSeparator 					black)
			(externalCallType 						black)
			(externalCallTypePointerIndicator 		black)
			(primitiveOrExternalCallStart 			black bold)
			(primitiveOrExternalCallEnd 			black bold)
			(methodTempBar 						(black))
			(blockTempBar 						(black))
			(blockArgsBar 							(black))
			(primitive 								(green muchDarker))
			(pragmaKeyword 						(green muchDarker))
			(pragmaUnary 							(green muchDarker))
			(pragmaBinary 							(green muchDarker)) 
			(externalFunctionCallingConvention 	(green muchDarker) bold)
			(module 								(green muchDarker) bold)
			(blockTempVar 						(blue muchDarker))
			(blockPatternTempVar 					(blue muchDarker))
			(instVar 								(blue muchDarker))
			(workspaceVar 							(blue muchDarker))
			(undefinedIdentifier 					red)
			(incompleteIdentifier 					red)
			(tempVar 								(blue muchDarker))
			(patternTempVar 						(blue muchDarker))
			(poolConstant 							(blue muchDarker))
			(classVar 								(blue muchDarker))
			(globalVar 								(blue muchDarker)))

]

{ #category : #accessing }
Pharo3Theme class >> themeName [
	^ 'Pharo3'
]

{ #category : #accessing }
Pharo3Theme class >> veryLightSelectionColor [
	^ self lightSelectionColor muchLighter
]

{ #category : #'accessing colors' }
Pharo3Theme >> balloonBackgroundColor [

	^ (Color r: 1.0 g: 1.0 b: 0.71 alpha: 1.0)
]

{ #category : #border-styles-buttons }
Pharo3Theme >> buttonCornerStyleIn: aThemedMorph [
	"If asked, we only allow square corners"
	
	^ #square
]

{ #category : #label-styles }
Pharo3Theme >> buttonLabelForText: aTextOrString [
	"Answer the label to use for the given text."
	^aTextOrString isString
		ifTrue: [(LabelMorph contents: aTextOrString) color: self textColor ]
		ifFalse: [super buttonLabelForText: aTextOrString]
]

{ #category : #border-styles-buttons }
Pharo3Theme >> buttonNormalBorderStyleFor: aButton [
	"Return the normal button borderStyle for the given button."

	| outerColor |
	(aButton valueOfProperty: #noBorder ifAbsent: [false]) ifTrue: [
		^ SimpleBorder new width: 0; baseColor: Color transparent ].
	outerColor := self glamorousDarkBaseColorFor: aButton.
	^SimpleBorder new
					width: 1;
					baseColor: outerColor
]

{ #category : #fill-styles-buttons }
Pharo3Theme >> buttonNormalFillStyleFor: aButton [
	"Return the normal button fillStyle for the given button."
	
	(aButton valueOfProperty: #noFill ifAbsent: [false]) ifTrue: [^ SolidFillStyle color: Color transparent ].
	^ self glamorousNormalFillStyleFor: aButton height: aButton height
]

{ #category : #fill-styles-buttons }
Pharo3Theme >> buttonSelectedFillStyleFor: aButton [
	"Return the normal button fillStyle for the given button."
	
	^ SolidFillStyle color: (self glamorousLightSelectionColorFor: aButton)
	
]

{ #category : #forms }
Pharo3Theme >> checkboxForm [
	"Answer the form to use for a normal checkbox."

	^self  checkboxUnselectedForm
]

{ #category : #forms }
Pharo3Theme >> checkboxSelectedForm [
	"Answer the form to use for a selected checkbox."

	^ self iconNamed: #checkboxSelectedForm
]

{ #category : #forms }
Pharo3Theme >> checkboxUnselectedForm [
	"Answer the form to use for a selected checkbox."

	^ self iconNamed: #checkboxUnselectedForm
]

{ #category : #'watcher window' }
Pharo3Theme >> configureWatcherWindowLabelAreaFor: aWindow [
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
Pharo3Theme >> configureWindowBorderFor: aWindow [
"	super configureWindowBorderFor: aWindow.
	aWindow roundedCorners: #()"
	| aStyle |
	
	aStyle := 
		SimpleBorder new 
			color: (Color lightGray);
			width: 1.
			
	aWindow borderStyle: aStyle.
]

{ #category : #border-styles }
Pharo3Theme >> configureWindowDropShadowFor: aWindow [

	aWindow hasDropShadow: false
]

{ #category : #label-styles }
Pharo3Theme >> createMenuBoxFor: aSystemWindow [
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

{ #category : #defaults }
Pharo3Theme >> dialogWindowPreferredCornerStyleFor: aDialogWindow [
	"Answer the preferred corner style for the given dialog."

	^ self windowPreferredCornerStyleFor:aDialogWindow
]

{ #category : #fill-styles }
Pharo3Theme >> dockingBarNormalFillStyleFor: aToolDockingBar [
	^ SolidFillStyle color: Color transparent
]

{ #category : #fill-styles }
Pharo3Theme >> dropListDisabledFillStyleFor: aDropList [
	"Return the disabled fillStyle for the given drop list."
	
	^ self textEditorDisabledFillStyleFor: aDropList
]

{ #category : #border-styles }
Pharo3Theme >> dropListNormalBorderStyleFor: aDropList [
	"Return the normal borderStyle for the given drop list"

	^ self buttonNormalBorderStyleFor: aDropList
]

{ #category : #fill-styles }
Pharo3Theme >> dropListNormalFillStyleFor: aDropList [
	"Return the normal fillStyle for the given drop list."
	
	^ SolidFillStyle color: Color white
]

{ #category : #basic-colors }
Pharo3Theme >> errorPopperBackgroundColor [
	^ Color paleRed
]

{ #category : #fill-styles }
Pharo3Theme >> expanderTitleNormalFillStyleFor: anExpanderTitle [
	"Return the normal expander title fillStyle for the given expander title."
	
	^ self buttonNormalFillStyleFor: anExpanderTitle
]

{ #category : #private }
Pharo3Theme >> glamorousBaseColorFor: aButton [
	^ self class baseColor
	"unfortunately, it looks like paneColor does not always return the wanted color"
	"aButton paneColorOrNil ifNil: [Color r: 200 g: 200 b: 200 range: 255]"
]

{ #category : #private }
Pharo3Theme >> glamorousBasePassiveBackgroundColorFor: aButton [
	^ self class basePassiveBackgroundColor
]

{ #category : #private }
Pharo3Theme >> glamorousBaseSelectionColorFor: aButton [
	^ self class baseSelectionColor
]

{ #category : #private }
Pharo3Theme >> glamorousDarkBaseColorFor: aButton [
	^ self class darkBaseColor
]

{ #category : #private }
Pharo3Theme >> glamorousLightColorFor: aButton [
	^ self class lightBaseColor
]

{ #category : #private }
Pharo3Theme >> glamorousLightSelectionColorFor: aMorph [
	^ self class lightSelectionColor
]

{ #category : #private }
Pharo3Theme >> glamorousNormalFillStyleFor: aMorph height: anInteger [
	"Return the normal button fillStyle for the given button."
	
"	| baseColor |
	baseColor := self glamorousBaseColorFor: aMorph.
	^ self glamorousNormalFillStyleWithBaseColor: baseColor for: aMorph height: anInteger
"

	^ SolidFillStyle color: (self glamorousLightColorFor: aMorph)
]

{ #category : #private }
Pharo3Theme >> glamorousNormalFillStyleWithBaseColor: aColor for: aMorph height: anInteger [	
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

{ #category : #private }
Pharo3Theme >> glamorousSelectedFillStyleFor: aMorph height: anInteger [
	

	^ SolidFillStyle color: (self glamorousLightSelectionColorFor:  aMorph)

]

{ #category : #private }
Pharo3Theme >> glamorousVeryLightFillStyleFor: aMorph height: anInteger [
	"Return the very light button fillStyle for the given button."
	
"	| baseColor |
	baseColor := self glamorousBaseColorFor: aMorph.
	^ self glamorousNormalFillStyleWithBaseColor: baseColor for: aMorph height: anInteger
"
	^ SolidFillStyle color: (self glamorousVeyLightSelectionColorFor: aMorph)
]

{ #category : #private }
Pharo3Theme >> glamorousVeyLightSelectionColorFor: aMorph [
	^ self class veryLightSelectionColor
]

{ #category : #border-styles }
Pharo3Theme >> groupPanelBorderStyleFor: aGroupPanel [
	"Answer the normal border style for a group panel."

	^ SimpleBorder new
		width: 1;
		baseColor: ((self glamorousBaseColorFor: aGroupPanel))
]

{ #category : #'growl - specific' }
Pharo3Theme >> growlBorderColorFor: aGrowlMorph [
	^ Color white alpha: 0.5
]

{ #category : #'growl - specific' }
Pharo3Theme >> growlDismissHandleFor: aGrowlMorph [
	| form image |
	form := self windowCloseForm.
	image := ImageMorph new.
	image image: form.
	image color: Color yellow.
	^ image
]

{ #category : #'growl - specific' }
Pharo3Theme >> growlFillColorFor: aGrowlMorph [
	^ Color darkGray alpha: 0.5
]

{ #category : #'growl - specific' }
Pharo3Theme >> growlLabelColorFor: aGrowlMorph [
	^ Color white twiceDarker
]

{ #category : #initialize-release }
Pharo3Theme >> initializeForms [
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

{ #category : #fill-styles }
Pharo3Theme >> listDisabledFillStyleFor: aList [
	"Return the disabled fillStyle for the given list."
	
	^ self textEditorDisabledFillStyleFor: aList
]

{ #category : #fill-styles-buttons }
Pharo3Theme >> menuItemInDockingBarSelectedFillStyleFor: aMenuItem [
	"Answer the selected fill style to use for the given menu item that is in a docking bar."
	^ self buttonSelectedFillStyleFor: aMenuItem
]

{ #category : #forms }
Pharo3Theme >> menuPinForm [
	"Answer the form to use for the pin button of a menu."

	^ self iconNamed: #menuPinForm
]

{ #category : #fill-styles }
Pharo3Theme >> morphTreeSplitterNormalFillStyleFor: aSplitter [	
	^ self splitterNormalFillStyleFor: aSplitter
]

{ #category : #fill-styles }
Pharo3Theme >> morphTreeSplitterPressedFillStyleFor: aSplitter [	
	^ self splitterPressedFillStyleFor: aSplitter
]

{ #category : #forms }
Pharo3Theme >> newCheckboxMarkerForm [
	"Answer a new checkbox marker form."

	^ self iconNamed: #checkboxMarkerForm
]

{ #category : #'morph creation' }
Pharo3Theme >> newFocusIndicatorMorphFor: aMorph [
	"Answer a new focus indicator for the given morph."

	^ BorderedMorph new
		fillStyle: Color transparent;
		borderStyle: (SimpleBorder new
			 width: 1;
			baseColor: (self glamorousBaseSelectionColorFor: aMorph));
		bounds: aMorph focusBounds
]

{ #category : #forms }
Pharo3Theme >> newRadioButtonMarkerForm [
	"Answer a new radio button marker form. We make it empty because we already have the selected radio button take care of the state."

	^ self iconNamed: #radioButtonMarkerForm
]

{ #category : #initialize-release }
Pharo3Theme >> newRadioMarkerForm [
	"Answer a new checkbox marker form."

	^Form extent: 12@12 depth: 32
]

{ #category : #forms }
Pharo3Theme >> newWindowCloseForm [
	"Answer a new form for a window close box."

	^ self iconNamed: #windowCloseForm
]

{ #category : #forms }
Pharo3Theme >> newWindowCloseOverForm [
	"Answer a new form for a window menu box."

	^ self newWindowCloseForm
]

{ #category : #forms }
Pharo3Theme >> newWindowMaximizeForm [
	"Answer a new form for a window maximize box."

	^ self iconNamed: #windowMaximizeForm
]

{ #category : #forms }
Pharo3Theme >> newWindowMaximizeOverForm [
	"Answer a new form for a window menu box."

	^ self newWindowMaximizeForm
]

{ #category : #forms }
Pharo3Theme >> newWindowMenuForm [
	"Answer a new form for a window menu box."

	^ self iconNamed: #windowMenuForm
]

{ #category : #forms }
Pharo3Theme >> newWindowMenuPassiveForm [
	"Answer a new form for a window menu box."

	^ self iconNamed: #windowMenuInactiveForm
]

{ #category : #forms }
Pharo3Theme >> newWindowMinimizeForm [
	"Answer a new form for a window minimize box."

	^ self iconNamed: #windowMinimizeForm
]

{ #category : #forms }
Pharo3Theme >> newWindowMinimizeOverForm [
	"Answer a new form for a window menu box."

	^ self newWindowMinimizeForm
]

{ #category : #border-styles }
Pharo3Theme >> plainGroupPanelBorderStyleFor: aGroupPanel [
	"Answer the normal border style for a plain group panel."

	^SimpleBorder new
		width: 1;
		baseColor: Color transparent
]

{ #category : #fill-styles }
Pharo3Theme >> progressBarFillStyleFor: aProgressBar [
	^ self glamorousBasePassiveBackgroundColorFor: aProgressBar
]

{ #category : #fill-styles }
Pharo3Theme >> progressBarProgressFillStyleFor: aProgressBar [
	^ (self glamorousLightSelectionColorFor: aProgressBar)
]

{ #category : #fill-styles }
Pharo3Theme >> progressFillStyleFor: aProgress [
	"Return the progress fillStyle for the given progress morph."
	^ self windowActiveFillStyleFor: aProgress  
]

{ #category : #forms }
Pharo3Theme >> radioButtonForm [
	"Answer the form to use for a normal radio button."

	^ self iconNamed: #radioButtonUnselectedForm
]

{ #category : #forms }
Pharo3Theme >> radioButtonSelectedForm [
	"Answer the form to use for a selected radio button."

	^ self iconNamed: #radioButtonSelectedForm
]

{ #category : #scrollbars }
Pharo3Theme >> scrollBarButtonArrowVertices: aRectangle [ 
	^ self verticesForSimpleArrow: aRectangle
]

{ #category : #fill-styles-scrollbars }
Pharo3Theme >> scrollbarNormalButtonFillStyleFor: aScrollbar [
	"Return the normal scrollbar button fillStyle for the given scrollbar."
	
	^ self scrollbarNormalThumbFillStyleFor: aScrollbar
]

{ #category : #fill-styles-scrollbars }
Pharo3Theme >> scrollbarNormalFillStyleFor: aScrollbar [
	"Return the normal scrollbar fillStyle for the given scrollbar."
	
	^ "(self glamorousBaseColorFor: aScrollbar) muchLighter"
	Color r: 245 g: 245 b: 245 range: 255
]

{ #category : #border-styles-scrollbars }
Pharo3Theme >> scrollbarNormalThumbBorderStyleFor: aScrollbar [
	"Return the normal thumb borderStyle for the given scrollbar."

	^ BorderStyle simple
		width: 1;
		baseColor: Color transparent
]

{ #category : #fill-styles-scrollbars }
Pharo3Theme >> scrollbarNormalThumbFillStyleFor: aScrollbar [
	"Return the normal scrollbar fillStyle for the given scrollbar."
	
	"^ (self glamorousNormalFillStyleWithBaseColor: aScrollbar paneColor for:  aScrollbar height: aScrollbar height)
		direction: (aScrollbar bounds isWide
			ifTrue: [0 @ aScrollbar height]
			ifFalse: [aScrollbar width @ 0])"
"	^ SolidFillStyle color: Color lightGray lighter."
	^ self  glamorousNormalFillStyleFor: aScrollbar height: aScrollbar height
]

{ #category : #border-styles-scrollbars }
Pharo3Theme >> scrollbarPagingAreaCornerStyleIn: aThemedMorph [	
	^#square
]

{ #category : #forms }
Pharo3Theme >> scrollbarPressedThumbFillStyleFor: aScrollbar [
	"Return the pressed scrollbar thumb fillStyle for the given scrollbar."
		"Return the normal scrollbar fillStyle for the given scrollbar."
	
	"^ (self glamorousNormalFillStyleWithBaseColor: aScrollbar paneColor for:  aScrollbar height: aScrollbar height)
		direction: (aScrollbar bounds isWide
			ifTrue: [0 @ aScrollbar height]
			ifFalse: [aScrollbar width @ 0])"
"	^ SolidFillStyle color: Color lightGray lighter."
	^ self glamorousSelectedFillStyleFor: aScrollbar height: aScrollbar height
]

{ #category : #fill-styles }
Pharo3Theme >> separatorFillStyleFor: aSeparator [
	"Return the separator fillStyle for the given separator."
	
	^ SolidFillStyle color: (self glamorousBaseColorFor: aSeparator) darker
]

{ #category : #fill-styles }
Pharo3Theme >> sliderDisabledFillStyleFor: aSlider [
	"Return the disabled fillStyle for the given slider."
	
	^ self textEditorDisabledFillStyleFor: aSlider
]

{ #category : #fill-styles }
Pharo3Theme >> splitterNormalFillStyleFor: aSplitter [
	"Return the normal splitter fillStyle for the given splitter."
	
	^ SolidFillStyle color: Color transparent
]

{ #category : #fill-styles }
Pharo3Theme >> splitterPressedFillStyleFor: aSplitter [
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

{ #category : #basic-colors }
Pharo3Theme >> subgroupColorFrom: paneColor [
	"Answer the colour for a subgroup given the pane colour."

	^ self glamorousLightColorFor: paneColor" self class baseColor"
]

{ #category : #border-styles }
Pharo3Theme >> tabLabelNormalBorderStyleFor: aTabLabel [
"	^SimpleBorder new
		width: 0;
		baseColor: (self buttonBaseColorFor: aTabLabel) darker
"	^ self buttonNormalBorderStyleFor: aTabLabel
]

{ #category : #fill-styles-buttons }
Pharo3Theme >> tabLabelNormalFillStyleFor: aTabLabel [
	^ self buttonNormalFillStyleFor: aTabLabel 
]

{ #category : #fill-styles-buttons }
Pharo3Theme >> tabLabelSelectedFillStyleFor: aTabLabel [
	^ self buttonSelectedFillStyleFor: aTabLabel 
]

{ #category : #border-styles }
Pharo3Theme >> tabPanelBorderStyleFor: aTabGroup [
	^ Pharo3TabPanelBorder new 
		width: 1;
		baseColor: ((self glamorousDarkBaseColorFor: aTabGroup));
		tabSelector: aTabGroup tabSelectorMorph
]

{ #category : #basic-colors }
Pharo3Theme >> taskbarButtonLabelColorFor: aButton [
	"Answer the colour for the label of the given taskbar button."

	^aButton model
		ifNil: [super taskbarButtonLabelColorFor: aButton]
		ifNotNil: [:win |
			win isActive
				ifTrue: [Color black]
				ifFalse: [Color gray darker]]
]

{ #category : #fill-styles }
Pharo3Theme >> taskbarFillStyleFor: aTaskbar [
	^ "self buttonNormalFillStyleFor: aTaskbar"
	SolidFillStyle color: Color transparent 
]

{ #category : #border-styles }
Pharo3Theme >> taskbarThumbnailCornerStyleFor: aMorph [
	"Answer the corner style for the taskbar thumbnail/tasklist."
	
	^#square
]

{ #category : #border-styles }
Pharo3Theme >> taskbarThumbnailNormalBorderStyleFor: aWindow [
	^ self buttonNormalBorderStyleFor: aWindow
]

{ #category : #fill-styles }
Pharo3Theme >> textEditorDisabledFillStyleFor: aTextEditor [
	"Return the disabled fillStyle for the given text editor."
	
	^self glamorousBasePassiveBackgroundColorFor: aTextEditor
]

{ #category : #border-styles }
Pharo3Theme >> textEditorNormalBorderStyleFor: aTextEditor [
	"Return the normal text editor borderStyle for the given text editor."

	^self buttonNormalBorderStyleFor: aTextEditor
]

{ #category : #'watcher window' }
Pharo3Theme >> watcherWindowActiveFillStyleFor: aWindow [

	^ SolidFillStyle color: (Color veryVeryLightGray alpha: 0.6)
]

{ #category : #'watcher window' }
Pharo3Theme >> watcherWindowInactiveFillStyleFor: aWindow [

	^ SolidFillStyle color: (Color veryVeryLightGray alpha: 0.6)
]

{ #category : #fill-styles }
Pharo3Theme >> windowActiveFillStyleFor: aWindow [
	"We do not want the lighting effect when the window goes inactive"
	^SolidFillStyle color: self class baseColor
]

{ #category : #fill-styles }
Pharo3Theme >> windowActiveTitleFillStyleFor: aWindow [
	^ "self glamorousNormalFillStyleFor: aWindow height: aWindow labelHeight"
	SolidFillStyle color: Color transparent
]

{ #category : #forms }
Pharo3Theme >> windowClosePassiveForm [
	"Answer the form to use for passive (background) window close buttons"

	^ self iconNamed: #windowCloseInactiveForm
]

{ #category : #fill-styles }
Pharo3Theme >> windowInactiveFillStyleFor: aWindow [
	"We do not want the lighting effect when the window goes inactive"
	^self windowActiveFillStyleFor: aWindow
]

{ #category : #fill-styles }
Pharo3Theme >> windowInactiveTitleFillStyleFor: aWindow [
	"We do not want the lighting effect when the window goes inactive"
	^ SolidFillStyle color: Color transparent
]

{ #category : #forms }
Pharo3Theme >> windowMaximizePassiveForm [
	"Answer the form to use for passive (background) window maximize/restore buttons"

	^ self iconNamed: #windowMaximizeInactiveForm
]

{ #category : #label-styles }
Pharo3Theme >> windowMenuPassiveForm [
	"Answer the form to use for passive (background) window menu buttons"

	^self newWindowMenuPassiveForm
]

{ #category : #forms }
Pharo3Theme >> windowMinimizePassiveForm [
	"Answer the form to use for passive (background) window minimize buttons"

	^ self iconNamed: #windowMinimizeInactiveForm
]

{ #category : #defaults }
Pharo3Theme >> windowShadowColor [
	"Answer the window shadow color to use."

	^ Color gray
]
