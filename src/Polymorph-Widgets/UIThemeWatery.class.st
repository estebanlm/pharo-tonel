"
Watery UI theme
"
Class {
	#name : #UIThemeWatery,
	#superclass : #UITheme,
	#instVars : [
		'windowActiveDropShadowStyle'
	],
	#category : #Polymorph-Widgets-Themes,
	#timestamp : 'TorstenBergmann 2/5/2014 10:31'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery class>>isAbstract [
	"Answer whether the receiver is considered to be abstract."

	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery class>>newDefaultSettings [
	"Answer a new original default settings."
	"self defaultSettings: nil"
	^super newDefaultSettings
		standardColorsOnly: true;
		autoSelectionColor: false;
		buttonColor: (Color r: 232 g: 232 b: 232 range: 255);
		windowColor: (Color r: 200 g: 200 b: 200 range: 255);
		scrollbarColor: (Color r: 62 g: 142 b: 220 range: 255) ;
		selectionColor: (Color r: 0.0 g: 0.0 b: 0.8 alpha: 0.2) ;
		menuSelectionColor: (Color r: 81 g: 106 b: 230 range: 255) ;
		progressBarColor: (Color r: 232 g: 232 b: 232 range: 255);
		progressBarProgressColor: (Color r: 62 g: 142 b: 220 range: 255);
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery class>>themeName [
	"Answer the friendly name of the theme."

	^'Watery'
]

{
	#category : #fill-styles-scrollbars,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>baseScrollbarColorFor: aScrollbar [
	"Return the scrollbar last pane colour or that of our settings if unavailable"
	
	^ aScrollbar lastPaneColor 
		ifNil: [ self scrollbarColor ]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonBottomLeftForm [
	"Answer the form to use for the bottom left of a button."

	^self forms at: #buttonBottomLeft ifAbsent: [Form extent: 11@11 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonBottomMiddleForm [
	"Answer the form to use for the bottom middle of a button."

	^self forms at: #buttonBottomMiddle ifAbsent: [Form extent: 1@11 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonBottomRightForm [
	"Answer the form to use for the bottom right of a button."

	^self forms at: #buttonBottomRight ifAbsent: [Form extent: 11@11 depth: Display depth]
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonColouredFillStyleFor: aButton [
	"Return the coloured button fillStyle for the given button."
	
	|round roundCorners tl t tr l m r bl b br|
	round := aButton wantsRoundedCorners.
	roundCorners := aButton roundedCorners.
	tl := (round and: [roundCorners includes: 1]) ifTrue: [self buttonSelectedTopLeftForm] ifFalse: [self buttonSquareSelectedTopLeftForm].
	t := self buttonSelectedTopMiddleForm.
	tr:= (round and: [roundCorners includes: 4]) ifTrue: [self buttonSelectedTopRightForm] ifFalse: [self buttonSquareSelectedTopRightForm].
	l := self buttonSelectedMiddleLeftForm. m := self buttonColouredMiddleColor. r := self buttonSelectedMiddleRightForm.
	bl := (round and: [roundCorners includes: 2]) ifTrue: [self buttonSelectedBottomLeftForm] ifFalse: [self buttonSquareSelectedBottomLeftForm].
	b := self buttonSelectedBottomMiddleForm.
	br := (round and: [roundCorners includes: 3]) ifTrue: [self buttonSelectedBottomRightForm] ifFalse: [self buttonSquareSelectedBottomRightForm].
	^self
		multiFormFillStyleFrom: {tl. t. tr. l. m. r. bl. b. br}
		in: aButton bounds
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonColouredMiddleColor [
	"Return the middle area colour for a coloured button fillStyle."
	
	^Color r: 102 g: 127 b: 168 range: 255
]

{
	#category : #border-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonCornerStyleIn: aThemedMorph [
	"Allow for themes to override default behaviour."
	
	^aThemedMorph
		ifNil: [#rounded]
		ifNotNil: [:tm | 
			tm preferredButtonCornerStyle
				ifNil: [#rounded]
				ifNotNil: [:bcs | bcs]]
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonFocusBoundsFor: aButton [
	"Answer the bounds for drawing the focus indication for the
	given button."

	^aButton bounds
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonFocusIndicatorCornerRadiusFor: aButton [
	"Answer the default corner radius preferred for the focus indicator
	for the button for themes that support this."

	^aButton wantsRoundedCorners
		ifTrue: [7]
		ifFalse: [2]
]

{
	#category : #label-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonLabelForText: aTextOrString [
	"Answer the label to use for the given text."
	
	^aTextOrString isString
		ifTrue: [(FuzzyLabelMorph contents: aTextOrString)
					alpha: 0.3]
		ifFalse: [super buttonLabelForText: aTextOrString]
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonLabelInsetFor: aButton [
	"Answer the inset to use for a button's label."

	|left right|
	^aButton wantsRoundedCorners
		ifTrue: [left := ((aButton roundedCorners includesAnyOf: #(1 2)) ifTrue: [8] ifFalse: [4]).
				right := ((aButton roundedCorners includesAnyOf: #(3 4)) ifTrue: [8] ifFalse: [4]).
				Margin left: left top: 2 right: right bottom: 2]		
		ifFalse: [3@2]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonMiddleLeftForm [
	"Answer the form to use for the middle left of a button."

	^self forms at: #buttonMiddleLeft ifAbsent: [Form extent: 11@1 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonMiddleRightForm [
	"Answer the form to use for the middle right of a button."

	^self forms at: #buttonMiddleRight ifAbsent: [Form extent: 11@1 depth: Display depth]
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonMinHeight [
	"Answer the minumum height of a button for this theme."
	
	^24
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonMinWidth [
	"Answer the minumum width of a button for this theme."
	
	^24
]

{
	#category : #border-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonNormalBorderStyleFor: aButton [
	"Return the normal button borderStyle for the given button."

	^BorderStyle simple
		width: 0;
		baseColor: Color transparent
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonNormalFillStyleFor: aButton [
	"Return the normal button fillStyle for the given button."
	
	^aButton isDefault 
		ifTrue: [self buttonColouredFillStyleFor: aButton]
		ifFalse: [self buttonPlainFillStyleFor: aButton]
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonPlainFillStyleFor: aButton [
	"Return the plain button fillStyle for the given button."
	
	|round roundCorners tl t tr l m r bl b br|
	round := aButton wantsRoundedCorners.
	roundCorners := aButton roundedCorners.
	tl := (round and: [roundCorners includes: 1]) ifTrue: [self buttonTopLeftForm] ifFalse: [self buttonSquareTopLeftForm].
	t := self buttonTopMiddleForm.
	tr:= (round and: [roundCorners includes: 4]) ifTrue: [self buttonTopRightForm] ifFalse: [self buttonSquareTopRightForm].
	l := self buttonMiddleLeftForm. m := self buttonPlainMiddleColor. r := self buttonMiddleRightForm.
	bl := (round and: [roundCorners includes: 2]) ifTrue: [self buttonBottomLeftForm] ifFalse: [self buttonSquareBottomLeftForm].
	b := self buttonBottomMiddleForm.
	br := (round and: [roundCorners includes: 3]) ifTrue: [self buttonBottomRightForm] ifFalse: [self buttonSquareBottomRightForm].
	^self
		multiFormFillStyleFrom: {tl. t. tr. l. m. r. bl. b. br}
		in: aButton bounds
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonPlainMiddleColor [
	"Return the middle area colour for a plain button fillStyle."
	
	^Color r: 211 g: 211 b: 211 range: 255
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonPressedFillStyleFor: aButton [
	"Return the button pressed fillStyle for the given button."
		
	^self buttonSelectedFillStyleFor: aButton
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSelectedBottomLeftForm [
	"Answer the form to use for the bottom left of a selected button."

	^self forms at: #buttonSelectedBottomLeft ifAbsent: [Form extent: 12@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSelectedBottomMiddleForm [
	"Answer the form to use for the bottom middle of a selected button."

	^self forms at: #buttonSelectedBottomMiddle ifAbsent: [Form extent: 1@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSelectedBottomRightForm [
	"Answer the form to use for the bottom right of a selected button."

	^self forms at: #buttonSelectedBottomRight ifAbsent: [Form extent: 12@12 depth: Display depth]
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSelectedFillStyleFor: aButton [
	"Return the selected button fillStyle for the given button."
	
	^aButton isDefault 
		ifTrue: [self buttonPlainFillStyleFor: aButton]
		ifFalse: [self buttonColouredFillStyleFor: aButton]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSelectedMiddleLeftForm [
	"Answer the form to use for the middle left of a selected button."

	^self forms at: #buttonSelectedMiddleLeft ifAbsent: [Form extent: 12@1 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSelectedMiddleRightForm [
	"Answer the form to use for the middle right of a selected button."

	^self forms at: #buttonSelectedMiddleRight ifAbsent: [Form extent: 12@1 depth: Display depth]
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSelectedPressedFillStyleFor: aButton [
	"Return the button selected pressed fillStyle for the given color."

	^self buttonNormalFillStyleFor: aButton
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSelectedTopLeftForm [
	"Answer the form to use for the top left of a selected button."

	^self forms at: #buttonSelectedTopLeft ifAbsent: [Form extent: 12@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSelectedTopMiddleForm [
	"Answer the form to use for the top middle of a selected button."

	^self forms at: #buttonSelectedTopMiddle ifAbsent: [Form extent: 1@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSelectedTopRightForm [
	"Answer the form to use for the top right of a selected button."

	^self forms at: #buttonSelectedTopRight ifAbsent: [Form extent: 12@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSquareBottomLeftForm [
	"Answer the form to use for the bottom left of a square button."

	^self forms at: #buttonSquareBottomLeft ifAbsent: [Form extent: 12@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSquareBottomRightForm [
	"Answer the form to use for the bottom right of a square button."

	^self forms at: #buttonSquareBottomRight ifAbsent: [Form extent: 12@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSquareSelectedBottomLeftForm [
	"Answer the form to use for the bottom left of a selected square button."

	^self forms at: #buttonSquareSelectedBottomLeft ifAbsent: [Form extent: 12@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSquareSelectedBottomRightForm [
	"Answer the form to use for the bottom right of a selected square button."

	^self forms at: #buttonSquareSelectedBottomRight ifAbsent: [Form extent: 12@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSquareSelectedTopLeftForm [
	"Answer the form to use for the top left of a selected square button."

	^self forms at: #buttonSquareSelectedTopLeft ifAbsent: [Form extent: 12@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSquareSelectedTopRightForm [
	"Answer the form to use for the top right of a selected square button."

	^self forms at: #buttonSquareSelectedTopRight ifAbsent: [Form extent: 12@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSquareTopLeftForm [
	"Answer the form to use for the top left of a square button."

	^self forms at: #buttonSquareTopLeft ifAbsent: [Form extent: 12@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonSquareTopRightForm [
	"Answer the form to use for the top right of a square button."

	^self forms at: #buttonSquareTopRight ifAbsent: [Form extent: 12@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonTopLeftForm [
	"Answer the form to use for the top left of a button."

	^self forms at: #buttonTopLeft ifAbsent: [Form extent: 11@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonTopMiddleForm [
	"Answer the form to use for the top middle of a button."

	^self forms at: #buttonTopMiddle ifAbsent: [Form extent: 1@12 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>buttonTopRightForm [
	"Answer the form to use for the top right of a button."

	^self forms at: #buttonTopRight ifAbsent: [Form extent: 11@12 depth: Display depth]
]

{
	#category : #border-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>checkboxButtonDisabledBorderStyleFor: aCheckboxButton [
	"Return the disabled checkbox button borderStyle for the given button."

	^self checkboxButtonNormalBorderStyleFor: aCheckboxButton
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>checkboxButtonDisabledFillStyleFor: aCheckboxButton [
	"Return the disabled checkbox button fillStyle for the given button."
	
	^self checkboxButtonNormalFillStyleFor: aCheckboxButton
]

{
	#category : #border-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>checkboxButtonNormalBorderStyleFor: aChecboxButton [
	"Return the normal checkbox button borderStyle for the given button."

	^BorderStyle simple
		width: 1;
		baseColor: Color transparent
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>checkboxButtonNormalFillStyleFor: aCheckboxButton [
	"Return the normal checkbox button fillStyle for the given checkbox button."
	
	^(ImageFillStyle form: self checkboxForm) origin: aCheckboxButton topLeft
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>checkboxButtonSelectedFillStyleFor: aCheckboxButton [
	"Return the selected checkbox button fillStyle for the given checkbox button."
	
	^(ImageFillStyle form: self checkboxSelectedForm) origin: aCheckboxButton topLeft
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>checkboxForm [
	"Answer the form to use for a normal checkbox."

	^self forms at: #checkbox ifAbsent: [Form extent: 14@14 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>checkboxSelectedForm [
	"Answer the form to use for a selected checkbox."

	^self forms at: #checkboxSelected ifAbsent: [Form extent: 14@14 depth: Display depth]
]

{
	#category : #border-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>configureWindowBorderFor: aWindow [
	"Configure the border for the given window."

	super configureWindowBorderFor: aWindow.
	aWindow roundedCorners: #(1 4) "just top"
]

{
	#category : #label-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>configureWindowLabelAreaFor: aWindow [
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
		aWindow labelArea addMorphBack: label; hResizing: #shrinkWrap].
	aWindow labelArea
		addMorphBack: (Morph new extent: aWindow class borderWidth @ 0; hResizing: #spaceFill).
	padding > 0 ifTrue: [
		aWindow labelArea
			addMorphBack: (Morph new extent: (aWindow boxExtent x * padding) @ 0)].
	aWindow hasMenuBox ifTrue: [aWindow addMenuControl].
	aWindow labelArea
		addMorphBack: (Morph new extent: aWindow class borderWidth @ 0)
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>controlButtonDisabledFillStyleFor: aButton [
	"Return the disabled control button fillStyle for the given button.
	Control buttons are generally used for drop-lists and expanders."
	
	^self controlButtonSelectedFillStyleFor: aButton
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>controlButtonLabelInsetFor: aButton [
	"Answer the inset to use for a control button's label."

	^2
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>controlButtonMouseOverFillStyleFor: aButton [
	"Return the mouse over control button fillStyle for the given button.
	Control buttons are generally used for drop-lists and expanders."
	
	^self controlButtonNormalFillStyleFor: aButton
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>controlButtonNormalFillStyleFor: aButton [
	"Return the normal control button fillStyle for the given button.
	Control buttons are generally used for drop-lists and expanders."
	
	^self buttonSelectedFillStyleFor: aButton
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>controlButtonPressedFillStyleFor: aButton [
	"Return the pressed button fillStyle for the given button.
	Control buttons are generally used for drop-lists and expanders."
	
	^self controlButtonSelectedFillStyleFor: aButton
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>controlButtonSelectedDisabledFillStyleFor: aButton [
	"Return the selected disabled control button fillStyle for the given button.
	Control buttons are generally used for drop-lists and expanders."
	
	^self controlButtonSelectedFillStyleFor: aButton
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>controlButtonSelectedFillStyleFor: aButton [
	"Return the selected control button fillStyle for the given button.
	Control buttons are generally used for drop-lists and expanders."
	
	^self buttonNormalFillStyleFor: aButton
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>controlButtonSelectedMouseOverFillStyleFor: aButton [
	"Return the selected mouse over control button fillStyle for the given button.
	Control buttons are generally used for drop-lists and expanders."
	
	^self controlButtonSelectedFillStyleFor: aButton
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>controlButtonSelectedPressedFillStyleFor: aButton [
	"Return the selected pressed button fillStyle for the given button.
	Control buttons are generally used for drop-lists and expanders."
	
	^self controlButtonNormalFillStyleFor: aButton
]

{
	#category : #label-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>createCollapseBoxFor: aSystemWindow [
	"Answer a button for minimising the window."
	
	|form msb|
	form := self windowMinimizeForm.
	msb := MultistateButtonMorph new extent: form extent.
	msb activeEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowMinimizePassiveForm.
	msb extent: form extent.
	msb passiveEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowMinimizeOverForm.
	msb extent: form extent.
	msb
		activeEnabledOverUpFillStyle: (ImageFillStyle form: form);
		passiveEnabledOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowMinimizePassiveForm.
	msb
		extent: form extent;
		activeEnabledOverDownFillStyle: (ImageFillStyle form: form);
		passiveEnabledOverDownFillStyle: (ImageFillStyle form: form);
		addUpAction: [aSystemWindow collapseBoxHit];
		setBalloonText: 'Collapse this window' translated;
		extent: aSystemWindow boxExtent.
	^msb
]

{
	#category : #label-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>createExpandBoxFor: aSystemWindow [
	"Answer a button for maximising/restoring the window."
	
	|form msb|
	form := self windowMaximizeForm.
	msb := MultistateButtonMorph new extent: form extent.
	msb activeEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowMaximizePassiveForm.
	msb extent: form extent.
	msb passiveEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowMaximizeOverForm.
	msb extent: form extent.
	msb
		activeEnabledOverUpFillStyle: (ImageFillStyle form: form);
		passiveEnabledOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowMaximizePassiveForm.
	msb
		extent: form extent;
		activeEnabledOverDownFillStyle: (ImageFillStyle form: form);
		passiveEnabledOverDownFillStyle: (ImageFillStyle form: form);
		addUpAction: [aSystemWindow expandBoxHit];
		setBalloonText: 'Expand to full screen' translated;
		extent: aSystemWindow boxExtent.
	^msb
]

{
	#category : #label-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>createMenuBoxFor: aSystemWindow [
	"Answer a button for the window menu."
	
	|form msb|
	form := self windowMenuForm.
	msb := MultistateButtonMorph new extent: form extent.
	msb activeEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowMenuPassiveForm.
	msb extent: form extent.
	msb passiveEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowMenuOverForm.
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
		setBalloonText: 'Window menu' translated;
		extent: form extent.
	^msb
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>dialogWindowActiveFillStyleFor: aWindow [
	"Return the window active fillStyle for the given window."
	
	^self windowActiveFillStyleFor: aWindow
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>dialogWindowInactiveFillStyleFor: aWindow [
	"Return the window active fillStyle for the given window."
	
	^self windowInactiveFillStyleFor: aWindow
]

{
	#category : #basic-colors-diffs,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>diffAdditionalLineBackgroundColor [
	"Answer the color used to show additions in a diff view."
	^ Color green alpha: 0.2
]

{
	#category : #basic-colors-diffs,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>diffAdditionalTextInLineBackgroundColor [
	"Answer the color used to show addition highlights in a text line."
	^ self diffAdditionalLineBackgroundColor alpha: 0.4
]

{
	#category : #basic-colors-diffs,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>diffEdgeColor [
	"Answer the color used to show the border of the changes."
	^ Color gray alpha: 0.3
]

{
	#category : #basic-colors-diffs,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>diffJoinColor [
	"Answer the color used for the join bar."
	^ Color paleBlue duller
]

{
	#category : #basic-colors-diffs,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>diffMapColor [
	"Answer the color used for the mapping bar on the left side."
	^ self backgroundColor 
]

{
	#category : #basic-colors-diffs,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>diffModificatedLineBackgroundColor [
	"Answer the color used to show changes."
	^ Color yellow alpha: 0.2
]

{
	#category : #basic-colors-diffs,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>diffRemovalHighlightColor [
	"Answer the color used to show removal highligths."
	^ self diffRemovedLinesBackgroundColor alpha: 0.4
]

{
	#category : #basic-colors-diffs,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>diffRemovedLinesBackgroundColor [
	"Answer the color used to show removals in a diff view."
	^ Color red alpha: 0.2
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>dockingBarNormalFillStyleFor: aToolDockingBar [
	"Return the normal docking bar fillStyle for the given color."
	
	^aToolDockingBar paneColor
]

{
	#category : #border-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>drawTextAdornmentFor: aPluggableTextMorph color: aColor on: aCanvas [
	"Indicate edit status for the given morph."
	
	|bounds size fillStyle|
	bounds := aPluggableTextMorph innerBounds.
	size := 25.
	fillStyle := (GradientFillStyle ramp: {
			0.0->(self backgroundColor alpha: 0.01).
			0.8->aColor.
			1.0->aColor})
		origin: bounds topRight - (size@0);
		direction: (size @ size negated) // 4;
		radial: false.
	aCanvas
		drawPolygon:  {bounds topRight. bounds topRight + (0@size). bounds topRight - (size@0)}
		fillStyle: fillStyle
]

{
	#category : #border-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>dropListControlButtonWidth [
	"Answer the width of a drop list control button for this theme."
	
	^20
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>dropListDisabledFillStyleFor: aDropList [
	"Return the disabled fillStyle for the given drop list."
	
	^self dropListNormalFillStyleFor: aDropList
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>dropListFocusBoundsFor: aDropList [
	"Answer the bounds for drawing the focus indication for the
	given drop list."

	^aDropList bounds
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>dropListFocusIndicatorCornerRadiusFor: aDropList [
	"Answer the default corner radius preferred for the focus indicator
	for the drop list for themes that support this."

	^aDropList wantsRoundedCorners
		ifTrue: [7]
		ifFalse: [2]
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>dropListInsetFor: aDropList [
	"Answer the inset to use for drop-list layout."
	
	^ Margin left: 6 top: 0 right: 0 bottom: 0
	
]

{
	#category : #border-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>dropListNormalBorderStyleFor: aDropList [
	"Return the normal borderStyle for the given drop list"

	^BorderStyle simple
		width: 0;
		baseColor: Color transparent
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>dropListNormalFillStyleFor: aDropList [
	"Return the normal fillStyle for the given drop list."
	
	|round roundCorners tl t tr l m r bl b br|
	round := aDropList wantsRoundedCorners.
	roundCorners := aDropList roundedCorners.
	tl := (round and: [roundCorners includes: 1]) ifTrue: [self buttonTopLeftForm] ifFalse: [self buttonSquareTopLeftForm].
	t := self buttonTopMiddleForm.
	tr:= (round and: [roundCorners includes: 4]) ifTrue: [self buttonTopRightForm] ifFalse: [self buttonSquareTopRightForm].
	l := self buttonMiddleLeftForm. m := self buttonPlainMiddleColor. r := self buttonMiddleRightForm.
	bl := (round and: [roundCorners includes: 2]) ifTrue: [self buttonBottomLeftForm] ifFalse: [self buttonSquareBottomLeftForm].
	b := self buttonBottomMiddleForm.
	br := (round and: [roundCorners includes: 3]) ifTrue: [self buttonBottomRightForm] ifFalse: [self buttonSquareBottomRightForm].
	^self
		multiFormFillStyleFrom: {tl. t. tr. l. m. r. bl. b. br}
		in: aDropList bounds
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>editableDropListMargins [
	"Answer the text margins for an editable drop list for this theme."
	^ Margin left: 0 top: 3 right: 2 bottom: 1
	
]

{
	#category : #basic-colors,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>errorPopperBackgroundColor [
	^ Color paleRed
]

{
	#category : #border-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>expanderTitleControlButtonWidth [
	"Answer the width of an expander title control button for this theme."
	
	^20
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>expanderTitleInsetFor: aDropList [
	"Answer the inset to use for expander title layout."

	^0
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>expanderTitleNormalFillStyleFor: anExpanderTitle [
	"Return the normal expander title fillStyle for the given expander title."
	
	|aColor|
	aColor := anExpanderTitle paneColor.
	^(GradientFillStyle ramp: {
			0.0->Color white.
			0.05-> aColor lighter.
			1.0->aColor darker})
		origin: anExpanderTitle topLeft;
		direction: 0 @ anExpanderTitle height;
		radial: false
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>initialize [
	"Initialize the receiver."

	super initialize.
	self windowActiveDropShadowStyle: #diffuse
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>initializeForms [
	"Initialize the receiver's image forms."

	super initializeForms.
	self forms
		at: #sbHThumbLeft put: self newScrollbarThumbLeftForm;
		at: #sbHThumbMiddle put: self newScrollbarThumbHorizontalMiddleForm;
		at: #sbHThumbRight put: self newScrollbarThumbRightForm;
		at: #sbVThumbTop put: self newScrollbarThumbTopForm;
		at: #sbVThumbMiddle put: self newScrollbarThumbVerticalMiddleForm;
		at: #sbVThumbBottom put: self newScrollbarThumbBottomForm;
		at: #buttonTopLeft put: self newButtonTopLeftForm;
		at: #buttonTopMiddle put: self newButtonTopMiddleForm;
		at: #buttonTopRight put: self newButtonTopRightForm;
		at: #buttonMiddleLeft put: self newButtonMiddleLeftForm;
		at: #buttonMiddleRight put: self newButtonMiddleRightForm;
		at: #buttonBottomLeft put: self newButtonBottomLeftForm;
		at: #buttonBottomMiddle put: self newButtonBottomMiddleForm;
		at: #buttonBottomRight put: self newButtonBottomRightForm;
		at: #buttonSquareTopLeft put: self newButtonSquareTopLeftForm;
		at: #buttonSquareTopRight put: self newButtonSquareTopRightForm;
		at: #buttonSquareBottomLeft put: self newButtonSquareBottomLeftForm;
		at: #buttonSquareBottomRight put: self newButtonSquareBottomRightForm;
		at: #buttonSelectedTopLeft put: self newButtonSelectedTopLeftForm;
		at: #buttonSelectedTopMiddle put: self newButtonSelectedTopMiddleForm;
		at: #buttonSelectedTopRight put: self newButtonSelectedTopRightForm;
		at: #buttonSelectedMiddleLeft put: self newButtonSelectedMiddleLeftForm;
		at: #buttonSelectedMiddleRight put: self newButtonSelectedMiddleRightForm;
		at: #buttonSelectedBottomLeft put: self newButtonSelectedBottomLeftForm;
		at: #buttonSelectedBottomMiddle put: self newButtonSelectedBottomMiddleForm;
		at: #buttonSelectedBottomRight put: self newButtonSelectedBottomRightForm;
		at: #buttonSquareSelectedTopLeft put: self newButtonSquareSelectedTopLeftForm;
		at: #buttonSquareSelectedTopRight put: self newButtonSquareSelectedTopRightForm;
		at: #buttonSquareSelectedBottomLeft put: self newButtonSquareSelectedBottomLeftForm;
		at: #buttonSquareSelectedBottomRight put: self newButtonSquareSelectedBottomRightForm;
		at: #radioButton put: self newRadioButtonForm;
		at: #radioButtonSelected put: self newRadioButtonSelectedForm;
		at: #checkbox put: self newCheckboxForm;
		at: #checkboxSelected put: self newCheckboxSelectedForm;
		at: #windowClosePassive put: self newWindowInactiveControlForm;
		at: #windowMinimizePassive put: self newWindowInactiveControlForm;
		at: #windowMaximizePassive put: self newWindowInactiveControlForm;
		at: #windowMenuPassive put: self newWindowMenuPassiveForm;
		at: #windowMenuOver put: self newWindowMenuOverForm

]

{
	#category : #border-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>listNormalBorderStyleFor: aList [
	"Return the normal borderStyle for the given list"

	^BorderStyle simple
		width: 1;
		baseColor: aList paneColor
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>menuItemInDockingBarSelectedFillStyleFor: aMenuItem [
	"Answer the selected fill style to use for the given menu item that is in a docking bar."
	
	| fill baseColor |
	Display depth <= 2
		ifTrue: [^ Color gray].
	baseColor := self settings derivedMenuColor.
	self preferGradientFill ifFalse: [^baseColor].
	fill := GradientFillStyle ramp: {0.0 -> baseColor twiceDarker . 1 -> baseColor twiceLighter}.
	fill
		origin: aMenuItem topLeft;
		direction: 0@aMenuItem height.
	^ fill
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>menuItemSelectedFillStyleFor: aMenuItem [
	"Answer the selected fill style to use for the given menu item."
	
	| fill baseColor preferenced |
	Display depth <= 2 ifTrue: [^ Color gray].
	preferenced := self settings menuSelectionColor.
	baseColor := preferenced isNil
		ifTrue: [aMenuItem owner color negated]
		ifFalse: [preferenced].
	self preferGradientFill
		ifFalse: [^baseColor].
	fill := GradientFillStyle ramp: {0.0 -> baseColor twiceLighter . 1 -> baseColor twiceDarker}.
	fill
		origin: aMenuItem topLeft;
		direction: 0@aMenuItem height.
	^ fill
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonBottomLeftForm [
	"Answer the form for the bottom left of a button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 3716317826 4291743438 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 2842718320 4290953922 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 1784635231 4255886251 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 978802519 4170157967 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 374427985 3815599469 4291611852 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 41975936 1699499084 4168973693 4293190884 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 0 154745145 2891010385 4271873951 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 0 16777216 675299392 3764280926 4290098613 4293980400 4294046193 4294046193 4294046193 4294046193 4294046193 4294046193 0 0 33554432 1295332661 3595850836 4253583496 4292993505 4294309365 4294309365 4294309365 4294309365 4294309365 0 0 0 33554432 640626479 2688433726 4083574374 4289835441 4293125091 4294506744 4294572537 4294572537 0 0 0 0 16777216 138428480 1546267178 3510780482 3981989976 4184895600 4270360712 4288651167 0 0 0 0 0 0 33554432 338044454 941629472 1511989023 2268016431 3124575549)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonBottomMiddleForm [
	"Answer the form for the bottom middle of a button."

	^(Form
	extent: 1@12
	depth: 32
	fromArray: #( 4292072403 4292401368 4292664540 4292927712 4293190884 4293454056 4293717228 4294046193 4294309365 4294572537 4289506476 3443342653)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonBottomRightForm [
	"Answer the form for the bottom right of a button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4291282887 3548216701 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4290230199 2607574124 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4238187933 1616731485 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4119365768 962156889 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4290756543 3697895785 374427985 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4292730333 4118378873 1666010445 41975936 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4254175633 2790215503 154745145 0 4294046193 4294046193 4294046193 4294046193 4294046193 4294046193 4293848814 4289177511 3663288665 675299392 16777216 0 4294309365 4294309365 4294309365 4294309365 4294309365 4292467161 4253188738 3545453395 1295332661 33554432 0 0 4294572537 4294572537 4294440951 4292861919 4289309097 4066797158 2655010880 640626479 33554432 0 0 0 4288519581 4270294919 4168052591 3965081174 3477291843 1546267178 138428480 16777216 0 0 0 0 3107864126 2268016431 1511989023 941629472 338044454 33554432 0 0 0 0 0 0)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonMiddleLeftForm [
	"Answer the form for the middle left of a button."

	^(Form
	extent: 12@1
	depth: 32
	fromArray: #( 3968305031 4292138196 4292138196 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonMiddleRightForm [
	"Answer the form for the middle right of a button."

	^(Form
	extent: 12@1
	depth: 32
	fromArray: #( 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 3934750599)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSelectedBottomLeftForm [
	"Answer the form for the bottom left of a selected button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 3713688967 4284841382 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 2840812155 4284841122 4285170861 4285170861 4285170861 4285170861 4285170861 4285170861 4285170861 4285170861 4285170861 4285170861 1783452780 4251022487 4285499826 4285499826 4285499826 4285499826 4285499826 4285499826 4285499826 4285499826 4285499826 4285499826 977750885 4166608772 4285763511 4285763511 4285763511 4285763511 4285763511 4285763511 4285763511 4285763511 4285763511 4285763511 373704285 3813365101 4285499564 4286092476 4286092476 4286092476 4286092476 4286092476 4286092476 4286092476 4286092476 4286092476 33554560 1698382676 4166082166 4286224317 4286356160 4286356160 4286356160 4286356160 4286356160 4286356160 4286356160 4286356160 0 154745173 2889761365 4267668108 4286685125 4286685125 4286685125 4286685125 4286685125 4286685125 4286685125 4286685125 0 16777216 674444102 3762375258 4285103772 4286948554 4286948554 4286948554 4286948554 4286948554 4286948554 4286948554 0 0 33554432 1294675516 3594273360 4250231929 4286619071 4287277775 4287277775 4287277775 4287277775 4287277775 0 0 0 33554432 640165935 2687513663 4081274461 4285169818 4286882243 4287606740 4287606740 4287606740 0 0 0 0 16777216 134234176 1545872426 3509597758 3980150095 4182267235 4267009399 4284642698 0 0 0 0 0 0 33554432 338044454 941629472 1511791647 2267424813 3123524408)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSelectedBottomMiddleForm [
	"Answer the form for the bottom middle of a selected button."

	^(Form
	extent: 1@12
	depth: 32
	fromArray: #( 4284907432 4285171117 4285500082 4285763767 4286092732 4286356417 4286685381 4286948810 4287278031 4287606996 4285038229 3442226232)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSelectedBottomRightForm [
	"Answer the form for the bottom right of a selected button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284775331 3545850757 4285170861 4285170861 4285170861 4285170861 4285170861 4285170861 4285170861 4285170861 4285170861 4285170861 4284643228 2605931385 4285499826 4285499826 4285499826 4285499826 4285499826 4285499826 4285499826 4285499826 4285499826 4285499826 4233915791 1615745901 4285763511 4285763511 4285763511 4285763511 4285763511 4285763511 4285763511 4285763511 4285763511 4285763511 4116079488 961039463 4286092476 4286092476 4286092476 4286092476 4286092476 4286092476 4286092476 4286092476 4286092476 4285169827 3695858538 373704285 4286356160 4286356160 4286356160 4286356160 4286356160 4286356160 4286356160 4286356160 4286092472 4115618674 1664828245 33554560 4286685125 4286685125 4286685125 4286685125 4286685125 4286685125 4286685125 4286685125 4250495363 2789098069 154745173 0 4286948554 4286948554 4286948554 4286948554 4286948554 4286948554 4286882504 4284642962 3661580376 674444102 16777216 0 4287277775 4287277775 4287277775 4287277775 4287277775 4286421177 4250034292 3543876175 1294675516 33554432 0 0 4287606740 4287606740 4287540947 4286750399 4284906131 4064496988 2654025280 640165935 33554432 0 0 0 4284445576 4266943863 4165424226 3963307086 3476109119 1545872426 134234176 16777216 0 0 0 0 3106812728 2267424813 1511791647 941629472 338044454 33554432 0 0 0 0 0 0)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSelectedMiddleLeftForm [
	"Answer the form for the middle left of a selected button."

	^(Form
	extent: 12@1
	depth: 32
	fromArray: #( 3965347464 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSelectedMiddleRightForm [
	"Answer the form for the middle right of a selected button."

	^(Form
	extent: 12@1
	depth: 32
	fromArray: #( 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 3931727240)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSelectedTopLeftForm [
	"Answer the form for the top left of a selected button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 0 0 0 0 0 0 33554431 362719975 1268031205 2541850575 3279521477 3765271736 0 0 0 0 0 111848191 2407633100 4049957547 4266548622 4284838039 4287271854 4290099916 0 0 0 16777471 814060743 3581116602 4266877583 4288982209 4292730856 4292994026 4292994026 4292994026 0 0 16777471 1903987394 4099960739 4285430685 4291349978 4292270819 4292270819 4292270819 4292270819 4292270819 0 0 713067455 4083709352 4288259003 4291547356 4291547356 4291547356 4291547356 4291547356 4291547356 4291547356 0 75464703 3580787373 4287535542 4290889943 4290889943 4290889943 4290889943 4290889943 4290889943 4290889943 4290889943 33554431 2389802158 4251744930 4290297809 4290297809 4290297809 4290297809 4290297809 4290297809 4290297809 4290297809 4290297809 258373546 4016337568 4286878386 4289706189 4289706189 4289706189 4289706189 4289706189 4289706189 4289706189 4289706189 4289706189 1097823911 4200558234 4287207349 4289114568 4289114568 4289114568 4289114568 4289114568 4289114568 4289114568 4289114568 4289114568 2070376603 4284182168 4286155693 4288654276 4288654276 4288654276 4288654276 4288654276 4288654276 4288654276 4288654276 4288654276 3160435603 4284314525 4284577696 4287668413 4288128705 4288128705 4288128705 4288128705 4288128705 4288128705 4288128705 4288128705 3780930190 4284578211 4284578211 4285301417 4286353587 4286353587 4286353587 4286353587 4286353587 4286353587 4286353587 4286353587)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSelectedTopMiddleForm [
	"Answer the form for the top middle of a selected button."

	^(Form
	extent: 1@12
	depth: 32
	fromArray: #( 3966269361 4291941599 4292994026 4292205027 4291547356 4290889943 4290297809 4289640652 4289114568 4288588740 4288128705 4286353587)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSelectedTopRightForm [
	"Answer the form for the top right of a selected button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 3748625849 3262810310 2441121744 1184342758 295085538 33554431 0 0 0 0 0 0 4290099916 4287271854 4284904087 4266680208 4016534958 2156237519 75464703 0 0 0 0 0 4292994026 4292994026 4292994026 4292730856 4288981953 4250297491 3463873727 646616786 16777471 0 0 0 4292270819 4292270819 4292270819 4292270819 4292270819 4291284185 4285233565 4066800809 1551994565 16777471 0 0 4291547356 4291547356 4291547356 4291547356 4291547356 4291547356 4291547356 4287929784 4016798124 545033153 0 0 4290889943 4290889943 4290889943 4290889943 4290889943 4290889943 4290889943 4290889943 4287009457 3379658160 61516543 0 4290297809 4290297809 4290297809 4290297809 4290297809 4290297809 4290297809 4290297809 4290166480 4234639009 2003992240 33554431 4289706189 4289706189 4289706189 4289706189 4289706189 4289706189 4289706189 4289706189 4289706189 4286286508 3949425826 258373546 4289114568 4289114568 4289114568 4289114568 4289114568 4289114568 4289114568 4289114568 4289114568 4286747057 4167135387 896300710 4288654276 4288654276 4288654276 4288654276 4288654276 4288654276 4288654276 4288654276 4288654276 4285760937 4250693017 1785229980 4288128705 4288128705 4288128705 4288128705 4288128705 4288128705 4288128705 4288128705 4287471035 4284446367 4284314268 2841668498 4286353587 4286353587 4286353587 4286353587 4286353587 4286353587 4286353587 4286353587 4285038503 4284578211 4284578211 3663554701)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSquareBottomLeftForm [
	"Answer the form for the bottom left of a square button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 3968305031 4292138196 4292138196 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 3967976066 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 3967778687 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 3967449722 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 3967252343 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 3966923378 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 3966660206 4293783021 4293783021 4293783021 4293783021 4293783021 4293783021 4293783021 4293783021 4293717228 4293717228 4293717228 3966397034 4294046193 4294046193 4294046193 4294046193 4294046193 4294046193 4294046193 4294046193 4294046193 4294046193 4294046193 3966133862 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 3830929239 4293783021 4294572537 4294572537 4294572537 4294572537 4294572537 4294572537 4294572537 4294572537 4294572537 4294572537 2502963248 4252596601 4289309097 4289506476 4289506476 4289506476 4289506476 4289506476 4289506476 4289506476 4289506476 4289506476 622599196 2352034097 3409854014 3443342653 3443342653 3443342653 3443342653 3443342653 3443342653 3443342653 3443342653 3443342653)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSquareBottomRightForm [
	"Answer the form for the bottom right of a square button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 4292072403 3934750599 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292401368 4292335575 3934421634 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 3934158462 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 3933895290 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 3933632118 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 4293454056 3933368946 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 3933039981 4294046193 4294046193 4294046193 4294046193 4294046193 4294046193 4294046193 4294046193 4294046193 4294046193 4294046193 3932776809 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 3932447844 4294572537 4294572537 4294572537 4294572537 4294572537 4294572537 4294572537 4294572537 4294572537 4294572537 4293388263 3780400212 4289506476 4289506476 4289506476 4289506476 4289506476 4289506476 4289506476 4289506476 4289506476 4289243304 4235556213 2452565807 3443342653 3443342653 3443342653 3443342653 3443342653 3443342653 3443342653 3443342653 3443342653 3393076798 2352034097 622599196)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSquareSelectedBottomLeftForm [
	"Answer the form for the bottom left of a selected square button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 3965347464 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 3965215874 4285171117 4285171117 4285171117 4285171117 4285171117 4285171117 4285171117 4285171117 4285171117 4285171117 4285171117 3964952703 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 3964821113 4285763767 4285763767 4285763767 4285763767 4285763767 4285763767 4285763767 4285763767 4285763767 4285763767 4285763767 3964623476 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 3964426350 4286421953 4286421953 4286421953 4286421953 4286356417 4286356417 4286356417 4286356417 4286356417 4286356417 4286356417 3964294248 4286685382 4286685382 4286685382 4286685382 4286685382 4286685382 4286685382 4286685382 4286685381 4286685381 4286685381 3964097124 4287014602 4287014602 4287014602 4287014346 4287014346 4287014346 4287014346 4287014346 4287014346 4287014346 4287014346 3963833950 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 3829154896 4287211978 4287607252 4287606996 4287606996 4287606996 4287606996 4287606996 4287606996 4287606996 4287606996 4287606996 2502502958 4249705579 4284972435 4285038229 4285038229 4285038229 4285038229 4285038229 4285038229 4285038229 4285038229 4285038229 622599196 2351311407 3408802615 3442226232 3442226232 3442226232 3442226232 3442226232 3442226232 3442226232 3442226232 3442226232)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSquareSelectedBottomRightForm [
	"Answer the form for the bottom right of a selected square button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 4284907432 3931727240 4285171117 4285171117 4285171117 4285171117 4285171117 4285171117 4285171117 4285171117 4285171117 4285171117 4285170861 3931595651 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 3931464061 4285763767 4285763767 4285763511 4285763511 4285763511 4285763511 4285763511 4285763511 4285763511 4285763511 4285763511 3931200888 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 3931003251 4286356417 4286356160 4286356160 4286356160 4286356160 4286356160 4286356160 4286356160 4286356160 4286356160 4286356160 3930871661 4286685381 4286685381 4286685381 4286685381 4286685381 4286685381 4286685381 4286685381 4286685381 4286685381 4286685381 3930674280 4286948810 4286948810 4286948810 4286948810 4286948810 4286948810 4286948810 4286948810 4286948810 4286948810 4286948810 3930476899 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 3930345054 4287606996 4287606996 4287606996 4287606996 4287606996 4287606996 4287606996 4287541460 4287541460 4287541460 4286948549 3778691918 4285038229 4285038229 4285038229 4285038485 4285038485 4285038485 4285038485 4285038485 4285038485 4284841105 4232796519 2452040237 3442226232 3442226232 3442226232 3442226232 3442226232 3442226232 3442226232 3442226232 3442226232 3392025400 2351311407 622599196)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSquareSelectedTopLeftForm [
	"Answer the form for the top left of a selected square button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 630892779 3329853638 3949492146 3966269361 3966269361 3966269361 3966269361 3966269361 3966269361 3966269361 3966269361 3966269361 3028455632 4282141565 4285561500 4291744478 4291876062 4291876062 4291876062 4291876062 4291876062 4291876062 4291876062 4291876062 3916792766 4281944439 4289771209 4292928234 4292928234 4292928234 4292928234 4292928234 4292994026 4292994026 4292994026 4292994026 3966992312 4282207868 4289705673 4292139234 4292205027 4292205027 4292205027 4292205027 4292205027 4292205027 4292205027 4292205027 3966860723 4282537089 4289311174 4291481564 4291481564 4291481564 4291481564 4291481564 4291481564 4291547356 4291547356 4291547356 3966598062 4282800518 4288785346 4290889686 4290889686 4290889686 4290889686 4290889686 4290889686 4290889686 4290889686 4290889686 3966334888 4283129739 4288456639 4290232273 4290232273 4290232273 4290232273 4290232273 4290297809 4290297809 4290297809 4290297809 3966268835 4283393168 4288062397 4289640396 4289640652 4289640652 4289640652 4289640652 4289640652 4289640652 4289640652 4289640652 3966071197 4283722133 4287799227 4289114568 4289114568 4289114568 4289114568 4289114568 4289114568 4289114568 4289114568 4289114568 3965874072 4283985818 4287405242 4288523204 4288523204 4288588740 4288588740 4288588740 4288588740 4288588740 4288588740 4288588740 3965741971 4284314782 4287208120 4288128705 4288128705 4288128705 4288128705 4288128705 4288128705 4288128705 4288128705 4288128705 3965544845 4284578467 4285893551 4286288050 4286288050 4286353587 4286353587 4286353587 4286353587 4286353587 4286353587 4286353587)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSquareSelectedTopRightForm [
	"Answer the form for the top right of a selected square button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 3966269361 3966269361 3966269361 3966269361 3966269361 3966269105 3966269105 3966269105 3966269105 3949492146 3246098890 547072752 4291941599 4291941599 4291941599 4291941599 4291941599 4291941599 4291941599 4291941599 4291810270 4285298585 4282338943 2927923665 4292994026 4292994026 4292994026 4292994026 4292994026 4292994283 4292994283 4292994283 4292994283 4289442502 4281878647 3883238334 4292205027 4292270819 4292270819 4292270819 4292270819 4292270819 4292270819 4292270819 4292270819 4289442758 4282207868 3933503928 4291547356 4291547356 4291547356 4291547356 4291547356 4291547356 4291612893 4291612893 4291612893 4289048003 4282471297 3933240756 4290889943 4290889943 4290889943 4290889943 4290889943 4290889943 4290889943 4290889943 4290889943 4288653760 4282800518 3933043629 4290297809 4290297809 4290297809 4290297809 4290297809 4290298066 4290298066 4290298066 4290298066 4288325054 4283063947 3932911528 4289640652 4289706189 4289706189 4289706189 4289706189 4289706189 4289706189 4289706189 4289706189 4287930812 4283393168 3932714660 4289114568 4289114568 4289114568 4289114568 4289114568 4289114568 4289180360 4289180360 4289180360 4287602105 4283656596 3932516765 4288588740 4288588740 4288654532 4288654532 4288654532 4288654532 4288654532 4288654532 4288654532 4287339448 4283985817 3932319385 4288128705 4288128705 4288128705 4288128705 4288128705 4288128705 4288128705 4288194497 4288194497 4287142327 4284314782 3932187795 4286353587 4286353587 4286353587 4286353587 4286353587 4286353587 4286353587 4286353587 4286353587 4285827758 4284578467 3931924878)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSquareTopLeftForm [
	"Answer the form for the top left of a square button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 633520834 3333994680 3954422707 3971199923 3971199923 3971199923 3971199923 3971199923 3971199923 3971199923 3971199923 3971199923 3032004792 4289243304 4290822336 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 3920736689 4289374890 4292730333 4294111986 4294111986 4294111986 4294111986 4294111986 4294111986 4294111986 4294111986 4294111986 3970805165 4289638062 4292796126 4293783021 4293848814 4293848814 4293848814 4293848814 4293848814 4293848814 4293848814 4293848814 3970476200 4289901234 4292664540 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 3970278821 4290164406 4292532954 4293322470 4293322470 4293322470 4293322470 4293322470 4293322470 4293322470 4293322470 4293322470 3970015649 4290493371 4292532954 4293190884 4293190884 4293190884 4293125091 4293125091 4293190884 4293190884 4293190884 4293190884 3969686684 4290756543 4292467161 4292993505 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 3969423512 4291019715 4292467161 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 3969160340 4291282887 4292467161 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 3968831375 4291546059 4292467161 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 3968568203 4291809231 4292203989 4292335575 4292335575 4292335575 4292335575 4292335575 4292335575 4292335575 4292335575 4292335575)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonSquareTopRightForm [
	"Answer the form for the top right of a square button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 3971199923 3971199923 3971199923 3971199923 3971199923 3971199923 3971199923 3971199923 3971199923 3954422707 3250240186 549042617 4293651435 4293651435 4293651435 4293651435 4293651435 4293651435 4293651435 4293651435 4293585642 4290690750 4289243304 2931341496 4294111986 4294111986 4294111986 4294111986 4294111986 4294111986 4294111986 4294111986 4294111986 4292598747 4289374890 3887182257 4293848814 4293848814 4293848814 4293848814 4293848814 4293848814 4293848814 4293848814 4293848814 4292664540 4289638062 3937184940 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4292532954 4289901234 3936987561 4293388263 4293388263 4293388263 4293388263 4293388263 4293388263 4293388263 4293388263 4293388263 4292467161 4290164406 3936658596 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4292401368 4290427578 3936329631 4293059298 4293059298 4293059298 4293059298 4293059298 4292993505 4292993505 4292993505 4292993505 4292335575 4290690750 3936132252 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292401368 4291019715 3935803287 4292796126 4292796126 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292401368 4291282887 3935540115 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292467161 4291546059 3935276943 4292335575 4292335575 4292335575 4292335575 4292335575 4292335575 4292335575 4292335575 4292335575 4292203989 4291809231 3935013771)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonTopLeftForm [
	"Answer the form for the top left of a button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 0 0 0 0 0 0 33554431 365151171 1270791870 2545662907 3283663032 3770004917 0 0 0 0 0 111848106 2411247800 4054954417 4272729260 4290427578 4291546059 4292796126 0 0 0 33554431 817083315 3585192369 4273058225 4292401368 4293980400 4294111986 4294111986 4294111986 0 0 33554431 1907076011 4105022893 4290953922 4293454056 4293848814 4293848814 4293848814 4293848814 4293848814 0 0 715696296 4088179884 4292269782 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 0 79675327 3584402853 4291940817 4293388263 4293388263 4293388263 4293388263 4293388263 4293388263 4293388263 4293388263 33554431 2392628380 4256938939 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 261724569 4020281504 4292006610 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 1099795853 4205488810 4292269782 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 2072413830 4290361785 4292006610 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 3163196042 4291217094 4291611852 4292664540 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 3784150413 4291809231 4291809231 4292006610 4292335575 4292335575 4292335575 4292335575 4292335575 4292335575 4292335575 4292335575)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonTopMiddleForm [
	"Answer the form for the top middle of a button."

	^(Form
	extent: 1@12
	depth: 32
	fromArray: #( 3971199923 4293585642 4294111986 4293848814 4293585642 4293322470 4293190884 4293059298 4292927712 4292796126 4292796126 4292335575)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newButtonTopRightForm [
	"Answer the form for the top right of a button."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 3753227701 3266885816 2445065404 1187103169 298042307 33554431 0 0 0 0 0 0 4292796126 4291546059 4290427578 4272729260 4021334192 2159655353 75464575 0 0 0 0 0 4294111986 4294111986 4294111986 4293980400 4292401368 4256346802 3467817650 649113776 33554431 0 0 0 4293848814 4293848814 4293848814 4293848814 4293848814 4293388263 4290822336 4071534254 1554886061 33554431 0 0 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4292072403 4020873641 548055722 0 0 4293388263 4293388263 4293388263 4293388263 4293388263 4293388263 4293388263 4293388263 4291611852 3382944675 67108863 0 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293125091 4239701172 2006686619 33554431 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 4291809231 3953041054 261724569 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292072403 4171473827 898206089 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4291875024 4256215216 1787069572 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292796126 4292532954 4291611852 4290822336 2843968387 4292335575 4292335575 4292335575 4292335575 4292335575 4292335575 4292335575 4292335575 4291940817 4291809231 4291677645 3666380936)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newCheckboxForm [
	"Answer the form for a normal checkbox."

	^(Form
	extent: 14@14
	depth: 32
	fromArray: #( 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 594242411 3918960278 4138774704 4138774704 4138774704 4138774704 4138774704 4138774704 4138774704 4138774704 4138774704 4138774704 3919026071 594242411 2575072380 4292467161 4294177779 4294177779 4294177779 4294177779 4294177779 4294177779 4294177779 4294177779 4294177779 4294177779 4292467161 2524806525 2658695288 4292664540 4293651435 4293651435 4293651435 4293651435 4293651435 4293651435 4293651435 4293651435 4293651435 4293651435 4292664540 2608429433 2658432116 4292532954 4293322470 4293322470 4293322470 4293322470 4293322470 4293322470 4293322470 4293322470 4293322470 4293322470 4292532954 2608232054 2658366323 4292467161 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 4293059298 4292467161 2608100468 2658037358 4292532954 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292532954 2607771503 2657839979 4292138196 4292138196 4292138196 4292138196 4292138196 4292138196 4292138196 4292138196 4292138196 4292138196 4292138196 4292138196 2607639917 2657642600 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 2607442538 2657313635 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 4293190884 2607113573 2657116256 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 2606850401 2606455643 4294046193 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294309365 4294046193 2556255581 1311978291 4237003659 4289967027 4289967027 4289967027 4289967027 4289967027 4289967027 4289967027 4289967027 4289967027 4289967027 4237003659 1278555445 50331648 1210986030 1647917369 1647917369 1647917369 1647917369 1647917369 1647917369 1647917369 1647917369 1647917369 1647917369 1210986030 50331648)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newCheckboxMarkerForm [
	"Answer a new checkbox marker form."

	^(Form
	extent: 12@14
	depth: 32
	fromArray: #( 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 1342177280 1610612736 134217728 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 3338665984 4278190080 1476395008 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 671088640 4278190080 4009754624 134217728 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 2147483648 4278190080 2533359616 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 3607101440 4278190080 1207959552 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 1073741824 4278190080 3875536896 16777215 16777215 16777215 16777215 16777215 1207959552 3204448256 134217728 16777215 2801795072 4278190080 2147483648 16777215 16777215 16777215 16777215 134217728 3607101440 4278190080 2936012800 268435456 4143972352 4278190080 536870912 16777215 16777215 16777215 16777215 16777215 536870912 4009754624 4278190080 3607101440 4278190080 3070230528 16777215 16777215 16777215 16777215 16777215 16777215 16777215 805306368 4009754624 4278190080 4278190080 1342177280 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 671088640 2936012800 2801795072 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newCheckboxSelectedForm [
	"Answer the form for a selected checkbox."

	^(Form
	extent: 14@14
	depth: 32
	fromArray: #( 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 591416973 3914425236 4134435746 4134435746 4134435746 4134435746 4134435746 4134435746 4134435746 4134435746 4134435746 4134435746 3914425236 591416973 2571195527 4289245124 4293125612 4293125612 4293125612 4293125612 4293125612 4293125612 4293125612 4293125612 4293125612 4293125612 4289245124 2520929417 2655015551 4289114053 4291744479 4291744479 4291744479 4291744479 4291744479 4291744479 4291744479 4291744479 4291744479 4291744479 4289114053 2604684160 2654949242 4288456640 4290560980 4290560980 4290560980 4290560980 4290560980 4290560980 4290560980 4290560980 4290560980 4290560980 4288456640 2604748668 2654817654 4287799485 4289443276 4289443276 4289443276 4289443276 4289443276 4289443276 4289443276 4289443276 4289443276 4289443276 4287799485 2604486007 2654686063 4287273914 4288457669 4288457669 4288457669 4288457669 4288457669 4288457669 4288457669 4288457669 4288457669 4288457669 4287273914 2604420207 2654816618 4284907433 4284907433 4284907433 4284907433 4284907433 4284907433 4284907433 4284907433 4284907433 4284907433 4284907433 4284907433 2604484971 2654619492 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 2604353637 2654684509 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 4286092732 2604352863 2654487128 4286685382 4286685382 4286685382 4286685382 4286685382 4286685382 4286685382 4286685382 4286685382 4286685382 4286685382 4286685382 2604221017 2603892560 4287146187 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287278031 4287146187 2553626706 1310531626 4232599666 4284512149 4284512149 4284512149 4284512149 4284512149 4284512149 4284512149 4284512149 4284512149 4284512149 4232599666 1276977451 50331648 1210064935 1646208047 1646208047 1646208047 1646208047 1646208047 1646208047 1646208047 1646208047 1646208047 1646208047 1210064935 50331648)
	offset: 0@0)
]

{
	#category : #'morph creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newCloseControlIn: aThemedMorph for: aModel action: aValuable help: helpText [
	"Answer a button for closing things."
	
	|form msb|
	form := self windowCloseForm.
	msb := MultistateButtonMorph new extent: form extent.
	msb activeEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowClosePassiveForm.
	msb extent: form extent.
	msb activeDisabledNotOverUpFillStyle: (ImageFillStyle form: form).
	msb passiveEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	msb passiveDisabledNotOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowCloseOverForm.
	msb extent: form extent.
	msb
		activeEnabledOverUpFillStyle: (ImageFillStyle form: form);
		passiveEnabledOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowClosePassiveForm.
	msb
		extent: form extent;
		activeEnabledOverDownFillStyle: (ImageFillStyle form: form);
		passiveEnabledOverDownFillStyle: (ImageFillStyle form: form);
		addUpAction: aValuable;
		setBalloonText: helpText.
	^msb
]

{
	#category : #'morph creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newDialogPanelIn: aThemedMorph [
	"Answer a new (main) dialog panel."

	^(super 
		newDialogPanelIn: aThemedMorph)
		fillStyle: (SolidFillStyle color: Color transparent) "no pane colour tracking"
]

{
	#category : #'morph creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newFocusIndicatorMorphFor: aMorph [
	"Answer a new focus indicator for the given morph."

	|radius|
	radius := aMorph focusIndicatorCornerRadius.
	^BorderedMorph new
		fillStyle: Color transparent;
		borderStyle: ((CompositeBorder new width: radius)
						borders: {RoundedBorder new
									cornerRadius: radius;
									width: 1;
									baseColor: self settings scrollbarColor.
								RoundedBorder new	
									cornerRadius: radius - 1;
									width: 1;
									baseColor: (self settings scrollbarColor alpha: 0.4)});
		bounds: aMorph focusBounds
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newRadioButtonForm [
	"Answer the form for a normal radio button."

	^(Form
	extent: 14@14
	depth: 32
	fromArray: #( 16777215 16777215 16777215 198234320 2645865652 3568415153 4072521149 4055875519 3551637937 2578756788 164021958 16777215 16777215 16777215 16777215 16777215 1437906100 4038506166 4292598747 4293914607 4294111986 4294111986 4293914607 4292598747 4021728950 1303556786 16777215 16777215 16777215 1386916522 4257465283 4293388263 4293651435 4293651435 4293651435 4293651435 4293651435 4293651435 4293388263 4240556481 1219144362 16777215 195207842 4038177201 4293125091 4293256677 4293256677 4293256677 4293256677 4293256677 4293256677 4293256677 4293256677 4293059298 3987713967 144678815 2627640990 4291875024 4292993505 4292993505 4292993505 4292993505 4292993505 4292993505 4292993505 4292993505 4292993505 4292993505 4291743438 2459803037 3584139681 4292072403 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292861919 4292006610 3500056222 3970476200 4291809231 4292467161 4292532954 4292532954 4292532954 4292532954 4292532954 4292532954 4292532954 4292532954 4292467161 4291809231 3919947173 3919749794 4292203989 4292203989 4292203989 4292203989 4292203989 4292203989 4292203989 4292203989 4292203989 4292203989 4292203989 4292203989 3869154974 3515846543 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 4292664540 3431697291 2289333364 4291480266 4293125091 4293125091 4293125091 4293125091 4293125091 4293125091 4293125091 4293125091 4293125091 4293125091 4291151301 2154918257 189154886 3817178501 4293256677 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4293585642 4293059298 3766583681 189154886 16777215 960906822 4120221077 4293322470 4294111986 4294111986 4294111986 4294111986 4294111986 4294111986 4293256677 4103180689 927549769 16777215 16777215 16777215 910048830 3682039671 4290756543 4293256677 4294572537 4294506744 4293190884 4273847741 3648287860 893337407 16777215 16777215 16777215 16777215 16777215 169482778 1799570243 3042202708 3681710706 3664867697 3025359699 1799636036 169482778 16777215 16777215 16777215)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newRadioButtonMarkerForm [
	"Answer a new radio button marker form."

	^(Form
	extent: 12@12
	depth: 32
	fromArray: #( 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 0 0 0 0 0 0 0 0 16777215 16777215 16777215 16777215 0 0 268435456 1392508928 1392508928 268435456 0 0 16777215 16777215 16777215 16777215 0 268435456 3439329280 4278190080 4211081216 3355443200 268435456 0 16777215 16777215 16777215 16777215 0 1392508928 4278190080 4278190080 4278190080 4244635648 1392508928 0 16777215 16777215 16777215 16777215 0 1392508928 4278190080 4278190080 4261412864 4261412864 1308622848 0 16777215 16777215 16777215 16777215 0 268435456 3439329280 4278190080 4261412864 3422552064 234881024 0 16777215 16777215 16777215 16777215 0 0 268435456 1392508928 1392508928 268435456 0 0 16777215 16777215 16777215 16777215 0 0 0 0 0 0 0 0 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newRadioButtonSelectedForm [
	"Answer the form for a selected radio button."

	^(Form
	extent: 14@14
	depth: 32
	fromArray: #( 16777215 16777215 16777215 195273727 2641329849 3563221416 4067918510 4051207088 3546444457 2574352313 160337634 16777215 16777215 16777215 16777215 16777215 1433764797 4033509543 4289442502 4292467941 4292928234 4292928234 4292467941 4289442502 4016797863 1299613120 16777215 16777215 16777215 1383498170 4252665514 4291152600 4291744478 4291744478 4291744478 4291744478 4291744478 4291744478 4291087064 4235822507 1216120505 16777215 192187321 4033181089 4290232016 4290560980 4290560980 4290560980 4290560980 4290560980 4290560980 4290560980 4290560980 4290100687 3982914979 140541887 2623959968 4286746800 4289574859 4289574859 4289574859 4289574859 4289574859 4289574859 4289574859 4289574859 4289574859 4289574859 4286549679 2456319395 3579801242 4286353071 4288654533 4288654533 4288654533 4288654533 4288654533 4288654533 4288654533 4288654533 4288654533 4288654533 4286089901 3495980954 3965612183 4284709539 4286944951 4287011000 4287011000 4287011000 4287011000 4287011000 4287011000 4287011000 4287011000 4286813622 4284643746 3915280279 3915345555 4284973226 4284973226 4284973226 4284973226 4284973226 4284973226 4284973226 4284973226 4284973226 4284973226 4284973226 4284973226 3864947858 3512362887 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 4285500082 3428345476 2286835828 4285433514 4286026683 4286026683 4286026683 4286026683 4286026683 4286026683 4286026683 4286026683 4286026683 4286026683 4285235879 2152552048 187582022 3813958010 4286421439 4286553283 4286553283 4286553283 4286553283 4286553283 4286553283 4286553283 4286553283 4286355645 3763494776 187582022 16777215 959790667 4116343939 4286685122 4287014603 4287014603 4287014603 4287014603 4287014603 4287014603 4286619329 4099500930 926039117 16777215 16777215 16777215 908735550 3679148137 4285630628 4286882500 4287541204 4287541204 4286816707 4268787875 3645527655 892024127 16777215 16777215 16777215 16777215 16777215 169482778 1798387264 3040494156 3679082084 3662239075 3023716940 1798452800 169482778 16777215 16777215 16777215)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newScrollbarThumbBottomForm [
	"Answer the form for the bottom of a scrollbar thumb."

	^(Form
	extent: 13@7
	depth: 32
	fromArray: #( 4284182411 4287142063 4287931577 4287602613 4287208113 4286879149 4286484649 4286155685 4285761185 4285432221 4285103257 4284577427 4282669690 4284182411 4286287012 4287931577 4287602613 4287208113 4286879149 4286484649 4286155685 4285761185 4285432221 4285103257 4284182670 4282669690 2906411633 4284445326 4287536820 4287602613 4287208113 4286879149 4286484649 4286155685 4285761185 4285432221 4285103257 4283261825 3023720303 2033601901 4284182411 4285037205 4287339698 4287208113 4286879149 4286484649 4286155685 4285761185 4285432221 4283919242 4282801275 2503363949 1149473452 2755548019 4284050825 4284248204 4285958562 4286681770 4286484649 4286155685 4285037464 4283656069 4282998397 3023720559 1262704758 0 422725477 2083867754 2671004523 4283787654 4283656068 4283656325 4283392897 4283195776 3023786609 2688176497 926700403 73298833 0 0 0 1345735788 1999981163 2671004523 2671004523 2671004523 2167753578 1580616556 171134054 0 0)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newScrollbarThumbHorizontalMiddleForm [
	"Answer the form for the middle of a horizontal scrollbar thumb."

	^(Form
	extent: 1@13
	depth: 32
	fromArray: #( 4284182411 4288326078 4287931577 4287602613 4287208113 4286879149 4286484649 4286155685 4285761185 4285432221 4285103257 4284709013 4282669690)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newScrollbarThumbLeftForm [
	"Answer the form for the left hand side of a scrollbar thumb."

	^(Form
	extent: 7@13
	depth: 32
	fromArray: #( 0 0 1149473452 2033601901 2906411633 4284182411 4284182411 0 422725477 2755548019 4284182411 4284445326 4286287012 4287142063 0 2083867754 4284050825 4285037205 4287536820 4287931577 4287931577 1345735788 2671004523 4284248204 4287339698 4287602613 4287602613 4287602613 1999981163 4283787654 4285958562 4287208113 4287208113 4287208113 4287208113 2671004523 4283656068 4286681770 4286879149 4286879149 4286879149 4286879149 2671004523 4283656325 4286484649 4286484649 4286484649 4286484649 4286484649 2671004523 4283392897 4286155685 4286155685 4286155685 4286155685 4286155685 2167753578 4283195776 4285037464 4285761185 4285761185 4285761185 4285761185 1580616556 3023786609 4283656069 4285432221 4285432221 4285432221 4285432221 171134054 2688176497 4282998397 4283919242 4285103257 4285103257 4285103257 0 926700403 3023720559 4282801275 4283261825 4284182670 4284577427 0 73298833 1262704758 2503363949 3023720303 4282669690 4282669690)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newScrollbarThumbRightForm [
	"Answer the form for the right hand side of a scrollbar thumb."

	^(Form
	extent: 7@13
	depth: 32
	fromArray: #( 4284182411 4284182411 2587118699 1396330353 211462590 0 0 4287010734 4285629341 4284182411 4284182411 2033601901 0 0 4287931577 4287931577 4286682026 4284313740 4284050825 1261587049 0 4287602613 4287602613 4287602613 4286418855 4283919239 2587118699 422725477 4287208113 4287208113 4287208113 4287208113 4284971669 4283787654 1345735788 4286879149 4286879149 4286879149 4286879149 4285629597 4283656068 1832209003 4286484649 4286484649 4286484649 4286484649 4285695391 4283458947 1999981163 4286155685 4286155685 4286155685 4286155685 4285169048 4283392897 1916095595 4285761185 4285761185 4285761185 4285761185 4284379535 4283195776 1345735788 4285432221 4285432221 4285432221 4285037464 4283195775 2671004523 758270315 4285103257 4285103257 4284905878 4283327362 4282998397 1664502380 0 4284380048 4283853961 4282932861 4282801275 2419477869 171134054 0 4282669690 4282669690 2755021932 2436846708 322261099 0 0)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newScrollbarThumbTopForm [
	"Answer the form for the top of a scrollbar thumb."

	^(Form
	extent: 13@7
	depth: 32
	fromArray: #( 0 0 0 422725477 1345735788 1832209003 1999981163 1916095595 1345735788 758270315 0 0 0 0 0 1261587049 2587118699 4283787654 4283656068 4283458947 4283392897 4283195776 2671004523 1664502380 171134054 0 211462590 2033601901 4284050825 4283919239 4284971669 4285629597 4285695391 4285169048 4284379535 4283195775 4282998397 2419477869 322261099 1396330353 4284182411 4284313740 4286418855 4287208113 4286879149 4286484649 4286155685 4285761185 4285037464 4283327362 4282801275 2436846708 2587118699 4284182411 4286682026 4287602613 4287208113 4286879149 4286484649 4286155685 4285761185 4285432221 4284905878 4282932861 2755021932 4284182411 4285629341 4287931577 4287602613 4287208113 4286879149 4286484649 4286155685 4285761185 4285432221 4285103257 4283853961 4282669690 4284182411 4287010734 4287931577 4287602613 4287208113 4286879149 4286484649 4286155685 4285761185 4285432221 4285103257 4284380048 4282669690)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newScrollbarThumbVerticalMiddleForm [
	"Answer the form for the middle of a vertical scrollbar thumb."

	^(Form
	extent: 13@1
	depth: 32
	fromArray: #( 4284182411 4288326078 4287931577 4287602613 4287208113 4286879149 4286484649 4286155685 4285761185 4285432221 4285103257 4284709013 4282669690)
	offset: 0@0)
]

{
	#category : #'morph creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newTaskbarThumbnailIn: aThemedMorph for: aWindow [
	"Answer a taskbar thumbnail morph for the given window."

	|answer thumb|
	thumb := aWindow taskbarThumbnail.
	answer := PanelMorph new
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		changeTableLayout;
		layoutInset: 8;
		cellInset: 4;
		addMorphBack: thumb;
		addMorphBack: ((self
			buttonLabelForText: (aWindow labelString truncateWithElipsisTo: 50))
				color: Color white).
	answer
		extent: answer minExtent;
		fillStyle: (self taskListFillStyleFor: answer);
		borderStyle: (self taskbarThumbnailNormalBorderStyleFor: aWindow);
		cornerStyle: (self taskbarThumbnailCornerStyleFor: answer).
	^answer
			
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newTreeExpandedForm [
	"Answer a new form for an expanded tree item."

	^(Form
	extent: 9@9
	depth: 32
	fromArray: #( 1049135240 2290649224 2290649224 2290649224 2290649224 2290649224 2290649224 2290649224 1200130184 478709896 4169697416 4287137928 4287137928 4287137928 4287137928 4287137928 4236806280 646482056 16777215 2508753032 4287137928 4287137928 4287137928 4287137928 4287137928 2726856840 16777215 16777215 495487112 4186474632 4287137928 4287137928 4287137928 4236806280 612927624 16777215 16777215 16777215 2542307464 4287137928 4287137928 4287137928 2676525192 16777215 16777215 16777215 16777215 478709896 4169697416 4287137928 4220029064 579373192 16777215 16777215 16777215 16777215 16777215 2424866952 4287137928 2626193544 16777215 16777215 16777215 16777215 16777215 16777215 394823816 4018702472 529041544 16777215 16777215 16777215 16777215 16777215 16777215 16777215 864585864 16777215 16777215 16777215 16777215)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newTreeUnexpandedForm [
	"Answer a new form for an unexpanded tree item."

	^(Form
	extent: 9@9
	depth: 32
	fromArray: #( 1049135240 461932680 16777215 16777215 16777215 16777215 16777215 16777215 16777215 2324203656 4152920200 2458421384 428378248 16777215 16777215 16777215 16777215 16777215 2357758088 4287137928 4287137928 4152920200 2408089736 394823816 16777215 16777215 16777215 2391312520 4287137928 4287137928 4287137928 4287137928 4119365768 2324203656 344492168 16777215 2408089736 4287137928 4287137928 4287137928 4287137928 4287137928 4287137928 3968370824 780699784 2391312520 4287137928 4287137928 4287137928 4287137928 4236806280 2659747976 529041544 16777215 2357758088 4287137928 4287137928 4253583496 2810742920 646482056 16777215 16777215 16777215 2324203656 4253583496 2777188488 696813704 16777215 16777215 16777215 16777215 16777215 1200130184 663259272 16777215 16777215 16777215 16777215 16777215 16777215 16777215)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newWindowCloseForm [
	"Answer a new form for a window close box."

	^(Form
	extent: 16@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4290361785 4285822068 4282071867 4279440147 4279440147 4282071867 4285822068 4290361785 0 0 0 0 0 0 0 4287335307 4281808438 4283254086 4286543478 4288254096 4288188560 4286543478 4283254086 4281808438 4287335307 0 0 0 0 0 4287138185 4280425243 4285027670 4289633180 4292135884 4293254878 4293320928 4292267469 4289567644 4285093206 4280490779 4287203978 0 0 0 4290164406 4282134834 4284233271 4288637549 4291401881 4292653234 4292850869 4292785333 4292653234 4291467161 4288637549 4284364600 4282266163 4290230199 0 0 4286545534 4283178015 4287182138 4289281086 4290597711 4290995037 4291126110 4291126109 4290929244 4290662991 4289281086 4287182394 4283309344 4286611327 0 0 4283383359 4285867306 4288685092 4289799715 4290590512 4290856252 4290988611 4291054147 4290922044 4290590256 4289930531 4288619300 4285867562 4283711040 0 0 4282782229 4287833644 4289996837 4290787376 4291381825 4291909968 4292173910 4292239446 4292106833 4291578692 4290984239 4290193702 4287833644 4283044630 0 0 4284026900 4289014315 4291051835 4291973448 4292633434 4293226345 4293556336 4293622129 4293358699 4292896092 4292236105 4291445307 4289014058 4284092436 0 0 4285414719 4289343786 4291712331 4293027933 4293949038 4294280317 4294479236 4294479236 4294346110 4294015086 4293224799 4291974475 4289343785 4285545791 0 0 4287264888 4288555300 4292239449 4293818479 4294542716 4294546314 4294614419 4294614676 4294546828 4294543230 4293884271 4292501850 4288751652 4287330424 0 0 4290558650 4286658615 4291253841 4293951868 4294481292 4294615447 4294617247 4294618017 4294616217 4294481550 4294214781 4291779154 4286789430 4290493114 0 0 4292664540 4288385426 4287573545 4292374633 4293892240 4294289824 4294555050 4294555308 4294356387 4293958547 4292835183 4287836460 4288385426 4292664540 0 0 0 4292993505 4288320403 4286993487 4289421400 4291463295 4292845463 4293043354 4291660419 4289684573 4287256400 4288254867 4292993505 0 0 0 0 0 4292927712 4291282630 4287858566 4286996058 4286533190 4286598726 4287324509 4287858309 4291348680 4292927712 0 0 0 0 0 0 0 4292401368 4293125091 4293454056 4293190884 4293190884 4293190884 4293125091 4292401368 0 0 0 0)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newWindowCloseOverForm [
	"Answer a new form for a window close box for use when the mouse is over it."

	^(Form
	extent: 16@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4290361785 4285822068 4282071867 4279440147 4279440147 4282071867 4285822068 4290361785 0 0 0 0 0 0 0 4287335307 4281808438 4283254086 4286543478 4288254096 4288188560 4286543478 4283254086 4281808438 4287335307 0 0 0 0 0 4287138185 4280425243 4285027670 4289633180 4292135884 4293254878 4293320928 4292267469 4289567644 4285093206 4280490779 4287203978 0 0 0 4290164406 4282134834 4284233271 4287126365 4286603617 4292192940 4292850869 4292785333 4292192940 4286011738 4286666328 4284364600 4282266163 4290230199 0 0 4286545534 4283178015 4286985273 4284555811 4284360999 4285741623 4291126110 4290272343 4285676086 4284360743 4284555811 4287182394 4283309344 4286611327 0 0 4283383359 4285867306 4288685092 4289012512 4285079066 4284293404 4285344037 4285803560 4284293404 4285472540 4289340193 4288619300 4285867562 4283711040 0 0 4282782229 4287833644 4289996837 4290787376 4291381825 4285870380 4284886569 4284952105 4286395695 4291578692 4290984239 4290193702 4287833644 4283044630 0 0 4284026900 4289014315 4291051835 4291973448 4292502105 4286988605 4285544758 4285610550 4287054910 4292830299 4292236105 4291445307 4289014058 4284092436 0 0 4285414719 4289343786 4291712331 4292502618 4287513921 4285808187 4287779662 4287713869 4285808443 4287514433 4292699484 4291974475 4289343785 4285545791 0 0 4287264888 4288555300 4292239449 4288171078 4286333501 4287320653 4294614419 4294351761 4287846482 4286333758 4287448897 4292501850 4288751652 4287330424 0 0 4290558650 4286658615 4291253841 4291718762 4287518032 4293564045 4294617247 4294618017 4293827729 4287518289 4291193701 4291779154 4286789430 4290493114 0 0 4292664540 4288385426 4287573545 4292374633 4293629325 4294289824 4294555050 4294555308 4294356387 4293958547 4292835183 4287836460 4288385426 4292664540 0 0 0 4292993505 4288320403 4286993487 4289421400 4291463295 4292845463 4293043354 4291660419 4289684573 4287256400 4288254867 4292993505 0 0 0 0 0 4292927712 4291282630 4287858566 4286996058 4286533190 4286598726 4287324509 4287858309 4291348680 4292927712 0 0 0 0 0 0 0 4292401368 4293125091 4293454056 4293190884 4293190884 4293190884 4293125091 4292401368 0 0 0 0)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newWindowInactiveControlForm [
	"Answer a new form for an inactive window control box."

	^(Form
	extent: 16@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4291677645 4288585374 4286085240 4284243036 4284243036 4286085240 4288585374 4291677645 0 0 0 0 0 0 0 4289572269 4285756275 4286479998 4288716960 4289835441 4289835441 4288716960 4286479998 4285756275 4289572269 0 0 0 0 0 4289506476 4284835173 4287335307 4290559164 4292598747 4293322470 4293322470 4292598747 4290559164 4287335307 4284703587 4289506476 0 0 0 4291546059 4285493103 4286414205 4288980132 4291217094 4292335575 4292598747 4292598747 4292335575 4291282887 4288980132 4286282619 4285493103 4291546059 0 0 4288980132 4285361517 4287466893 4288782753 4289835441 4290295992 4290295992 4290427578 4290164406 4289835441 4288782753 4287466893 4285361517 4288980132 0 0 4286282619 4286611584 4288059030 4288716960 4289177511 4289572269 4289835441 4289835441 4289703855 4289374890 4288782753 4288059030 4286611584 4286282619 0 0 4285164138 4287664272 4288782753 4289374890 4289835441 4290427578 4290624957 4290624957 4290559164 4290032820 4289374890 4288914339 4287664272 4285164138 0 0 4285361517 4288322202 4289703855 4290295992 4290822336 4291414473 4291677645 4291677645 4291414473 4291085508 4290427578 4289703855 4288453788 4285624689 0 0 4287072135 4288716960 4290427578 4291217094 4291677645 4292203989 4292598747 4292598747 4292335575 4291809231 4291217094 4290427578 4288716960 4287203721 0 0 4288980132 4288256409 4290624957 4291677645 4292335575 4292927712 4293256677 4293256677 4293059298 4292598747 4291809231 4290822336 4288256409 4289177511 0 0 4291677645 4287664272 4290295992 4292006610 4293059298 4293454056 4293585642 4293585642 4293454056 4293125091 4292203989 4290427578 4287730065 4291677645 0 0 4293256677 4290032820 4288124823 4291217094 4292796126 4293322470 4293717228 4293717228 4293454056 4292927712 4291677645 4288256409 4290032820 4293256677 0 0 0 4293454056 4290032820 4288322202 4289967027 4291546059 4292598747 4292664540 4291677645 4290295992 4288716960 4290032820 4293454056 0 0 0 0 0 4293322470 4292203989 4289835441 4288782753 4288322202 4288453788 4288980132 4289835441 4292335575 4293322470 0 0 0 0 0 0 0 4293059298 4293585642 4293717228 4293585642 4293585642 4293585642 4293585642 4293059298 0 0 0 0)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newWindowMaximizeForm [
	"Answer a new form for a window minimize box."

	^(Form
	extent: 16@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4290295992 4285822068 4282071867 4279440147 4279440147 4282071867 4285822068 4290295992 0 0 0 0 0 0 0 4287269514 4281611316 4282795590 4285953654 4287664528 4287730320 4285953654 4282861383 4281611316 4287269514 0 0 0 0 0 4287137928 4280360481 4283914839 4288455580 4291547084 4292731360 4292796894 4291547341 4288390044 4283980376 4280294689 4287203721 0 0 0 4290164406 4281348144 4282010170 4285369453 4288527772 4290565299 4291025080 4291025080 4290630835 4288593820 4285303917 4282009913 4281348144 4290164406 0 0 4286479998 4280431648 4282282296 4283995198 4286033222 4286821198 4286952786 4287018578 4286755662 4285967429 4284060735 4282216504 4280497696 4286545791 0 0 4282402111 4281097769 4282549797 4283800345 4284982554 4285771048 4285903149 4285837356 4285771304 4285114397 4283866393 4282484773 4281097769 4282402111 0 0 4279972116 4282219307 4283997212 4285114906 4285969451 4286824254 4287152961 4287218498 4286890301 4286167084 4285246490 4284260124 4282219308 4280037908 0 0 4279975186 4283600171 4285640744 4286561842 4287547718 4288336981 4288731227 4288731228 4288402775 4287614279 4286627889 4285772072 4283600683 4280172817 0 0 4282736189 4284126245 4286692666 4287877449 4288797275 4289586536 4290112367 4290112368 4289718377 4288863579 4287877448 4286758970 4284126756 4282803005 0 0 4286284920 4283533850 4287283524 4288731993 4289718632 4290507893 4291099774 4291165055 4290705785 4289850729 4288797788 4287415878 4283599642 4286350968 0 0 4290362041 4283331374 4286560575 4289322854 4290770809 4291559299 4291952522 4292083595 4291690372 4290903163 4289455464 4286889281 4283462959 4290362040 0 0 4292664540 4287928465 4283793702 4288007509 4290572412 4291689100 4292607381 4292607382 4291885710 4290900861 4288666201 4284122406 4287928465 4292664540 0 0 0 4292993505 4288059538 4284842051 4286688328 4289384043 4290962050 4291224710 4289646450 4287083084 4285171781 4287928466 4292993505 0 0 0 0 0 4292927712 4291217093 4287402885 4285630033 4284907832 4284973881 4285893715 4287468677 4291348680 4292927712 0 0 0 0 0 0 0 4292401368 4293125091 4293454056 4293190884 4293190884 4293190884 4293125091 4292401368 0 0 0 0)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newWindowMaximizeOverForm [
	"Answer a new form for a window maximize box for use when the mouse is over it."

	^(Form
	extent: 16@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4290295992 4285822068 4282071867 4279440147 4279440147 4282071867 4285822068 4290295992 0 0 0 0 0 0 0 4287269514 4281611316 4282795590 4285953654 4287664528 4287730320 4285953654 4282861383 4281611316 4287269514 0 0 0 0 0 4287137928 4280360481 4283914839 4288455580 4291547084 4288980902 4289046437 4291547341 4288390044 4283980376 4280294689 4287203721 0 0 0 4290164406 4281348144 4282010170 4285369453 4288527772 4287405445 4284113749 4284113749 4287405445 4288593820 4285303917 4282009913 4281348144 4290164406 0 0 4286479998 4280431648 4282282296 4283995198 4286033222 4284581178 4282209061 4282274853 4284515642 4285967429 4284060735 4282216504 4280497696 4286545791 0 0 4282402111 4281097769 4282549797 4282216466 4283070226 4283793437 4281749780 4281684244 4283661853 4283201813 4282282258 4282484773 4281097769 4282402111 0 0 4279972116 4282219307 4282347796 4281355787 4281750291 4282210588 4282276125 4282144028 4282210588 4281881876 4281421323 4282544916 4282219308 4280037908 0 0 4279975186 4283600171 4283531037 4281815829 4282473504 4282604837 4282999593 4282999594 4282736679 4282539552 4281881621 4283662365 4283600683 4280172817 0 0 4282736189 4284126245 4286692666 4285175604 4285832770 4286424651 4283657010 4283657267 4286490700 4285898818 4285175604 4286758970 4284126756 4282803005 0 0 4286284920 4283533850 4287283524 4288731993 4289718632 4287346007 4284118074 4284183610 4287478106 4289850729 4288797788 4287415878 4283599642 4286350968 0 0 4290362041 4283331374 4286560575 4289322854 4290770809 4288134753 4284511807 4284577344 4288200290 4290903163 4289455464 4286889281 4283462959 4290362040 0 0 4292664540 4287928465 4283793702 4288007509 4290572412 4291689100 4288920687 4288920687 4291885710 4290900861 4288666201 4284122406 4287928465 4292664540 0 0 0 4292993505 4288059538 4284842051 4286688328 4289384043 4290962050 4291224710 4289646450 4287083084 4285171781 4287928466 4292993505 0 0 0 0 0 4292927712 4291217093 4287402885 4285630033 4284907832 4284973881 4285893715 4287468677 4291348680 4292927712 0 0 0 0 0 0 0 4292401368 4293125091 4293454056 4293190884 4293190884 4293190884 4293125091 4292401368 0 0 0 0)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newWindowMenuForm [
	"Answer a new form for a window menu box."

	^(Form
	extent: 24@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4293125091 4287335307 4283453520 4281150765 4280690214 4280821800 4280821800 4280821800 4280821800 4280821800 4280821800 4280821800 4280821800 4280690214 4281150765 4283453520 4287335307 4293125091 0 0 0 0 0 4293059298 4285493103 4282795590 4287072135 4289638062 4290493371 4290822336 4290756543 4290756543 4290822336 4290822336 4290756543 4290756543 4290822336 4290493371 4289638062 4287072135 4282795590 4285493103 4293059298 0 0 0 0 4287335307 4282598211 4288322202 4291875024 4292927712 4293322470 4293519849 4293519849 4293519849 4293519849 4293519849 4293519849 4293519849 4293519849 4293322470 4292927712 4291875024 4288322202 4282598211 4287401100 0 0 0 0 4283585106 4285953654 4289967027 4291677645 4292269782 4292401368 4292401368 4292401368 4292335575 4292335575 4292335575 4292335575 4292401368 4292401368 4292401368 4292269782 4291677645 4289967027 4285953654 4283585106 0 0 0 0 4281742902 4287861651 4290493371 4291085508 4291480266 4291546059 4291611852 4291611852 4291546059 4291480266 4291480266 4291546059 4291611852 4291611852 4291546059 4291480266 4291085508 4290493371 4287861651 4281742902 0 0 0 0 4281940281 4288782753 4291414473 4292203989 4292664540 4292796126 4292927712 4292796126 4292861919 4292927712 4292927712 4292861919 4292796126 4292927712 4292796126 4292664540 4292203989 4291414473 4288782753 4281874488 0 0 0 0 4284045657 4288256409 4291546059 4293190884 4294177779 4294572537 4294440951 4294572537 4294506744 4294572537 4294572537 4294506744 4294572537 4294440951 4294572537 4294177779 4293190884 4291546059 4288256409 4284045657 0 0 0 0 4287269514 4283914071 4290624957 4293190884 4294638330 4294769916 4294835709 4294835709 4294835709 4294835709 4294835709 4294835709 4294835709 4294835709 4294769916 4294638330 4293190884 4290624957 4283914071 4287269514 0 0 0 0 4292467161 4286414205 4283387727 4287993237 4291019715 4292269782 4292467161 4292467161 4292467161 4292467161 4292467161 4292467161 4292467161 4292467161 4292598747 4291611852 4287993237 4283387727 4286414205 4292467161 0 0 0 0 4292401368 4292467161 4288124823 4284177243 4281150765 4280229663 4280361249 4280361249 4280361249 4280361249 4280361249 4280361249 4280361249 4280361249 4280229663 4281282351 4284177243 4288124823 4292467161 4292401368 0 0 0 0 0 4292203989 4292203989 4292335575 4292401368 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292927712 4292664540 4292401368 4292335575 4292269782 4292203989 0 0 0 0 0 0 0 4292006610 4292401368 4292467161 4292730333 4292730333 4292730333 4292730333 4292730333 4292730333 4292730333 4292730333 4292730333 4292796126 4292467161 4292401368 4292006610 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newWindowMenuOverForm [
	"Answer a new form for a window menu box when the mouse is over it."

	^(Form
	extent: 24@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4293257970 4287735753 4284054189 4281884573 4281490073 4281555866 4281555866 4281555866 4281555866 4281555866 4281555866 4281555866 4281555866 4281490073 4281884573 4284054189 4287735753 4293257970 0 0 0 0 0 4293192178 4286026172 4283462312 4287538375 4289970905 4290759648 4291088354 4291022817 4291022817 4291088354 4291088354 4291022817 4291022817 4291088354 4290759648 4289970905 4287538375 4283462312 4286026172 4293192178 0 0 0 0 4287735753 4283265191 4288721616 4292074729 4293060849 4293455092 4293652469 4293652469 4293652469 4293652469 4293652469 4293652469 4293652469 4293652469 4293455092 4293060849 4292074729 4288721616 4283265191 4287801545 0 0 0 0 4284185518 4286420927 4290233820 4291877352 4292468972 4292535021 4292535021 4292535021 4292534765 4292534765 4292534765 4292534765 4292535021 4292535021 4292535021 4292468972 4291877352 4290233820 4286420927 4284185518 0 0 0 0 4282476193 4288261581 4290759648 4291351268 4291680231 4291746023 4291811559 4291811559 4291746023 4291680231 4291680231 4291746023 4291811559 4291811559 4291746023 4291680231 4291351268 4290759648 4288261581 4282476193 0 0 0 0 4282673314 4289116371 4291614438 4292403180 4292797935 4292929264 4293060849 4292929264 4292995056 4293060849 4293060849 4292995056 4292929264 4293060849 4292929264 4292797935 4292403180 4291614438 4289116371 4282607522 0 0 0 0 4284645809 4288655823 4291746023 4293323763 4294244090 4294638589 4294507004 4294638589 4294572796 4294638589 4294638589 4294572796 4294638589 4294507004 4294638589 4294244090 4293323763 4291746023 4288655823 4284645809 0 0 0 0 4287669960 4284514224 4290891232 4293323763 4294704381 4294835710 4294901503 4294901503 4294901503 4294901503 4294901503 4294901503 4294901503 4294901503 4294835710 4294704381 4293323763 4290891232 4284514224 4287669960 0 0 0 0 4292600558 4286880962 4283988397 4288392910 4291285731 4292468972 4292600558 4292600558 4292600558 4292600558 4292600558 4292600558 4292600558 4292600558 4292732143 4291811559 4288392910 4283988397 4286880962 4292600558 0 0 0 0 4292535021 4292600558 4288524495 4284777138 4281884573 4281029782 4281161367 4281161367 4281161367 4281161367 4281161367 4281161367 4281161367 4281161367 4281029782 4282015902 4284777138 4288524495 4292600558 4292535021 0 0 0 0 0 4292403180 4292403180 4292534765 4292535021 4293060849 4293060849 4293060849 4293060849 4293060849 4293060849 4293060849 4293060849 4293060849 4292797935 4292535021 4292534765 4292468972 4292403180 0 0 0 0 0 0 0 4292206058 4292535021 4292600558 4292863472 4292863472 4292863472 4292863472 4292863472 4292863472 4292863472 4292863472 4292863472 4292929264 4292600558 4292535021 4292206058 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newWindowMenuPassiveForm [
	"Answer a new form for a window menu box when inactive."

	^(Form
	extent: 24@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294046193 4291085508 4289111718 4287927444 4287664272 4287730065 4287730065 4287730065 4287730065 4287730065 4287730065 4287730065 4287730065 4287664272 4287927444 4289111718 4291085508 4294046193 0 0 0 0 0 4293980400 4290164406 4288782753 4290953922 4292269782 4292664540 4292861919 4292796126 4292796126 4292861919 4292861919 4292796126 4292796126 4292861919 4292664540 4292269782 4290953922 4288782753 4290164406 4293980400 0 0 0 0 4291085508 4288651167 4291546059 4293388263 4293914607 4294111986 4294243572 4294243572 4294243572 4294243572 4294243572 4294243572 4294243572 4294243572 4294111986 4293914607 4293388263 4291546059 4288651167 4291085508 0 0 0 0 4289177511 4290361785 4292401368 4293322470 4293585642 4293651435 4293651435 4293651435 4293651435 4293651435 4293651435 4293651435 4293651435 4293651435 4293651435 4293585642 4293322470 4292401368 4290361785 4289177511 0 0 0 0 4288190616 4291348680 4292664540 4292993505 4293190884 4293190884 4293256677 4293256677 4293190884 4293190884 4293190884 4293190884 4293256677 4293256677 4293190884 4293190884 4292993505 4292664540 4291348680 4288190616 0 0 0 0 4288322202 4291809231 4293125091 4293585642 4293783021 4293848814 4293914607 4293848814 4293914607 4293914607 4293914607 4293914607 4293848814 4293914607 4293848814 4293783021 4293585642 4293125091 4291809231 4288322202 0 0 0 0 4289374890 4291546059 4293190884 4294046193 4294572537 4294769916 4294704123 4294769916 4294704123 4294769916 4294769916 4294704123 4294769916 4294704123 4294769916 4294572537 4294046193 4293190884 4291546059 4289374890 0 0 0 0 4291019715 4289309097 4292730333 4294046193 4294769916 4294835709 4294901502 4294901502 4294901502 4294901502 4294901502 4294901502 4294901502 4294901502 4294835709 4294769916 4294046193 4292730333 4289309097 4291019715 0 0 0 0 4293717228 4290624957 4289045925 4291414473 4292927712 4293585642 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293717228 4293783021 4293256677 4291414473 4289045925 4290624957 4293717228 0 0 0 0 4293651435 4293717228 4291480266 4289440683 4287927444 4287466893 4287532686 4287532686 4287532686 4287532686 4287532686 4287532686 4287532686 4287532686 4287466893 4287993237 4289440683 4291480266 4293717228 4293651435 0 0 0 0 0 4293585642 4293585642 4293651435 4293651435 4293914607 4293914607 4293914607 4293914607 4293914607 4293914607 4293914607 4293914607 4293914607 4293783021 4293651435 4293651435 4293585642 4293585642 0 0 0 0 0 0 0 4293454056 4293651435 4293717228 4293848814 4293848814 4293848814 4293848814 4293848814 4293848814 4293848814 4293848814 4293848814 4293848814 4293717228 4293651435 4293454056 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newWindowMinimizeForm [
	"Answer a new form for a window minimize box."

	^(Form
	extent: 16@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4290295992 4285953140 4282726971 4280619283 4280619283 4282661434 4285953140 4290295992 0 0 0 0 0 0 0 4287400586 4282921779 4284629572 4287526262 4288909456 4288974992 4287591798 4284761414 4282856243 4287400586 0 0 0 0 0 4287334536 4282588703 4286796631 4290682268 4292529868 4293385950 4293385950 4292529612 4290682268 4286731095 4282654242 4287400329 0 0 0 4290164406 4283247407 4286332215 4290281068 4292457116 4293447349 4293579448 4293579447 4293447349 4292457116 4290346605 4286660409 4283771952 4290164406 0 0 4287004286 4284555291 4289551160 4291461439 4292647750 4292978252 4292978510 4292978510 4292912459 4292516422 4291461695 4289485625 4285736224 4287004543 0 0 4284694079 4287316261 4291129383 4292379927 4292907543 4293237538 4293434920 4293369896 4293303330 4293104407 4292380439 4291130151 4288301098 4284694078 0 0 4285013269 4289947179 4292577049 4293498387 4293959974 4294159159 4294291774 4294357567 4294291256 4294091813 4293695508 4292774682 4290144044 4285013782 0 0 4286197779 4291263275 4293565218 4294486826 4294752322 4294754384 4294624599 4294756183 4294755663 4294753345 4294618155 4293828129 4291395115 4286263315 0 0 4286797373 4291592487 4294093364 4294753602 4294822482 4294825059 4294826346 4294826603 4294825828 4294822740 4294753602 4294225462 4291855399 4286928446 0 0 4287791736 4290870043 4294029633 4294691156 4294826081 4294894447 4294962297 4294963066 4294895474 4294892130 4294691669 4294096449 4291001115 4287857272 0 0 4290558649 4287916079 4292847677 4294431071 4294829938 4294964349 4294965892 4294966661 4294964606 4294896499 4294563169 4292980029 4287981872 4290558648 0 0 4292664540 4288452497 4288312611 4292590416 4294239351 4294636933 4294835601 4294835346 4294637704 4294306681 4293052245 4288576291 4288452497 4292664540 0 0 0 4292993505 4288321426 4287199810 4289700930 4291873639 4293321856 4293387137 4292005738 4290096709 4287463236 4288321426 4292993505 0 0 0 0 0 4292927712 4291282629 4287861124 4287137103 4286939445 4286939701 4287532112 4287926916 4291348680 4292927712 0 0 0 0 0 0 0 4292401368 4293125091 4293454056 4293190884 4293190884 4293190884 4293125091 4292401368 0 0 0 0)
	offset: 0@0)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>newWindowMinimizeOverForm [
	"Answer a new form for a window maximize box for use when the mouse is over it."

	^(Form
	extent: 16@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4290295992 4285953140 4282726971 4280619283 4280619283 4282661434 4285953140 4290295992 0 0 0 0 0 0 0 4287400586 4282921779 4284629572 4287526262 4288909456 4288974992 4287591798 4284761414 4282856243 4287400586 0 0 0 0 0 4287334536 4282588703 4286796631 4290682268 4292529868 4293385950 4293385950 4292529612 4290682268 4286731095 4282654242 4287400329 0 0 0 4290164406 4283247407 4286332215 4290281068 4292457116 4293447349 4293579448 4293579447 4293447349 4292457116 4290346605 4286660409 4283771952 4290164406 0 0 4287004286 4284555291 4289551160 4291461439 4292647750 4292978252 4292978510 4292978510 4292912459 4292516422 4291461695 4289485625 4285736224 4287004543 0 0 4284694079 4287316261 4291129383 4288438288 4288833808 4289097752 4289229341 4289164317 4289098008 4288965136 4288438544 4291130151 4288301098 4284694078 0 0 4285013269 4289947179 4288569618 4285154312 4285483537 4285615897 4285616412 4285616669 4285616153 4285549585 4285285641 4288766994 4290144044 4285013782 0 0 4286197779 4291263275 4289294360 4285287186 4285748254 4285420579 4285487142 4285618471 4285618211 4285814302 4285352722 4289491479 4291395115 4286263315 0 0 4286797373 4291592487 4294093364 4290152751 4290220603 4290222407 4290223436 4290223693 4290222920 4290220860 4290152751 4294225462 4291855399 4286928446 0 0 4287791736 4290870043 4294029633 4294691156 4294826081 4294894447 4294962297 4294963066 4294895474 4294892130 4294691669 4294096449 4291001115 4287857272 0 0 4290558649 4287916079 4292847677 4294431071 4294829938 4294964349 4294965892 4294966661 4294964606 4294896499 4294563169 4292980029 4287981872 4290558648 0 0 4292664540 4288452497 4288312611 4292590416 4294239351 4294636933 4294835601 4294835346 4294637704 4294306681 4293052245 4288576291 4288452497 4292664540 0 0 0 4292993505 4288321426 4287199810 4289700930 4291873639 4293321856 4293387137 4292005738 4290096709 4287463236 4288321426 4292993505 0 0 0 0 0 4292927712 4291282629 4287861124 4287137103 4286939445 4286939701 4287532112 4287926916 4291348680 4292927712 0 0 0 0 0 0 0 4292401368 4293125091 4293454056 4293190884 4293190884 4293190884 4293125091 4292401368 0 0 0 0)
	offset: 0@0)
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>paneColorFor: aWindow [
	"Answer the pane color that should be used."
	
	^self settings fadedBackgroundWindows
		ifTrue: [aWindow fillStyleToUse asColor]
		ifFalse: [(self windowActiveFillStyleFor: aWindow) asColor]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>progressBarFillStyleFor: aProgressBar [
	"Return the progress bar fillStyle for the given progress bar."
	
	|area c|
	c := self progressBarColorFor: aProgressBar.
	area :=  aProgressBar bounds.
	^(GradientFillStyle ramp: {
			0.0->c twiceDarker.
			0.2->c twiceLighter lighter.
			0.3->c twiceLighter lighter.
			0.4->c darker.
			0.6->c twiceLighter lighter.
			1.0->Color white})
		origin: area origin;
		direction: 0@area height;
		radial: false
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>progressBarProgressFillStyleFor: aProgressBar [
	"Return the progress bar progress fillStyle for the given progress bar."
	
	|area c|
	c := self progressBarProgressColorFor: aProgressBar.
	area :=  aProgressBar bounds.
	^(GradientFillStyle ramp: {
			0.0->c twiceDarker.
			0.2->c twiceLighter lighter.
			0.3->c twiceLighter lighter.
			0.4->c darker.
			0.6->c twiceLighter lighter.
			1.0->Color white})
		origin: area origin;
		direction: 0@area height;
		radial: false
]

{
	#category : #border-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>radioButtonCornerStyleFor: aRadioButton [
	"Answer the corner style for radio buttons.
	Answer square when not disabled since the form is rounded."
	
	^aRadioButton enabled
		ifTrue: [#square]
		ifFalse: [#rounded]
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>radioButtonDisabledFillStyleFor: aRadioButton [
	"Return the disabled radio button fillStyle for the given button."
	
	^self radioButtonNormalFillStyleFor: aRadioButton
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>radioButtonForm [
	"Answer the form to use for a normal radio button."

	^self forms at: #radioButton ifAbsent: [Form extent: 14@14 depth: Display depth]
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>radioButtonNormalFillStyleFor: aRadioButton [
	"Return the normal radio button fillStyle for the given button."
	
	^(ImageFillStyle form: self radioButtonForm) origin: aRadioButton topLeft
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>radioButtonSelectedDisabledFillStyleFor: aRadioButton [
	"Return the selected disabled radio button fillStyle for the given button."
	
	^self radioButtonNormalFillStyleFor: aRadioButton
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>radioButtonSelectedFillStyleFor: aRadioButton [
	"Return the selected radio button fillStyle for the given button."
	
	^(ImageFillStyle form: self radioButtonSelectedForm) origin: aRadioButton topLeft
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>radioButtonSelectedForm [
	"Answer the form to use for a selected radio button."

	^self forms at: #radioButtonSelected ifAbsent: [Form extent: 14@14 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>resizerGripNormalFillStyleFor: aResizer [
	"Return the normal fillStyle for the given resizer.
	For the moment, answer a transparent colour for no drawing,
	non transparent to draw as normal."
	
	^Color transparent
]

{
	#category : #border-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollPaneNormalBorderStyleFor: aScrollPane [
	"Return the normal borderStyle for the given scroll pane."

	^BorderStyle simple
		width: 1;
		baseColor: aScrollPane paneColor
]

{
	#category : #fill-styles-scrollbars,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarImageColorFor: aScrollbar [
	"Return the scrollbar image colour (on buttons) for the given scrollbar."
	
	^(self baseScrollbarColorFor: aScrollbar) darker
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarMinimumThumbThickness [
	"Answer the minumum width or height of a scrollbar thumb 
	as appropriate to its orientation."
	
	^15
]

{
	#category : #border-styles-scrollbars,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarNormalButtonBorderStyleFor: aScrollbar [
	"Return the normal button borderStyle for the given scrollbar."

	^BorderStyle simple
		width: 0
]

{
	#category : #fill-styles-scrollbars,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarNormalButtonFillStyleFor: aScrollbar [
	"Return the normal scrollbar button fillStyle for the given scrollbar."
	
	|c|
	c := self baseScrollbarColorFor: aScrollbar.
	^(GradientFillStyle ramp: {0.0->c twiceLighter. 1.0->c darker})
		origin: aScrollbar topLeft;
		direction: (aScrollbar bounds isWide
			ifTrue: [0 @ aScrollbar height]
			ifFalse: [aScrollbar width @ 0]);
		radial: false
]

{
	#category : #fill-styles-scrollbars,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarNormalFillStyleFor: aScrollbar [
	"Return the normal scrollbar fillStyle for the given scrollbar."
	
	|aColor c|
	aColor := (self baseScrollbarColorFor: aScrollbar) muchLighter.
	c := aColor alphaMixed: 0.9 with: Color black.
	^(GradientFillStyle ramp: {0.0->c. 0.15->aColor. 0.75-> aColor lighter. 1.0->c})
		origin: aScrollbar topLeft;
		direction: (aScrollbar bounds isWide
			ifTrue: [0 @ aScrollbar height]
			ifFalse: [aScrollbar width @ 0]);
		radial: false
]

{
	#category : #fill-styles-scrollbars,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarNormalHorizontalThumbFillStyleFor: aScrollbar [
	"Return the normal scrollbar horizontal thumb fillStyle for the given scrollbar."
	
	|s l m r|
	s := aScrollbar slider.
	l := self scrollbarThumbLeftForm.
	m := self scrollbarThumbHorizontalMiddleForm.
	r := self scrollbarThumbRightForm.
	^CompositeFillStyle fillStyles: {
		(ImageFillStyle form: l) origin: s topLeft.
		(AlphaInfiniteForm with: m)
			origin: s topLeft + (l width@0);
			extent: (s width - l width - r width)@m height.
		(ImageFillStyle form: r)
			origin: s topRight - (r width@0)}
]

{
	#category : #border-styles-scrollbars,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarNormalThumbBorderStyleFor: aScrollbar [
	"Return the normal thumb borderStyle for the given scrollbar."

	^BorderStyle simple width: 0
]

{
	#category : #fill-styles-scrollbars,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarNormalThumbFillStyleFor: aScrollbar [
	"Return the normal scrollbar thumb fillStyle for the given scrollbar."
	
	^aScrollbar bounds isWide
		ifTrue: [self scrollbarNormalHorizontalThumbFillStyleFor: aScrollbar]
		ifFalse: [self scrollbarNormalVerticalThumbFillStyleFor: aScrollbar]
]

{
	#category : #fill-styles-scrollbars,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarNormalVerticalThumbFillStyleFor: aScrollbar [
	"Return the normal scrollbar vertical thumb fillStyle for the given scrollbar."
	
	|s t m b|
	s := aScrollbar slider.
	t := self scrollbarThumbTopForm.
	m := self scrollbarThumbVerticalMiddleForm.
	b := self scrollbarThumbBottomForm.
	^CompositeFillStyle fillStyles: {
		(ImageFillStyle form: t) origin: s topLeft.
		(AlphaInfiniteForm with: m)
			origin: s topLeft + (0@t height);
			extent: m width@(s height - t height - b height).
		(ImageFillStyle form: b)
			origin: s bottomLeft - (0@b height)}
]

{
	#category : #border-styles-scrollbars,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarPagingAreaCornerStyleIn: aThemedMorph [
	"Allow for themes to override default behaviour."
	
	^#rounded
]

{
	#category : #border-styles-scrollbars,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarPressedButtonBorderStyleFor: aScrollbar [
	"Return the pressed button borderStyle for the given scrollbar."
	^ self scrollbarNormalButtonBorderStyleFor: aScrollbar
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarThickness [
	"Answer the width or height of a scrollbar as appropriate to
	its orientation."
	
	^13
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarThumbBottomForm [
	"Answer the form to use for the bottom of a vertical scrollbar."

	^self forms at: #sbVThumbBottom ifAbsent: [Form extent: 13@7 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarThumbHorizontalMiddleForm [
	"Answer the form to use for the middle of a horizontal scrollbar."

	^self forms at: #sbHThumbMiddle ifAbsent: [Form extent: 1@13 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarThumbLeftForm [
	"Answer the form to use for the left of a horizontal scrollbar."

	^self forms at: #sbHThumbLeft ifAbsent: [Form extent: 7@13 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarThumbRightForm [
	"Answer the form to use for the right of a horizontal scrollbar."

	^self forms at: #sbHThumbRight ifAbsent: [Form extent: 7@13 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarThumbTopForm [
	"Answer the form to use for the top of a vertical scrollbar."

	^self forms at: #sbVThumbTop ifAbsent: [Form extent: 13@7 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>scrollbarThumbVerticalMiddleForm [
	"Answer the form to use for the middle of a vertical scrollbar."

	^self forms at: #sbVThumbMiddle ifAbsent: [Form extent: 13@1 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>splitterNormalFillStyleFor: aSplitter [
	"Return the normal splitter fillStyle for the given splitter."
	
	|aColor|
	aColor := aSplitter paneColor.
	^(GradientFillStyle ramp: {
		0.0->aColor twiceLighter. 1.0->aColor darker})
		origin: aSplitter topLeft;
		direction: (aSplitter splitsTopAndBottom
			ifTrue: [0 @ aSplitter height]
			ifFalse: [aSplitter width @ 0]);
		radial: false
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>splitterPressedFillStyleFor: aSplitter [
	"Return the pressed splitter fillStyle for the given splitter."
	
	|aColor|
	aColor := aSplitter paneColor duller.
	^(GradientFillStyle ramp: {
			0.0->aColor twiceLighter. 1.0->aColor twiceDarker})
		origin: aSplitter topLeft;
		direction: (aSplitter splitsTopAndBottom
			ifTrue: [0 @ aSplitter height]
			ifFalse: [aSplitter width @ 0]);
		radial: false
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>tabLabelInsetFor: aButton [
	"Answer the inset to use for a tab label."
	^ Margin left: 8 top: 2 right: 8 bottom: 2

]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>tabLabelNormalFillStyleFor: aTabLabel [
	"Return the normal fillStyle for the given tab label."
	
	|round roundCorners tl t tr l m r|
	round := aTabLabel wantsRoundedCorners.
	roundCorners := aTabLabel roundedCorners.
	tl := (round and: [roundCorners includes: 1]) ifTrue: [self buttonTopLeftForm] ifFalse: [self buttonSquareTopLeftForm].
	t := self buttonTopMiddleForm.
	tr := (round and: [roundCorners includes: 4]) ifTrue: [self buttonTopRightForm] ifFalse: [self buttonSquareTopRightForm].
	l := self buttonMiddleLeftForm. m := self buttonPlainMiddleColor. r := self buttonMiddleRightForm.
	^self
		multiFormTopFillStyleFrom: {tl. t. tr. l. m. r}
		in: aTabLabel bounds
]

{
	#category : #fill-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>tabLabelSelectedFillStyleFor: aTabLabel [
	"Return the selected fillStyle for the given tab label."
	
	|round roundCorners tl t tr l m r|
	round := aTabLabel wantsRoundedCorners.
	roundCorners := aTabLabel roundedCorners.
	tl := (round and: [roundCorners includes: 1]) ifTrue: [self buttonSelectedTopLeftForm] ifFalse: [self buttonSquareSelectedTopLeftForm].
	t := self buttonSelectedTopMiddleForm.
	tr := (round and: [roundCorners includes: 4]) ifTrue: [self buttonSelectedTopRightForm] ifFalse: [self buttonSquareSelectedTopRightForm].
	l := self buttonSelectedMiddleLeftForm. m := self buttonColouredMiddleColor. r := self buttonSelectedMiddleRightForm.
	^self
		multiFormTopFillStyleFrom: {tl. t. tr. l. m. r}
		in: aTabLabel bounds
]

{
	#category : #border-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>tabPanelBorderStyleFor: aTabGroup [
	"Answer the normal border style for a tab group."

	^TabPanelBorder new
		width: 1;
		baseColor: (aTabGroup paneColor alphaMixed: 0.8 with: Color black);
		tabSelector: aTabGroup tabSelectorMorph
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>tabSelectorCellInsetFor: aTabSelector [
	"Answer the cell inset to use for the given tab selector."

	^0
]

{
	#category : #basic-colors,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>taskbarActiveButtonColorFor: aButton [
	"Answer the colour for the given active taskbar button."

	^self scrollbarColor alphaMixed: 0.7 with: Color white
]

{
	#category : #basic-colors,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>taskbarButtonLabelColorFor: aButton [
	"Answer the colour for the label of the given taskbar button."

	^aButton model
		ifNil: [super taskbarButtonLabelColorFor: aButton]
		ifNotNil: [:win |
			win isActive
				ifTrue: [self selectionColor darker]
				ifFalse: [super taskbarButtonLabelColorFor: aButton]]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>taskbarFillStyleFor: aTaskbar [
	"Return the taskbar fillStyle for the given taskbar."
	
	|aColor c cm cd cb|
	aColor := self settings scrollbarColor alphaMixed: 0.5 with: aTaskbar color.
	c := aColor  alphaMixed: 0.3 with: Color white.
	cm := aColor alphaMixed: 0.8 with: Color white.
	cd := aColor alphaMixed: 0.6 with: Color black.
	cb := aColor alphaMixed: 0.7 with: Color white.
	^(GradientFillStyle ramp: {0.0->c. 0.1->cm. 0.9->cd. 1.0->cb})
		origin: aTaskbar position;
		direction: 0@27;
		radial: false
]

{
	#category : #basic-colors,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>taskbarMinimizedButtonColorFor: aButton [
	"Answer the colour for the given minimized taskbar button."

	^Color transparent
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>textEditorDisabledFillStyleFor: aTextEditor [
	"Return the disabled fillStyle for the given text editor."
	
	^self windowColor lighter
]

{
	#category : #border-styles-buttons,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>textEntryCornerStyleIn: aThemedMorph [
	"Answer the corner style to use for text entry morphs."
	
	^#square
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>textFieldNormalFillStyleFor: aTextField [
	"Return the normal fillStyle for the given text field."
	
	^ Color white
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>treeLineWidth [
	"Answer the width of the tree lines."

	^0
]

{
	#category : #fill-styles-scrollbars,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>useScrollbarThumbShadow [
	"Answer whether a shadow morph should be displayed when
	dragging a scrollbar thumb."

	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowActiveDropShadowStyle [
	"Answer the style of drop shadow to use for active windows."
	
	^windowActiveDropShadowStyle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowActiveDropShadowStyle: anObject [
	"Set the value of windowActiveDropShadowStyle"

	windowActiveDropShadowStyle := anObject
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowActiveFillStyleFor: aWindow [
	"Return the window active fillStyle for the given window."
	
	^self windowColor
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowActiveTitleFillStyleFor: aWindow [
	"Return the window active title fillStyle for the given window."
	
	|aColor|
	aColor := self windowColor.
	^(GradientFillStyle ramp: {
			0.0->aColor twiceLighter.
			1.0->aColor})	
		origin: aWindow labelArea topLeft;
		direction: 0 @ aWindow labelHeight;
		radial: false
]

{
	#category : #label-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowCloseOverForm [
	"Answer the form to use for mouse over window close buttons"

	^self forms at: #windowCloseOver ifAbsent: [Form extent: 16@16 depth: Display depth]
]

{
	#category : #label-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowClosePassiveForm [
	"Answer the form to use for passive (background) window close buttons"

	^self forms at: #windowClosePassive ifAbsent: [Form extent: 16@16 depth: Display depth]
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowInactiveFillStyleFor: aWindow [
	"Return the window inactive fillStyle for the given window."
	
	^self settings fadedBackgroundWindows
		ifTrue: [self windowColor muchLighter]
		ifFalse: [self windowColor]

]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowInactiveTitleFillStyleFor: aWindow [
	"Return the window inactive title fillStyle for the given window."
	
	|aColor|
	aColor := self windowInactiveFillStyleFor: aWindow.
	^(GradientFillStyle ramp: {
			0.0->aColor twiceLighter.
			1.0->aColor})	
		origin: aWindow labelArea topLeft;
		direction: 0 @ aWindow labelHeight;
		radial: false
]

{
	#category : #label-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowMaximizeOverForm [
	"Answer the form to use for mouse over window maximize buttons"

	^self forms at: #windowMaximizeOver ifAbsent: [Form extent: 16@16 depth: Display depth]
]

{
	#category : #label-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowMaximizePassiveForm [
	"Answer the form to use for passive (background) window maximize/restore buttons"

	^self forms at: #windowMaximizePassive ifAbsent: [Form extent: 16@16 depth: Display depth]
]

{
	#category : #label-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowMenuIconFor: aWindow [
	"Answer the menu icon for the given window."
	
	^ self windowMenuForm
]

{
	#category : #label-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowMenuOverForm [
	"Answer the form to use for mouse over window menu buttons"

	^self forms at: #windowMenuOver ifAbsent: [Form extent: 16@16 depth: Display depth]
]

{
	#category : #label-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowMenuPassiveForm [
	"Answer the form to use for inactive window menu buttons"

	^self forms at: #windowMenuPassive ifAbsent: [Form extent: 16@16 depth: Display depth]
]

{
	#category : #label-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowMinimizeOverForm [
	"Answer the form to use for mouse over window minimize buttons"

	^self forms at: #windowMinimizeOver ifAbsent: [Form extent: 16@16 depth: Display depth]
]

{
	#category : #label-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowMinimizePassiveForm [
	"Answer the form to use for passive (background) window minimize buttons"

	^self forms at: #windowMinimizePassive ifAbsent: [Form extent: 16@16 depth: Display depth]
]

{
	#category : #border-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>windowPaneBorderStyleFor: aMorph in: aSystemWindow [
	"Answer the border style for a morph that is to be added
	as a pane in the given system window,"

	^BorderStyle simple
		color: aSystemWindow paneColor;
		width: (aMorph borderWidth = 0 ifTrue: [0] ifFalse: [1])
]

{
	#category : #border-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>worldMainDockingBarBorderStyleFor: aDockingBar [
	"Return the world main docking bar borderStyle for the given docking bar."

	^BorderStyle simple
		width: 0;
		color: Color transparent
]

{
	#category : #fill-styles,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeWatery>>worldMainDockingBarNormalFillStyleFor: aDockingBar [
	"Return the world main docking bar fillStyle for the given docking bar."
	
	|aColor|
	aColor := aDockingBar originalColor alpha: 0.7.
	^(GradientFillStyle ramp: {
			0.0->(aColor alphaMixed: 0.3 with: (Color white alpha: aColor alpha)).
			0.8->aColor darker.
			1.0->aColor darker duller})
		origin: aDockingBar topLeft;
		direction: (aDockingBar isVertical
			ifTrue: [aDockingBar width @ 0]
			ifFalse: [0 @ aDockingBar height]);
		radial: false
]
