"
Themed task list/switcher to select the topmost window. Use cmd + left or right arrows (not ideal but the os typically handles cmd + tab/shift-tab).
On Linux, release of the command key is not detected (vm issue), so press and release cmd again or move the mouse!
"
Class {
	#name : #TaskListMorph,
	#superclass : #Morph,
	#instVars : [
		'tasks',
		'taskList',
		'preview'
	],
	#classVars : [
		'KeepOpen'
	],
	#category : #Morphic-Widgets-Taskbar,
	#timestamp : 'gvc 5/18/2007 11:19'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph class>>from: aKeyboardEvent  [

	| instance |
	instance := self new.
	aKeyboardEvent shiftPressed
		ifTrue: [ instance selectNextTask ]
		ifFalse: [ instance selectPreviousTask ].
	^ instance.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph class>>isNavigationEvent: aKeyboardEvent [

	^ aKeyboardEvent asKeyCombination = Character tab alt or: [ aKeyboardEvent asKeyCombination = Character tab alt shift ].
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph class>>keepOpen [
	^ KeepOpen ifNil: [KeepOpen := false]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph class>>keepOpen: aBoolean [
	KeepOpen := aBoolean
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph class>>taskListSettingOn: aBuilder [
	<systemsettings> 
	(aBuilder setting: #keepTaskListOpen)
		label: 'Keep task list open';
		description: 'Whether the tasklist is closed (and the selected window activated) when the command key is released';
		parent: #morphic;
		selector: #keepOpen;
		target: self.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>activeTask [
	"Answer the active task"
	
	^self tasks detect: [:t | t isActive] ifNone: []
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>addMorphs [
	"Add our morphs."

	| mainColumn |
	self preview: self newPreviewMorph.
	self taskList: self newTasksMorph.
	mainColumn := self theme newColumnIn: self for: {
		self preview.
		self taskList }.
	mainColumn
		vResizing: #shrinkWrap;
		cellInset: 8;
		cellPositioning: #center.
	self addMorph: mainColumn.
	self layoutChanged
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>defaultPreviewExtent [
	"Answer the default extent of the preview holder."

	^320@320
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>done [
	"Close the tasklist and make the active task current."
	
	self delete.
	self activeTask ifNotNil: [ :t | t activate ]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>handlesKeyboard: evt [
	"Yes, we do it here."
	
	^true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		initializeTasks;
		initializeLayout;
		initializeAppearance;
		addMorphs;
		updateButtonsAndPreview;
		adoptPaneColor: self color
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>initializeAppearance [
	"Initialize the appearance."

	self
		color: (Color black alpha: 0.15);
		fillStyle: (self theme taskListFillStyleFor: self);
		borderStyle: (self theme taskbarThumbnailNormalBorderStyleFor: self);
		cornerStyle: (self theme taskbarThumbnailCornerStyleFor: self)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>initializeLayout [
	"Initialize the layout."

	self
		changeTableLayout;
		layoutInset: 16;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		extent: self minimumExtent
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>initializeTasks [
	"Set up the current tasks."
	
	self tasks: ((World submorphs
		collect: [:m | m taskbarTask])
		select: [:m | m notNil]) asOrderedCollection
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>keepOpen [
	^ self class keepOpen
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>keyStroke: event  [
	"Process keys to switch task."
	
	event keyCharacter = Character escape ifTrue: [^self delete].
	event anyModifierKeyPressed ifFalse: [^self done].
	event keyString =  '<Opt-Shift-tab>' ifTrue: [^self selectPreviousTask].
	event keyString =  '<Opt-tab>'	ifTrue: [^self selectNextTask]
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>minimumExtent [
	"Answer the minimum extent."

	^self defaultPreviewExtent + 64
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>newPreviewMorph [
	"Answer a new preview holder."
	^ Morph new
		color: Color transparent;
		extent: self defaultPreviewExtent;
		yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>newTasksMorph [
	"Answer a new task list."

	^Morph new
		changeTableLayout;
		listDirection: #leftToRight;
		wrapDirection: #topToBottom;
		cellInset: 1;
		color: Color transparent;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		yourself.
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>openAsIs [
	"Open in the world."
	
	self openAsIsIn: self currentWorld
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>openAsIsIn: aWorld [
	"Update the layout after opening."

	aWorld addMorphCentered: self.
	self allMorphs do: [:m | m layoutChanged].
	aWorld startSteppingSubmorphsOf: self.
	
	self announceOpened.
	
	self wantsKeyboardFocus
		ifTrue: [self takeKeyboardFocus]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>preview [
	"Answer the value of preview"

	^ preview
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>preview: anObject [
	"Set the value of preview"

	preview := anObject
]

{
	#category : #cycling,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>selectNextTask [
	"Make the next task active."
	
	self selectTask: (self tasks
		after: self activeTask
		ifAbsent: [self tasks isEmpty
					ifFalse: [self tasks first]])
]

{
	#category : #cycling,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>selectPreviousTask [
	"Make the previous task active."
	
	self selectTask: (self tasks
		before: self activeTask
		ifAbsent: [self tasks isEmpty
					ifFalse: [self tasks last]])
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>selectTask: aTask [
	"Make the given task active and update the buttons."
	
	self tasks do: [:t | t state: #restored].
	aTask ifNotNil: [ aTask state: #active ].
	self updateButtonsAndPreview
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>step [
	"Check the sensor for the command key to see if we're done."

	(self keepOpen not and: [self activeHand anyModifierKeyPressed not])
		ifTrue: [self done]
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>stepTime [
	"Check quickly."

	^100
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>takesKeyboardFocus [
	"Answer whether the receiver can normally take keyboard focus."

	^true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>taskClicked: aTask [
	"A button for a task has been pressed.
	Close after selecting."
	
	self selectTask: aTask.
	self done
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>taskList [
	"Answer the value of taskList"

	^ taskList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>taskList: anObject [
	"Set the value of taskList"

	taskList := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>tasks [
	"Answer the value of tasks"

	^ tasks
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>tasks: anObject [
	"Set the value of tasks"

	tasks := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>updateButtonsAndPreview [
	"Update the buttons and the preview.."
	
	self
		updateTaskButtons;
		updatePreview.
	self world ifNotNil: 
		[self center: self world center]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>updatePreview [
	"Update the preview.."
	
	self preview removeAllMorphs.
	self preview addMorphCentered: ( 
		self activeTask 
				ifNil: [ 'No tasks...' asMorph	]
				ifNotNil: [:t | t morph taskThumbnailOfSize: self preview extent])
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskListMorph>>updateTaskButtons [
	"Make buttons for the ordered tasks."
	
	
	self taskList removeAllMorphs.
	self tasks do: [:t | | button |
		button := t taskListButtonFor: self.
		button ifNotNil: [self taskList addMorphBack: button]]
]
