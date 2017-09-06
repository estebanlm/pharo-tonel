"
A morph whose submorphs comprise a paste-up of rectangular subparts which ""show through"".  Anything called a 'Playfield' is a PasteUpMorph.

Facilities commonly needed on pages of graphical presentations and on simulation playfields, such as the painting of new objects, turtle trails, gradient fills, background paintings, parts-bin behavior, collision-detection, etc., are (or will be) provided.





"
Class {
	#name : #PasteUpMorph,
	#superclass : #BorderedMorph,
	#instVars : [
		'backgroundMorph',
		'worldState',
		'griddingOn'
	],
	#classVars : [
		'ShouldSwapMenuOpenerButtons',
		'WindowEventHandler',
		'WorldAnnouncer'
	],
	#category : #Morphic-Core-Worlds,
	#timestamp : '<historical>'
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph class>>initialize [
	ShouldSwapMenuOpenerButtons := false
]

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph class>>isMenuOpenByLeftClick [
	"Truth table:
	swap 	isMac	methodReturn
	0	 	0	 	1
	0	 	1	 	1
	1	 	0	 	0
	1	 	1 		1
"

	^ self shouldSwapMenuOpenerButtons ==> [ Smalltalk os isMacOS ]
]

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph class>>shouldSwapMenuOpenerButtons [
	^ ShouldSwapMenuOpenerButtons 
]

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph class>>shouldSwapMenuOpenerButtons: aBoolean [
	^ ShouldSwapMenuOpenerButtons := aBoolean
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph class>>shouldSwapMenuOpenerButtonsSetting: aBuilder [
	<systemsettings>
	(aBuilder setting: #shouldSwapMenuOpenerButtons)
		label: 'Invert right and left click on world menu in Linux and Windows';
		parent: #desktopSettings;
		target: self;
		getSelector: #shouldSwapMenuOpenerButtons;
		setSelector: #shouldSwapMenuOpenerButtons:;
		description:
				'If checked the behaviour of the world menu is changed only under linuex and window. The main menu will appear on right click instead of left click.';
		default: false
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>acceptDroppingMorph: dropped event: evt [
	"The supplied morph, known to be acceptable to the receiver, is now to be assimilated; the precipitating event is supplied"

	| aMorph |
	aMorph := self morphToDropFrom: dropped.
	super acceptDroppingMorph: aMorph event: evt.
	aMorph
		submorphsDo: [ :m | 
			(m isKindOf: HaloMorph)
				ifTrue: [ m delete ] ].
	self bringTopmostsToFront
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>addMorph: aMorph centeredNear: aPoint [
	"Add the given morph to this world, attempting to keep its center as close to the given point possible while also keeping the it entirely within the bounds of this world."

	| trialRect delta |
	trialRect := Rectangle center: aPoint extent: aMorph fullBounds extent.
	delta := trialRect amountToTranslateWithin: bounds.
	aMorph position: trialRect origin + delta.
	self addMorph: aMorph.

]

{
	#category : #submorphs-add/remove,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>addMorphFront: aMorph [

	^self addMorphInFrontOfLayer: aMorph

]

{
	#category : #'wiw support',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>addMorphInLayer: aMorph [
	super addMorphInLayer: aMorph.
	aMorph wantsToBeTopmost ifFalse:[self bringTopmostsToFront].
]

{
	#category : #'menu & halo',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>addWorldHaloMenuItemsTo: aMenu hand: aHandMorph [
	"Add standard halo items to the menu, given that the receiver is a World"

	self addFillStyleMenuItems: aMenu hand: aHandMorph.
	self addLayoutMenuItems: aMenu hand: aHandMorph.

	aMenu addLine.
	self addWorldToggleItemsToHaloMenu: aMenu.
	aMenu addLine.
	self addExportMenuItems: aMenu hand: aHandMorph.
	self addMiscExtrasTo: aMenu.
	self addDebuggingItemsTo: aMenu hand: aHandMorph.

	aMenu addLine.
	aMenu defaultTarget: aHandMorph.

]

{
	#category : #'menu & halo',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>addWorldToggleItemsToHaloMenu: aMenu [
	"Add toggle items for the world to the halo menu"

	#(
	(hasDragAndDropEnabledString changeDragAndDrop 'whether I am open to having objects dropped into me')
	(roundedCornersString toggleCornerRounding 'whether the world should have rounded corners')) do:

		[:trip | aMenu addUpdating: trip first selector: trip second.
			aMenu balloonTextForLastItem: trip third]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>backgroundMorph [
	"Answer the background morph if any."
	
	^backgroundMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>backgroundMorph: aMorph [
	"Set the background morph.
	Probably best if locked prior to adding."

	self backgroundMorph isNil ifFalse: [
		self backgroundMorph delete].
	backgroundMorph := aMorph.
	aMorph isNil ifFalse: [
		aMorph bounds: self bounds.
		self addMorphBack: aMorph]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>becomeActiveDuring: aBlock [
	"Make the receiver the ActiveWorld during the evaluation of aBlock.
	Note that this method does deliberately *not* use #ensure: to prevent
	re-installation of the world on project switches."
	| priorWorld priorHand priorEvent |
	priorWorld := ActiveWorld.
	priorHand := ActiveHand.
	priorEvent := ActiveEvent.
	ActiveWorld := self.
	ActiveHand := self hands first. "default"
	ActiveEvent := nil. "not in event cycle"
	aBlock
		on: Error
		do: [:ex | 
			ActiveWorld := priorWorld.
			ActiveEvent := priorEvent.
			ActiveHand := priorHand.
			ex pass]
]

{
	#category : #viewing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>bringTopmostsToFront [
	submorphs
		select:[:m| m wantsToBeTopmost]
		thenDo:[:m| self addMorphInLayer: m].
]

{
	#category : #Morphic-Base-Windows,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>bringWindowsFullOnscreen [
	"Make ever SystemWindow on the desktop be totally on-screen, whenever possible."

	| r |
	bounds
		allAreasOutsideList: (self taskbars collect: [ :t | t bounds ])
		do: [ :e | 
			r isNil
				ifTrue: [ r := e ]
				ifFalse: [ 
					r area > e area
						ifTrue: [ r ]
						ifFalse: [ e ] ] ].
	(self windowsSatisfying: [ :w | true ])
		do: [ :aWindow | 
			aWindow right: (aWindow right min: r right).
			aWindow bottom: (aWindow bottom min: r bottom).
			aWindow left: (aWindow left max: r left).
			aWindow top: (aWindow top max: r top) ]
]

{
	#category : #'session management',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>checkSession [

	"do nothing"
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>cleanseOtherworldlySteppers [
	"If the current project is a morphic one, then remove from its steplist
	those morphs that are not really in the world"
	"Utilities cleanseOtherworldlySteppers"
	| old delta |
	old := self currentWorld stepListSize.
	self currentWorld steppingMorphsNotInWorld
		do: [:m | m delete].
	self currentWorld cleanseStepList.
	(delta := old - self currentWorld stepListSize) > 0
		ifTrue: [ self crTrace: delta asString , ' morphs removed from steplist' ]
]

{
	#category : #Morphic-Base-Windows,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>closeAllUnchangedWindows [
	(self  windowsSatisfying: [:w | w model canDiscardEdits])
		do: [:w | w delete]
]

{
	#category : #Morphic-Base-Windows,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>closeAllWindowsDiscardingChanges [
	World systemWindows do: [:w | [w delete] valueSupplyingAnswer: false]
]

{
	#category : #Morphic-Base-Windows,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>closeUnchangedWindows [
	"Present a menu of window titles for all windows with changes,
	and activate the one that gets chosen."
	(self confirm:
'Do you really want to close all windows
except those with unaccepted edits?' translated)
		ifFalse: [^ self].

	self  closeAllUnchangedWindows.
]

{
	#category : #Morphic-Base-Windows,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>collapseAll [
	"Collapse all windows"
	(self windowsSatisfying: [:w | w isCollapsed not])
		reverseDo: [:w | w collapseOrExpand.  self displayWorld].
	self collapseNonWindows
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>collapseNonWindows [
	self nonWindows reject: [:m | m isSticky] thenDo: [:m | m collapse]
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>commandKeySelectors [
	"Answer my command-key table"

	| aDict |
	aDict := self valueOfProperty: #commandKeySelectors ifAbsentPut: [self initializeDesktopCommandKeySelectors].
	^ aDict
]

{
	#category : #'menu & halo',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>contentsMenu: aMenu [
	"Build the menu used from PopUpContentsMenu:"
	(self submorphs asSortedCollection: [:w1 :w2 | w1 class name caseInsensitiveLessOrEqual: w2 class name]) do:
		[:w | aMenu add: w class name target: w selector: #comeToFront ].
	^ aMenu
]

{
	#category : #'menu & halo',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>contentsMenuTitle [
	^ 'Contents' translated
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>currentWindow [

	"Answer the top window or nil"
	
	^ self class environment at: #SystemWindow ifPresent: [:systemWindow | systemWindow topWindow]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>defaultBorderColor [
	"answer the default border color/fill style for the receiver"
	^ Color
		r: 0.861
		g: 1.0
		b: 0.722
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>defaultBorderWidth [
	"answer the default border width for the receiver"
	^ 1
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>defaultColor [
	"answer the default color/fill style for the receiver"
	^ Color
		r: 0.8
		g: 1.0
		b: 0.6
]

{
	#category : #'halos and balloon help',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>defersHaloOnClickTo: aSubMorph [
	"If a cmd-click on aSubMorph would make it a preferred recipient of the halo, answer true"
	^ true
	
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>deleteAllHalos [
	"self halt.
	self haloMorphs
		do: [:each | (each target isKindOf: SelectionMorph)
				ifTrue: [each target delete]].
	self hands
		do: [:each | each removeHalo]"
	self flag: #???
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>discoveredWorldMenu [
	^ owner discoveredWorldMenu

]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>dispatchCommandKeyInWorld: aChar event: evt [
	"Dispatch the desktop command key if possible.  Answer whether handled"

	| aMessageSend |
	aMessageSend := self commandKeySelectors at: aChar ifAbsent: [^ false].
	aMessageSend selector numArgs = 0
		ifTrue:
			[aMessageSend value]
		ifFalse:
			[aMessageSend valueWithArguments: (Array with: evt)].
	^ true

]

{
	#category : #'menu & halo',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>dispatchKeystroke: anEvent [
	anEvent keyCharacter == Character tab
		ifTrue: [ 
			self tabAmongFields
				ifTrue: [ ^ self tabHitWithEvent: anEvent ] ]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>drawBackgroundSketchOn: aCanvas [
	backgroundMorph ifNil: [ ^ self ].
	self clipSubmorphs
		ifTrue: [ aCanvas clipBy: self clippingBounds during: [ :canvas | canvas fullDrawMorph: backgroundMorph ] ]
		ifFalse: [ aCanvas fullDrawMorph: backgroundMorph ]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>drawGridOn: aCanvas [

	(self griddingOn and: [ self gridVisible ])
		ifTrue: [ 
			aCanvas
				fillRectangle: self bounds
				fillStyle:
					(self
						gridFormOrigin: self gridOrigin
						grid: self gridModulus
						background: nil
						line: Color lightGray) ]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>drawOn: aCanvas  [
	"Draw in order:
	- background color
	- grid, if any
	- background sketch, if any
	Later (in drawSubmorphsOn:) I will skip drawing the background sketch."

	super drawOn: aCanvas.	
	self drawGridOn: aCanvas.
	self drawBackgroundSketchOn: aCanvas
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>drawSubmorphsOn: aCanvas [
	"Display submorphs back to front, but skip my background sketch."

	| drawBlock |
	submorphs isEmpty
		ifTrue: [ ^ self ].
	drawBlock := [ :canvas | 
	submorphs
		reverseDo: [ :m | 
			m ~~ backgroundMorph
				ifTrue: [ canvas fullDrawMorph: m ] ] ].
	self clipSubmorphs
		ifTrue: [ aCanvas clipBy: (aCanvas clipRect intersect: self clippingBounds ifNone: [ ^ self ]) during: drawBlock ]
		ifFalse: [ drawBlock value: aCanvas ]
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>dropEnabled [
	"Get this morph's ability to add and remove morphs via drag-n-drop."

	^ (self valueOfProperty: #dropEnabled) ~~ false

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>dropFiles: anEvent [
	"Handle a number of dropped files from the OS.
	TODO:
		- use a more general mechanism for figuring out what to do with the file (perhaps even offering a choice from a menu)
		- remember the resource location or (when in browser) even the actual file handle"
	| numFiles stream handler |	
	numFiles := anEvent contents.
	1 to: numFiles do: [:i |
		(stream := FileStream requestDropStream: i) ifNotNil: [
			handler := ExternalDropHandler lookupExternalDropHandler: stream.
			[handler ifNotNil: [handler handle: stream in: self dropEvent: anEvent]]
				ensure: [stream close]]].
]

{
	#category : #Morphic-Base-Windows,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>expandAll [
	"Expand all windows"
	(self  windowsSatisfying: [:w | w isCollapsed])
		reverseDo: [:w | w collapseOrExpand.  self displayWorld]
]

{
	#category : #Morphic-Base-Windows,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>findWindow: evt [
	"Present a menu names of windows and naked morphs, and activate the one that gets chosen.  Collapsed windows appear below line, expand if chosen; naked morphs appear below second line; if any of them has been given an explicit name, that is what's shown, else the class-name of the morph shows; if a naked morph is chosen, bring it to front and have it don a halo."
	| menu expanded collapsed nakedMorphs |
	menu := UIManager default newMenuIn: self for: self.
	expanded := self  windowsSatisfying: [:w | w isCollapsed not].
	collapsed := self  windowsSatisfying: [:w | w isCollapsed].
	nakedMorphs := self submorphsSatisfying:[:m | m isSystemWindow not].
	(expanded isEmpty and: [collapsed isEmpty and: [nakedMorphs isEmpty]]) ifTrue: [^ self inform: 'No morph in world'].
	(expanded asSortedCollection: [:w1 :w2 | w1 label caseInsensitiveLessOrEqual: w2 label]) do:
		[:w | menu add: w label target: w selector: #activateAndForceLabelToShow.
			w model canDiscardEdits ifFalse: [menu lastItem color: Color red]].
	(expanded isEmpty or: [ collapsed isEmpty and: [ nakedMorphs isEmpty ]]) ifFalse: [menu addLine].
	(collapsed asSortedCollection: [:w1 :w2 | w1 label caseInsensitiveLessOrEqual: w2 label]) do: 
		[:w | menu add: w label target: w selector: #collapseOrExpand.
		w model canDiscardEdits ifFalse: [menu lastItem color: Color red]].
	nakedMorphs isEmpty ifFalse: [menu addLine].
	(nakedMorphs asSortedCollection: [:w1 :w2 | w1 class name caseInsensitiveLessOrEqual: w2 class name]) do:
		[:w | menu add: w class name target: w selector: #comeToFrontAndAddHalo].
	menu addTitle: 'find window'.
	menu popUpEvent: evt in: self.
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>flashRects: rectangleList color: aColor [
	"For testing. Flashes the given list of rectangles on the Display so you can watch incremental redisplay at work."
	"Details: Uses two reverses so that the display is restored to its original state. This is necessary when in deferred update mode."

	| blt |
	blt := (BitBlt toForm: Display)
		sourceForm: nil;
		sourceOrigin: 0@0;
		clipRect: self viewBox;
		combinationRule: Form reverse.
	rectangleList do: [:r | | screenRect |
		screenRect := r translateBy: self viewBox origin.
		blt destRect: screenRect; copyBits.
		Display forceToScreen: screenRect; forceDisplayUpdate.
		(Delay forMilliseconds: 15) wait.
		blt destRect: screenRect; copyBits.
		Display forceToScreen: screenRect; forceDisplayUpdate].

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>gridFormOrigin: origin grid: smallGrid background: backColor line: lineColor [

	| bigGrid gridForm gridOrigin |
	gridOrigin := origin \\ smallGrid.
	bigGrid := (smallGrid asPoint x) @ (smallGrid asPoint y).
	gridForm := Form extent: bigGrid depth: Display depth.
	backColor ifNotNil: [gridForm fillWithColor: backColor].
	gridOrigin x to: gridForm width by: smallGrid x do:
		[:x | gridForm fill: (x@0 extent: 1@gridForm height) fillColor: lineColor].
	gridOrigin y to: gridForm height by: smallGrid y do:
		[:y | gridForm fill: (0@y extent: gridForm width@1) fillColor: lineColor].
	^ InfiniteForm with: gridForm

]

{
	#category : #gridding,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>gridModulus [

	^ self gridSpec extent
]

{
	#category : #gridding,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>gridModulus: newModulus [

	self gridSpecPut: (self gridOrigin extent: newModulus).
	self changed
]

{
	#category : #gridding,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>gridOrigin [

	^ self gridSpec origin
]

{
	#category : #gridding,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>gridOrigin: newOrigin [

	^ self gridSpecPut: (newOrigin extent: self gridModulus)
]

{
	#category : #gridding,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>gridSpec [
	"Gridding rectangle provides origin and modulus"

	^ self valueOfProperty: #gridSpec ifAbsent: [0@0 extent: 8@8]
]

{
	#category : #gridding,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>gridSpecPut: newSpec [
	"Gridding rectangle provides origin and modulus"

	^ self setProperty: #gridSpec toValue: newSpec
]

{
	#category : #gridding,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>gridVisible [

	^ self hasProperty: #gridVisible
]

{
	#category : #gridding,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>gridVisibleOnOff [

	self setProperty: #gridVisible toValue: self gridVisible not.
	self changed
]

{
	#category : #gridding,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>gridVisibleString [
	"Answer a string to be used in a menu offering the opportunity 
	to show or hide the grid"
	^ (self gridVisible
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
		, 'show grid when gridding' translated
]

{
	#category : #gridding,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>griddingOn [

	^ griddingOn ifNil: [false]
]

{
	#category : #gridding,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>griddingOnOff [

	griddingOn := self griddingOn not.
	self changed
]

{
	#category : #gridding,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>griddingString [
	"Answer a string to use in a menu offering the user the 
	opportunity to start or stop using gridding"
	^ (self griddingOn
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
		, 'use gridding' translated
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>handleFatalDrawingError: errMsg [
	"Handle a fatal drawing error."
	Display deferUpdates: false. "Just in case"
	self primitiveError: errMsg.

	"Hm... we should jump into a 'safe' worldState here, but how do we find it?!"
]

{
	#category : #recategorized,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>handlerForMouseDown: anEvent [
	"If we have a modal dialog then answer nil otherwise as usual.."
	
	^(self hasProperty: #submorphLockStates)
		ifFalse: [super handlerForMouseDown: anEvent]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>handlesKeyboard: evt [
	^ true "handle all not handled events"
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>handlesMouseDown: evt [
	^true
]

{
	#category : #thumbnail,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>icon [
	^ self iconNamed: #homeIcon
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>initialize [
	"initialize the state of the receiver"
	
	super initialize.
	self enableDragNDrop.
	self clipSubmorphs: true
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>initializeDesktopCommandKeySelectors [
	"Provide the starting settings for desktop command key selectors.  Answer the dictionary."

	"ActiveWorld initializeDesktopCommandKeySelectors"
	| dict |
	dict := IdentityDictionary new.
	self defaultDesktopCommandKeyTriplets do:
		[:trip | | messageSend |
			messageSend := MessageSend receiver: trip second selector: trip third.
			dict at: trip first put: messageSend].
	self setProperty: #commandKeySelectors toValue: dict.
	^ dict


]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>invokeWorldMenu: evt [
	"Put up the world menu, triggered by the passed-in event."
	| menu |
	self bringTopmostsToFront.
	"put up screen menu"
	(menu := self worldMenu) popUpEvent: evt in: self.
	^ menu
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>invokeWorldMenuFromEscapeKey [
	self invokeWorldMenu: ActiveEvent
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>isEasySelecting [
	"This is to isolate easySelection predicate. 
	Selectors in holders make no sense so we are limiting easy
	selection to the worldMorph.
	It would also make sense in playfield so feel free to adjust this
	predicate. Selection can always be forced by using the shift
	before mouse down."
	^ false
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>keyStroke: anEvent [
	"A keystroke has been made.  Service event handlers and, if it's a keystroke presented to the world, dispatch it to #unfocusedKeystroke:"

	super keyStroke: anEvent.	"Give event handlers a chance"
	self selectedObject ifNotNil: [ :selected | selected moveOrResizeFromKeystroke: anEvent ].
	self dispatchKeystroke: anEvent
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>keyboardNavigationHandler [
	"Answer the receiver's existing keyboardNavigationHandler, or nil if none."

	| aHandler |
	aHandler := self valueOfProperty: #keyboardNavigationHandler ifAbsent: [^ nil].
	(aHandler hasProperty: #moribund) ifTrue:  "got clobbered in another project"
		[self removeProperty: #keyboardNavigationHandler.
		^ nil].
	^ aHandler
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>keyboardNavigationHandler: aHandler [
	"Set the receiver's keyboard navigation handler as indicated.  A nil argument means to remove the handler"

	aHandler
		ifNil:
			[self removeProperty: #keyboardNavigationHandler]
		ifNotNil:
			[self setProperty: #keyboardNavigationHandler toValue: aHandler]
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>lastKeystroke	 [
	"Answer the last keystroke fielded by the receiver"	
	^ self valueOfProperty: #lastKeystroke ifAbsent: ['']
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>lastKeystroke: aString	 [
	"Remember the last keystroke fielded by the receiver"	
	^ self setProperty: #lastKeystroke toValue: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>modalWindow: aMorph [
	(self valueOfProperty: #modalWindow) ifNotNil: [ :morph | morph delete ].
	self setProperty: #modalWindow toValue: aMorph.
	aMorph ifNotNil: [ self when: #aboutToLeaveWorld send: #removeModalWindow to: self ]
]

{
	#category : #Morphic-Base-Basic,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>morphToDropFrom: aMorph  [
	"Given a morph being carried by the hand, which the hand is about to drop, answer the actual morph to be deposited.  Normally this would be just the morph itself, but several unusual cases arise, which this method is designed to service."

	^aMorph 
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>morphToGrab: event [
	"Return the morph to grab from a mouse down event. If none, return nil."
	self submorphsDo:[:m|
		((m rejectsEvent: event) not and:[m fullContainsPoint: event cursorPoint]) ifTrue:[^m].
	].
	^nil
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>morphsInFrontOf: someMorph overlapping: aRectangle do: aBlock [
	"Include hands if the receiver is the World"
	self handsDo:[:m|
		m == someMorph ifTrue:["Try getting out quickly"
			owner ifNil:[^self].
			^owner morphsInFrontOf: self overlapping: aRectangle do: aBlock].
		"The hand only overlaps if it's not the hardware cursor"
		m needsToBeDrawn ifTrue:[
			(m fullBoundsInWorld intersects: aRectangle)
				ifTrue:[aBlock value: m]]].
	^super morphsInFrontOf: someMorph overlapping: aRectangle do: aBlock
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>mouseDown: evt [
	"Handle a mouse down event."

	| grabbedMorph handHadHalos |
	(self class isMenuOpenByLeftClick
		ifTrue: [ evt yellowButtonPressed "left click" ]
		ifFalse: [ evt redButtonPressed	"right click" ])
		ifTrue: [ ^ self popUpContentsMenu: evt ].
	grabbedMorph := self morphToGrab: evt.
	grabbedMorph
		ifNotNil: [ 
			grabbedMorph isSticky
				ifTrue: [ ^ self ].
			^ evt hand grabMorph: grabbedMorph ].
	(super handlesMouseDown: evt)
		ifTrue: [ ^ super mouseDown: evt ].
	handHadHalos := evt hand halo notNil.
	evt hand removeHalo.	"shake off halos"
	evt hand releaseKeyboardFocus.	"shake of keyboard foci"
	(evt shiftPressed not and: [ self isWorldMorph not and: [ self wantsEasySelection not ] ])
		ifTrue: [ 
			evt wasHandled: false.
			^ self ].	"explicitly ignore the event if we're not the world and we'll not select,
		so that we could be picked up if need be"
	(evt shiftPressed or: [ self wantsEasySelection ])
		ifTrue: [ 
			| clickSelector |
			evt shiftPressed
				ifTrue: [ clickSelector := #popUpContentsMenu: ]
				ifFalse: [ clickSelector := #invokeWorldMenu: ].
			evt hand
				waitForClicksOrDrag: self
				event: evt
				selectors:
					{clickSelector.
					nil.
					nil.
					#dragThroughOnDesktop:}
				threshold: 5 ]
		ifFalse: [ self invokeWorldMenu: evt ]	"We'll select on drag, let's decide what to do on click"	"We wont select, just bring world menu if I'm the world"
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>nonWindows [
	^ (self submorphs select: [:m | (m isSystemWindow) not and: [m wantsToBeTopmost not]])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>osWindow [
	
	^ nil
	

]

{
	#category : #'menu & halo',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>popUpContentsMenu: evt [
	"Present a menu names of windows and naked morphs, and activate the one that gets chosen.  Collapsed windows appear below line, expand if chosen; naked morphs appear below second line; if any of them has been given an explicit name, that is what's shown, else the class-name of the morph shows; if a naked morph is chosen, bring it to front and have it don a halo."
	| menu |
	menu := UIManager default newMenuIn: self for: self.
	self contentsMenu: menu.
	menu buildTitle: [ :titleMorph |
		titleMorph bigTitle: self contentsMenuTitle
	];
	popUpEvent: evt in: (self world ifNil: [self]).
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>positionNear: aPoint forExtent: anExtent adjustmentSuggestion: adjustmentPoint [
	"Compute a plausible positioning for adding a subpart of size anExtent, somewhere near aPoint, using adjustmentPoint as the unit of adjustment"

	| adjustedPosition |
	adjustedPosition := aPoint.
	[((self morphsAt: (adjustedPosition + (anExtent // 2))) size > 1) and:  "that 1 is self here"
		[bounds containsPoint: adjustedPosition]]
	whileTrue:
		[adjustedPosition := adjustedPosition + adjustmentPoint].

	^ adjustedPosition
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>privateRemoveMorph: aMorph [
	backgroundMorph == aMorph ifTrue: [ backgroundMorph := nil ].
	^super privateRemoveMorph: aMorph.

]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>releaseCachedState [
	super releaseCachedState.
	self removeModalWindow.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>removeModalWindow [
	self modalWindow: nil
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>repelsMorph: aMorph event: ev [
	(aMorph wantsToBeDroppedInto: self) ifFalse: [^ false].
	self dropEnabled ifFalse: [^ true].
	(self wantsDroppedMorph: aMorph event: ev) ifFalse: [^ true].
	^ super repelsMorph: aMorph event: ev "consults #repelling flag"
]

{
	#category : #recategorized,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>resizeBackgroundMorph [
	"Resize the background morph to fit the world."

	self backgroundMorph isNil ifFalse: [
		self backgroundMorph extent: self extent]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>resizeToFit [
	^self vResizing == #shrinkWrap
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>resizeToFitString [
	"Answer a string, to be used in a self-updating menu, to 
	represent whether the receiver is currently using resize-to-fit 
	or not"
	^ (self resizeToFit
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
		, 'resize to fit' translated
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>restoreDisplay [

	World restoreMorphicDisplay.	"I don't actually expect this to be called"
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>restoreMainDockingBarDisplay [
	"Restore the display of docking bars"
	self dockingBars
		do: [:each | each updateBounds]
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>restoreMorphicDisplay [

	DisplayScreen startUp.

	self
		extent: Display extent;
		viewBox: Display boundingBox;
		handsDo: [:h | h visible: true; showTemporaryCursor: nil];
		resizeBackgroundMorph;
		submorphsDo: [ :each | each displayExtentChanged ];
		fullRepaintNeeded.
		
	self defer: [Cursor normal show].
		
	self layoutChanged.

]

{
	#category : #gridding,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>setGridSpec [
	"Gridding rectangle provides origin and modulus"
	| response result |
	response := UIManager default
			request: 'New grid origin (usually 0@0):' translated
			initialAnswer: self gridOrigin printString.
	response isEmpty ifTrue: [^ self].
	result := [self class compiler evaluate: response] ifError: [^ self].
	(result isPoint and: [(result >= (0@0))])
		ifTrue: [self gridOrigin: result]
		ifFalse: [self inform: ('Must be a Point with coordinates (for example 10@10)' translated )].

	response := UIManager default
			request: 'New grid spacing:' translated
			initialAnswer: self gridModulus printString.
	response isEmptyOrNil ifTrue: [^ self].
	result := [self class compiler evaluate: response] ifError: [^ self].
	(result isPoint and: [(result > (0@0)) ])
		ifTrue: [self gridModulus: result]
		ifFalse: [self inform: ('Must be a Point with coordinates (for example 10@10)' translated )].


]

{
	#category : #'wiw support',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>shouldGetStepsFrom: aWorld [
	(self isWorldMorph and: [owner notNil]) 
		ifTrue: [ ^self outermostWorldMorph == aWorld ].
	^super shouldGetStepsFrom: aWorld
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>startStepping: aMorph [
	"Add the given morph to the step list. Do nothing if it is already being stepped."
	^self startStepping: aMorph at: Time millisecondClockValue selector: #stepAt: arguments: nil stepTime: nil
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>startSteppingSubmorphsOf: aMorph [
	"Ensure that all submorphs of the given morph that want to be stepped are added to the step list.   Typically used after adding a morph to the world."

	aMorph allMorphsDo: [:m |
		m wantsSteps ifTrue: [m arrangeToStartSteppingIn: m world].
	]


]

{
	#category : #'project state',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>steppingMorphsNotInWorld [
	| all |
	all := self allMorphs.
	^ self listOfSteppingMorphs reject: [ :m | all includes: m ]	"self currentWorld steppingMorphsNotInWorld do: [:m | m delete]"
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>toggleResizeToFit [
	"Toggle whether the receiver is set to resize-to-fit"

	self vResizeToFit: self resizeToFit not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>useRoundedCorners [
	"Somewhat special cased because we do have to fill Display for this"
	super useRoundedCorners.
	self == World ifTrue:[Display bits primFill: 0]. "done so that we *don't* get a flash"
]

{
	#category : #'project state',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>viewBox: newViewBox  [
	"I am now displayed within newViewBox; react."

	super position: newViewBox topLeft.
	fullBounds := bounds := newViewBox.

	
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>wantsDroppedMorph: aMorph event: evt [
	
	self visible ifFalse: [^ false].  "will be a call to #hidden again very soon"
	self dropEnabled ifFalse: [^ false].
	^ true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>wantsEasySelection [
	"Answer if the receiver want easy selection mode"
	^ self isEasySelecting 
]

{
	#category : #'halos and balloon help',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>wantsHaloFromClick [
	 ^owner isSystemWindow not


]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>wantsKeyboardFocusFor: aSubmorph [

	aSubmorph wouldAcceptKeyboardFocus ifTrue: [ ^ true].
	^ super wantsKeyboardFocusFor: aSubmorph
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>wantsWindowEvent: anEvent [
	^ self windowEventHandler notNil
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>windowEvent: anEvent [
	self windowEventHandler ifNotNil: [ ^ self windowEventHandler windowEvent: anEvent ].
	"The window close dialog is modal, since the windowClose event originates from the system window button, we need to protect against opening multiple, otherwise we end up with the world in a locked state when one of them is cancelled"
	(anEvent type == #windowClose and: [ self valueOfProperty: #canOpenCloseDialog ifAbsent: true ])
		ifTrue: [ 
			self setProperty: #canOpenCloseDialog toValue: false.
			WorldState quitSession.
			self removeProperty: #canOpenCloseDialog ]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>windowEventHandler [
	"This is a class variable so it is global to all projects and does not get saved"
	^WindowEventHandler
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>windowEventHandler: anObject [
	"This is a class variable so it is global to all projects and does not get saved"
	WindowEventHandler := anObject

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>windowsSatisfying: windowBlock [

	| windows |
	windows := OrderedCollection new.
	self submorphs do: [:m | 
		m embeddedWindowOrNil ifNotNil: [ 
			(windowBlock value: m) 
				ifTrue: [ windows addLast: m ] ] ].
		
	^ windows.		
		
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
PasteUpMorph>>worldMenu [
	^ owner worldMenu
	
]
