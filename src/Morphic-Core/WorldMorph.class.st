"
A WorldMorph is a special morph that represents the world.
It is a paste up and it holds active hand.

A World, the entire Smalltalk screen, is a PasteUpMorph.  A World responds true to isWorld.
"
Class {
	#name : #WorldMorph,
	#superclass : #PasteUpMorph,
	#instVars : [
		'osWindow',
		'session'
	],
	#classVars : [
		'ExtraWorldList'
	],
	#category : #Morphic-Core-Worlds,
	#timestamp : '<historical>'
}

{
	#category : #'extra worlds',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph class>>addExtraWorld: aWorld [
	ExtraWorldList := self extraWorldList copyWith: aWorld
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph class>>cleanUp [
	World cleanseOtherworldlySteppers.
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph class>>defaultWorldColor [

	^ Color r: 0.937 g: 0.937 b: 0.937.

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph class>>doOneCycle [
	self extraWorldList do: [:world |
		ActiveHand := world activeHand.
		world doOneCycle.
	].

	(World isNotNil and: [(self extraWorldList includes: World) not]) ifTrue: [
		World doOneCycle.
		ActiveHand := World activeHand
	].
	
	
]

{
	#category : #'extra worlds',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph class>>extraWorldList [
	ExtraWorldList ifNil: [ ExtraWorldList := #() ].
	^ ExtraWorldList
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph class>>initialize [
	SessionManager default registerGuiClassNamed: self name.
]

{
	#category : #'extra worlds',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph class>>removeExtraWorld: aWorld [
	ExtraWorldList := self extraWorldList copyWithout: aWorld
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph class>>shutDown [
	World ifNotNil: [:world | world triggerEvent: #aboutToLeaveWorld ]
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph class>>startUp [
	World ifNotNil: [:world | world restoreMorphicDisplay]
]

{
	#category : #structure,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>activeHand [

	^ worldState activeHand
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>activeHand: aHandMorph [
	"temporarily retained for old main event loops"
	worldState activeHand: aHandMorph.


]

{
	#category : #alarms-scheduler,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>addAlarm: aSelector withArguments: argArray for: aTarget at: scheduledTime [
	"Add a new alarm with the given set of parameters"
	worldState addAlarm: aSelector withArguments: argArray for: aTarget at: scheduledTime.
]

{
	#category : #submorphs-add/remove,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>addAllMorphs: array [

	super addAllMorphs: array.
	array do: [:m | self startSteppingSubmorphsOf: m].

]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>addHand: aHandMorph [
	"Add the given hand to the list of hands for this world."

	aHandMorph owner ifNotNil: [ aHandMorph owner removeHand: aHandMorph ].
	worldState addHand: aHandMorph.
	aHandMorph privateOwner: self
]

{
	#category : #menus,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>addStandardHaloMenuItemsTo: aMenu hand: aHandMorph [
	"Add standard halo items to the menu"

	self addWorldHaloMenuItemsTo: aMenu hand: aHandMorph
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>allMorphsDo: aBlock [
	"Enumerate all morphs in the world, including those held in hands."

	super allMorphsDo: aBlock.
	worldState handsReverseDo: [ :h | h allMorphsDo: aBlock ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>announcer [
	WorldAnnouncer ifNil: [ WorldAnnouncer := Announcer new ].
	^ WorldAnnouncer
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>assuredCanvas [
	^ worldState assuredCanvas
]

{
	#category : #meta-actions,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>buildMetaMenu: evt [
	| menu |
	menu := UIManager default newMenuIn: self for: self.
	self addStandardHaloMenuItemsTo: menu hand: evt hand.
	^ menu

]

{
	#category : #'project state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>canvas [

	^ worldState canvas
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>cleanseStepList [
	"Remove morphs from the step list that are not in this World."

	worldState cleanseStepListForWorld: self
]

{
	#category : #'menu & halo',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>contentsMenu: aMenu [
	"Build the menu used from PopUpContentsMenu:"

	| expanded collapsed |
	expanded := self windowsSatisfying: [ :w | w isCollapsed not ].
	collapsed := self windowsSatisfying: [ :w | w isCollapsed ].
	(expanded asSortedCollection: [ :w1 :w2 | w1 label caseInsensitiveLessOrEqual: w2 label ])
		do: [ :w | 
			aMenu add: (self truncatedMenuLabelFor: w label) target: w selector: #activateAndForceLabelToShow.
			aMenu lastItem icon: w taskbarIcon.
			w model canDiscardEdits 
				ifFalse: [ aMenu lastItem color: Color red ] ].
	aMenu addLine.
	(collapsed asSortedCollection: [ :w1 :w2 | w1 label caseInsensitiveLessOrEqual: w2 label ])
		do: [ :w | 
			aMenu add: (self truncatedMenuLabelFor: w label) target: w selector: #collapseOrExpand.
			aMenu lastItem icon: w taskbarIcon.
			w model canDiscardEdits
				ifFalse: [ aMenu lastItem color: Color red ] ].
	aMenu addLine.
	((self submorphs reject: [ :sm | (expanded includes: sm) or: [ collapsed includes: sm ] ])
		asSortedCollection: [ :w1 :w2 | w1 class name caseInsensitiveLessOrEqual: w2 class name ])
		do: [ :w | 
			aMenu add: (self truncatedMenuLabelFor: w class name) target: w selector: #comeToFront.
			aMenu lastItem icon: w taskbarIcon ].
		
	^ aMenu
]

{
	#category : #'menu & halo',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>contentsMenuTitle [
	^ 'World contents' translated
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>defaultWorldColor [
	^ self class defaultWorldColor
]

{
	#category : #'deferred message',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>defer: aValuable [
	"aValuable will be executed in the next UI rendering cycle"
	worldState defer: aValuable
]

{
	#category : #'menu & halo',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>deleteBalloonTarget: aMorph [
	"Delete the balloon help targeting the given morph"

	self handsDo: [ :h | h deleteBalloonTarget: aMorph ]
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>discoveredWorldMenu [
	^ worldState discoveredWorldMenu
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>displayWorld [
	worldState displayWorld: self submorphs: submorphs
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>displayWorldSafely [
	worldState displayWorldSafely: self.

]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>doOneCycle [
	"see the comment in doOneCycleFor:"

	worldState doOneCycleFor: self
]

{
	#category : #'interaction loop',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>doOneCycleNow [
	"see the comment in doOneCycleNowFor:"
	worldState doOneCycleNowFor: self.

]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>doOneSubCycle [
	"Like doOneCycle, but preserves activeHand."

	worldState doOneSubCycleFor: self
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>extent: aPoint [
	super extent: aPoint.
	worldState viewBox
		ifNotNil: [ 
			worldState canvas: nil.
			worldState viewBox: bounds ]
]

{
	#category : #'project state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>firstHand [
	^ worldState hands first
]

{
	#category : #'geometry testing',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>fullContainsPoint: pt [
	^bounds containsPoint: pt

]

{
	#category : #Morphic-Base-Windows,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>fullRepaintNeeded [

	worldState doFullRepaint.
	self  windowsSatisfying: [:w | w makeMeVisible. false].


]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>haloMorphs [

	^ self hands collect: [ :h | h halo ] thenSelect: [ :halo | halo notNil ]
]

{
	#category : #'project state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>hands [

	^ worldState hands
]

{
	#category : #'project state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>handsDo: aBlock [

	^  worldState handsDo: aBlock 
]

{
	#category : #'project state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>handsReverseDo: aBlock [
	^ worldState handsReverseDo: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>initialize  [
	worldState := WorldState new.
 	super initialize
]

{
	#category : #'change reporting',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>invalidRect: damageRect from: aMorph [
	"Clip damage reports to my bounds, since drawing is clipped to my bounds."

	worldState recordDamagedRect: (damageRect intersect: self bounds ifNone: [ ^ self ])
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>isEasySelecting [
	"This is to isolate easySelection predicate. 
	Selectors in holders make no sense so we are limiting easy
	selection to the worldMorph.
	It would also make sense in playfield so feel free to adjust this
	predicate. Selection can always be forced by using the shift
	before mouse down."
	^ worldState isEasySelecting
]

{
	#category : #'project state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>isStepping: aMorph [
	^ worldState isStepping: aMorph
]

{
	#category : #'project state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>isStepping: aMorph selector: aSelector [
	^ worldState isStepping: aMorph selector: aSelector
]

{
	#category : #classification,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>isWorldMorph [

	^ true
]

{
	#category : #'project state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>listOfSteppingMorphs [
	^ worldState listOfSteppingMorphs

"self currentWorld listOfSteppingMorphs"
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>mouseDown: evt [
	super mouseDown: evt.
	self currentWindow ifNotNil: [ :topWindow | SystemWindow passivateTopWindow ]
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>position: aPoint [
	"Prevent moving a world (e.g. via HandMorph>>specialGesture:)"

	super position: aPoint.
	self viewBox ifNotNil: [:viewBox | self viewBox: (aPoint extent:  viewBox extent)].


]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>printOn: aStream [
	"Reimplemented to add a tag showing that the receiver is currently functioning as a 'world', if it is"

	super printOn: aStream.
	aStream nextPutAll: ' [world]'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>privateMoveBy: delta [
	super privateMoveBy: delta.
	worldState viewBox ifNotNil: [ worldState viewBox: bounds ]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>releaseCachedState [
	super releaseCachedState.
	self cleanseStepList.
]

{
	#category : #alarms-scheduler,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>removeAlarm: aSelector for: aTarget [
	"Remove the alarm with the given selector"
	
	worldState removeAlarm: aSelector for: aTarget
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>removeHand: aHandMorph [
	"Remove the given hand from the list of hands for this world."

	(worldState hands includes: aHandMorph)
		ifFalse: [ ^ self ].
	aHandMorph dropMorphs.
	self invalidRect: aHandMorph fullBounds.
	worldState removeHand: aHandMorph
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>resetWorldMenu [
	
	worldState resetWorldMenu

]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>runLocalStepMethods [

	worldState runLocalStepMethodsIn: self

]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>runStepMethods [

	worldState runStepMethodsIn: self

]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>sleep [

	worldState canvas ifNil: [^ self  "already called (clean this up)"].
	Cursor normal show.	"restore the normal cursor"
	worldState canvas: nil.		"free my canvas to save space"
	self fullReleaseCachedState.

]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>startStepping: aMorph at: scheduledTime selector: aSelector arguments: args stepTime: stepTime [
	worldState startStepping: aMorph at: scheduledTime selector: aSelector arguments: args stepTime: stepTime.
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>step [
	owner ifNotNil: [ ^ self runLocalStepMethods ].
	^ super step
]

{
	#category : #'project state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>stepListSize [
	^ worldState stepListSize

"Transcript cr; show: self currentWorld stepListSize printString, ' items on steplist as of ', Date dateAndTimeNow printString"
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>stopStepping: aMorph [
	"Remove the given morph from the step list."

	worldState stopStepping: aMorph

]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>stopStepping: aMorph selector: aSelector [
	"Remove the given morph from the step list."

	worldState stopStepping: aMorph selector: aSelector

]

{
	#category : #'menu & halo',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>truncatedMenuLabelFor: aWindowLabel [
	^ aWindowLabel truncateWithElipsisTo: 47
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>veryDeepCopyWith: deepCopier [
	"never copy the World"

	^ self
]

{
	#category : #'project state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>viewBox [

	^ worldState viewBox
]

{
	#category : #'world state',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>viewBox: newViewBox [
	"I am now displayed within newViewBox; react."

	(self viewBox isNil or: [ self viewBox extent ~= newViewBox extent ])
		ifTrue: [ worldState canvas: nil ].
	worldState viewBox: newViewBox.
	super viewBox: newViewBox.
	worldState handsDo: [ :hand | hand releaseKeyboardFocus ].
	self fullRepaintNeeded
]

{
	#category : #'halos and balloon help',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>wantsDirectionHandles [

	^ false
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>wantsDropFiles: anEvent [
	^ true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>wantsDroppedMorph: aMorph event: evt [
	
	^ true
]

{
	#category : #'menu & halo',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>wantsWindowEvent: anEvent [
	^ true
]

{
	#category : #structure,
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>world [
	
	^self
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:11'
}
WorldMorph>>worldMenu [
	^ worldState worldMenu
	
]
