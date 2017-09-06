"
Configurable basic settings for themes.
"
Class {
	#name : #ThemeSettings,
	#superclass : #Model,
	#instVars : [
		'windowColor',
		'selectionColor',
		'autoSelectionColor',
		'buttonColor',
		'scrollbarColor',
		'standardColorsOnly',
		'progressBarColor',
		'progressBarProgressColor',
		'menuColor',
		'menuTitleColor',
		'preferGradientFill',
		'preferRoundCorner',
		'autoMenuColor',
		'flatMenu',
		'fadedBackgroundWindows',
		'fastDragging',
		'animationSettings',
		'scrollBarThickness',
		'balloonHelpEnabled',
		'tabAmongFields',
		'balloonHelpDelayTime',
		'maxBalloonHelpLineLength',
		'desktopImageLayout',
		'menuSelectionColor',
		'secondarySelectionColor',
		'findReplaceSelectionColor',
		'selectionBarColor',
		'unfocusedSelectionColor',
		'menuSelectionTextColor',
		'selectionTextColor',
		'secondarySelectionTextColor',
		'findReplaceSelectionTextColor'
	],
	#category : #Polymorph-Widgets-Themes,
	#timestamp : 'gvc 5/18/2007 10:23'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>animationSettings [
	^ animationSettings ifNil: [animationSettings := AnimationSettings new]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>applySettingsFrom: aThemeSettings [
	"Change the settings to be those of aThemeSettings."
	
	self
		windowColor: aThemeSettings windowColor;
		selectionColor: aThemeSettings selectionColor;
		autoSelectionColor: aThemeSettings autoSelectionColor
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>autoMenuColor [
	"Answer the value of autoMenuColor"

	^autoMenuColor ifNil: [^false]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>autoMenuColor: aBoolean [
	"Answer the value of autoMenuColor"

	autoMenuColor := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>autoSelectionColor [
	"Answer the value of autoSelectionColor"

	^autoSelectionColor ifNil: [^true]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>autoSelectionColor: anObject [
	"Set the value of autoSelectionColor"

	autoSelectionColor := anObject.
	self
		changed: #autoSelectionColor;
		changed: #manualSelectionColor;
		changed: #selectionColor
]

{
	#category : #balloon,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>balloonHelpDelayTime [
	^ balloonHelpDelayTime ifNil: [balloonHelpDelayTime := 800]
]

{
	#category : #balloon,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>balloonHelpDelayTime: anInteger [
	balloonHelpDelayTime := anInteger
]

{
	#category : #balloon,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>balloonHelpEnabled [
	^ balloonHelpEnabled ifNil: [balloonHelpEnabled := true]
]

{
	#category : #balloon,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>balloonHelpEnabled: aBoolean [
	balloonHelpEnabled := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>basicSelectionColor [
	"Answer the recorded selection color rather than derived."

	^selectionColor
]

{
	#category : #button,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>buttonColor [
	"Answer the value of buttonColor"

	^buttonColor ifNil: [self windowColor]
]

{
	#category : #button,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>buttonColor: anObject [
	"Set the value of buttonColor"

	buttonColor := anObject
]

{
	#category : #button,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>defaultButtonColor [
	"Answer the default button colour."

	^Color gray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>defaultScrollbarColor [
	"Answer the default scrollbar colour."

	^Color gray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>defaultSelectionColor [
	"Answer the default selection colour."

	^self defaultWindowColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>defaultWindowColor [
	"Answer the default window colour."

	^ Color lightGray
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>derivedMenuColor [
	"Answer a selection colour based on the window color."

	| autoColor worldColor |
	autoColor := self autoMenuColor 
				and: [Display depth > 4
						and: [(worldColor := self currentWorld color) isColor]].

	^ autoColor
				ifTrue: [worldColor luminance > 0.7
						ifTrue: [worldColor mixed: 0.85 with: Color black]
						ifFalse: [worldColor mixed: 0.4 with: Color white]]
				ifFalse: [self menuColor].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>derivedSelectionColor [
	"Answer a selection colour based on the window color."

	^self windowColor whiter lighter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>desktopImageLayout [
	"Answer the layout symbol for any desktop image.
	See AlphaImageMorph>>layoutSymbols."

	^desktopImageLayout ifNil: [desktopImageLayout := #scaled]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>desktopImageLayout: aSymbol [
	"Set the layout symbol for any desktop image.
	See AlphaImageMorph>>layoutSymbols."

	desktopImageLayout := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>fadedBackgroundWindows [
	^ fadedBackgroundWindows ifNil: [fadedBackgroundWindows := true]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>fadedBackgroundWindows: aBoolean [
	fadedBackgroundWindows := aBoolean
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>fallbackMenuColor [
	"Answer the value of menuColor"

	^ self preferGradientFill ifTrue: [Color lightGray] ifFalse: [Color lightGray muchLighter]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>fastDragging  [
		^ fastDragging ifNil: [fastDragging := false] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>fastDragging: aBoolean [
		fastDragging := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>findReplaceSelectionColor [
	"Answer the value of the selectionColor for find/replace"

	^ findReplaceSelectionColor ifNil: [findReplaceSelectionColor := Color orange alpha: 0.4]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>findReplaceSelectionColor: anColor [
	findReplaceSelectionColor := anColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>findReplaceSelectionTextColor [
	"Answer the value of the selectionTextColor for find/replace"

	^ findReplaceSelectionTextColor 
		ifNil: [ self findReplaceSelectionColor contrastingColor ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>findReplaceSelectionTextColor: aColor [
	"Answer the value of the selectionTextColor for find/replace"

	findReplaceSelectionTextColor := aColor
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>flatMenu  [
		^ flatMenu ifNil: [flatMenu := false]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>flatMenu: aBoolean [
		flatMenu := aBoolean
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>fromConfiguration: tree [
	"Update the settings from the given tree."
	
	(tree at: #windowColor ifAbsent: []) ifNotNil: [:v | self windowColor: v].
	(tree at: #autoSelectionColor ifAbsent: []) ifNotNil: [:v | self autoSelectionColor: v].
	(tree at: #selectionColor ifAbsent: []) ifNotNil: [:v | self selectionColor: v]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>haveFindReplaceSelectionTextColor [

	^ findReplaceSelectionTextColor notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>haveSecondarySelectionTextColor [
	"Answer the value of selectionTextColor"

	^ secondarySelectionTextColor notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>haveSelectionTextColor [
	
	^ selectionTextColor notNil
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		autoSelectionColor: true;
		windowColor: self defaultWindowColor;
		selectionColor: self defaultSelectionColor;
		buttonColor: self defaultButtonColor;
		scrollbarColor: self defaultScrollbarColor;
		standardColorsOnly: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>manualSelectionColor [
	"Answer the inverse of autoSelectionColor."

	^self autoSelectionColor not
]

{
	#category : #balloon,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>maxBalloonHelpLineLength [
	^ maxBalloonHelpLineLength ifNil: [maxBalloonHelpLineLength := 40]
]

{
	#category : #balloon,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>maxBalloonHelpLineLength: anInteger [
	maxBalloonHelpLineLength := anInteger
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>menuBorderColor [
	"Answer the value of menuColor"

	^ self flatMenu  
		ifFalse: [#raised]
		ifTrue: [self derivedMenuColor twiceDarker]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>menuBorderWidth [
	"Answer the value of menuColor"

	^ 2
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>menuColor [
	"Answer the value of menuColor"

	^ menuColor ifNil: [self fallbackMenuColor]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>menuColor: anObject [
	"Set the value of menuColor"

	menuColor := anObject
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>menuKeyboardControl [
	^ true
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>menuKeyboardFocusColor [
	^ (Color r: 0.6 g: 1.0 b: 1.0)
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>menuSelectionColor [
	"Answer the value of menuSelectionColor"

	^menuSelectionColor ifNil: [self derivedMenuColor darker]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>menuSelectionColor: aColor [
	"Set the base value of menuSelectionColor.
	If nil, actual color used will be based on derived menu color."

	menuSelectionColor := aColor
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>menuSelectionTextColor [
	"Answer the value of menuSelectionTextColor"

	^menuSelectionTextColor ifNil: [menuSelectionTextColor := Color black]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>menuSelectionTextColor: aColor [
	"Answer the value of menuSelectionTextColor"

	menuSelectionTextColor := aColor
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>menuShadowColor [
	^ Color r: 0.0 g: 0.0 b: 0.0 alpha: 0.666
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>menuTitleBorderColor [
	^ self flatMenu
		ifFalse: [#inset]
		ifTrue: [self derivedMenuColor muchDarker]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>menuTitleColor [
	"Answer the value of menuTitleColor"

	Display depth = 1 ifTrue: [^ Color white].
	Display depth = 2 ifTrue: [^ Color gray].
	^menuTitleColor 
		ifNil: [self menuColor 
				ifNil: [Color gray] 
				ifNotNil: [:mc | self preferGradientFill 
					ifTrue: [mc]
					ifFalse: [mc twiceDarker]]]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>menuTitleColor: anObject [
	"Set the value of menuTitleColor"

	menuTitleColor := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>preferGradientFill  [
	"Answer the value of preferGradientFill "

	^preferGradientFill  ifNil: [preferGradientFill := self preferGradientFillByDefault]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>preferGradientFill: aBoolean [
	"Set the value of preferGradientFill "

	preferGradientFill  := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>preferGradientFillByDefault [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>preferRoundCorner [
	"Answer the value of preferRoundCorner"

	^preferRoundCorner  ifNil: [preferRoundCorner := self preferRoundCornerByDefault]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>preferRoundCorner: aBoolean [
	"Set the value of preferRoundCorner"

	preferRoundCorner := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>preferRoundCornerByDefault [
	^ true
]

{
	#category : #progressbar,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>progressBarColor [
	"Answer the value of progressBarColor"

	^progressBarColor ifNil: [progressBarColor := self derivedMenuColor muchLighter]
]

{
	#category : #progressbar,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>progressBarColor: anObject [
	"Set the value of progressBarColor"

	progressBarColor := anObject
]

{
	#category : #progressbar,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>progressBarProgressColor [
	"Answer the value of progressBarProgressColor"

	^progressBarProgressColor ifNil: [self menuTitleColor]
]

{
	#category : #progressbar,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>progressBarProgressColor: anObject [
	"Set the value of progressBarProgressColor"

	progressBarProgressColor := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>scrollBarThickness [
	^ scrollBarThickness ifNil: [scrollBarThickness := 14]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>scrollbarColor [
	"Answer the value of scrollbarColor"

	^scrollbarColor ifNil: [self windowColor]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>scrollbarColor: anObject [
	"Set the value of scrollbarColor"

	scrollbarColor := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>secondarySelectionColor [
	"Answer the value of selectionColor"

	^ secondarySelectionColor ifNil: [secondarySelectionColor :=   (Color r: 0.351 g: 0.939 b: 0.46 alpha: 0.35)]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>secondarySelectionColor: anColor [
	secondarySelectionColor := anColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>secondarySelectionTextColor [
	"Answer the value of selectionTextColor"

	^ secondarySelectionTextColor 
		ifNil: [ self secondarySelectionColor contrastingColor ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>secondarySelectionTextColor: aColor [
	"set the value of selectionTextColor"

	secondarySelectionTextColor := aColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>selectionBarColor [
	^ selectionBarColor ifNil: [selectionBarColor := self selectionColor alpha: 0.06]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>selectionBarColor: aColor [
	selectionBarColor := aColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>selectionColor [
	"Answer the value of selectionColor"
	
	Display depth = 1 ifTrue: [^ Color veryLightGray].
	Display depth = 2 ifTrue: [^ Color gray].
	^self autoSelectionColor
		ifTrue: [self derivedSelectionColor]
		ifFalse: [selectionColor ifNil: [selectionColor := Color r: 0.0 g: 0.0 b: 0.8 alpha: 0.25]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>selectionColor: anObject [
	"Set the value of selectionColor"
	selectionColor := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>selectionTextColor [
	"Answer the value of selectionTextColor"
	
	^selectionTextColor ifNil: [Color black ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>selectionTextColor: aColor [
	selectionTextColor := aColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>standardColorsOnly [
	"Answer the value of standardColorsOnly"
 
	^standardColorsOnly ifNil: [^false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>standardColorsOnly: anObject [
	"Set the value of standardColorsOnly"

	standardColorsOnly := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>tabAmongFields [
	^ tabAmongFields ifNil: [tabAmongFields := true]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>tabAmongFields: aBoolean [
	tabAmongFields := aBoolean
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>toConfiguration: tree [
	"Update the tree from the receiver."
	
	tree at: #windowColor put: self windowColor.
	tree at: #autoSelectionColor put: self autoSelectionColor.
	tree at: #selectionColor put: self basicSelectionColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>unfocusedSelectionColor [
	"Answer the value of selectionColor when the window have not the focus"

	^ unfocusedSelectionColor ifNil: [unfocusedSelectionColor := self selectionColor alphaMixed: 0.7 with: Color veryLightGray lighter]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>unfocusedSelectionColor: aColor [
	"Answer the value of selectionColor when the window have not the focus"

	unfocusedSelectionColor := aColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>windowColor [
	"Answer the value of windowColor"

	^ windowColor ifNil: [Color lightGray]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ThemeSettings>>windowColor: anObject [
	"Set the value of windowColor"

	windowColor := anObject.
	self changed: #windowColor.
	self autoSelectionColor ifTrue: [self changed: #selectionColor]
]
