"
Groups a set of sounds to use with a UITheme.
Note that, although instances may have their sounds changed the settings will still indicate the class of theme that is current.
"
Class {
	#name : #SoundTheme,
	#superclass : #Object,
	#instVars : [
		'sounds'
	],
	#classVars : [
		'Current',
		'UseThemeSounds'
	],
	#category : #Polymorph-Widgets-Themes,
	#timestamp : 'AlainPlantec 1/7/2010 22:41'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme class>>allThemeClasses [
	"Answer the subclasses of the receiver that are considered to be
	concrete (useable as a theme)."

	^self withAllSubclasses reject: [:c | c isAbstract]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme class>>beCurrent [
	"Make a new instance of the receiver be the current theme."

	self isAbstract ifTrue: [^self error: self name, ' is abstract, send #beCurrent to a subclass.'].
	self current: self newDefault
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme class>>current [
	"Answer the current ui theme."

	^Current ifNil: [Current := NullSoundTheme newDefault. Current]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme class>>current: aSoundTheme [
	"Set the current sound theme."

	Current := aSoundTheme
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme class>>isAbstract [
	"Answer whether the receiver is considered to be abstract."

	^false
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme class>>isCurrent [
	"Answer whether an instance of the receiver is the current theme."

	^self current class == self
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme class>>newDefault [
	"Answer a new instance of the sound theme with
	its default sounds."

	^self new
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme class>>themeName [
	"Answer the friendly name of the theme."

	^'Beeper sounds'
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme class>>useThemeSounds [
	 ^ UseThemeSounds ifNil: [UseThemeSounds := true]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme class>>useThemeSounds: aBoolean [
	UseThemeSounds := aBoolean
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>abortSound [
	"Answer the abort sound."

	^self sounds at: #abort ifAbsent: [self defaultSound]
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>alertSound [
	"Answer the alert sound."

	^self sounds at: #alert ifAbsent: [self defaultSound]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>defaultAbortSound [
	"Answer the default abort sound."

	^self defaultSound
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>defaultAlertSound [
	"Answer the default alert sound."

	^self defaultSound
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>defaultDefaultSound [
	"Answer the default default sound!"

	^Beeper default
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>defaultDenySound [
	"Answer the default deny sound."

	^self defaultSound
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>defaultMessageSound [
	"Answer the default message sound."

	^self defaultSound
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>defaultQuestionSound [
	"Answer the default question sound."

	^self defaultSound
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>defaultSound [
	"Answer the default sound."

	^self sounds at: #default ifAbsent: [self defaultDefaultSound]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>defaultWindowCloseSound [
	"Answer the default window close sound."

	^self defaultSound
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>defaultWindowMaximizeSound [
	"Answer the default window maximize sound."

	^self defaultSound
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>defaultWindowMinimizeSound [
	"Answer the default window minimize sound."

	^self defaultSound
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>defaultWindowOpenSound [
	"Answer the default window open sound."

	^self defaultSound
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>defaultWindowRestoreDownSound [
	"Answer the default window restore down sound."

	^self defaultSound
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>defaultWindowRestoreUpSound [
	"Answer the default window restore up sound."

	^self defaultSound
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>denySound [
	"Answer the deny sound."

	^self sounds at: #deny ifAbsent: [self defaultSound]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>initialize [
	"Initialize the receiver."

	super initialize.
	self initializeSounds
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>initializeSounds [
	"Initialize the receiver's event sounds."

	self sounds: Dictionary new.
	self sounds
		at: #default put: self defaultDefaultSound;
		at: #abort put: self defaultAbortSound;
		at: #alert put: self defaultAlertSound;
		at: #deny put: self defaultDenySound;
		at: #message put: self defaultMessageSound;
		at: #question put: self defaultQuestionSound;
		at: #windowMinimize put: self defaultWindowMinimizeSound;
		at: #windowMaximize put: self defaultWindowMaximizeSound;
		at: #windowRestoreUp put: self defaultWindowRestoreUpSound;
		at: #windowRestoreDown put: self defaultWindowRestoreDownSound;
		at: #windowClose put: self defaultWindowCloseSound
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>messageSound [
	"Answer the message sound."

	^self sounds at: #message ifAbsent: [self defaultSound]
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>questionSound [
	"Answer the question sound."

	^self sounds at: #question ifAbsent: [self defaultSound]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>sounds [
	"Answer the value of sounds"

	^ sounds
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>sounds: anObject [
	"Set the value of sounds"

	sounds := anObject
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>windowCloseSound [
	"Answer the window close sound."

	^self sounds at: #windowClose ifAbsent: [self defaultSound]
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>windowMaximizeSound [
	"Answer the window maximize sound."

	^self sounds at: #windowMaximize ifAbsent: [self defaultSound]
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>windowMinimizeSound [
	"Answer the window minimize sound."

	^self sounds at: #windowMinimize ifAbsent: [self defaultSound]
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>windowOpenSound [
	"Answer the window open sound."

	^self sounds at: #windowOpen ifAbsent: [self defaultSound]
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>windowRestoreDownSound [
	"Answer the window restore down sound."

	^self sounds at: #windowRestoreDown ifAbsent: [self defaultSound]
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:15'
}
SoundTheme>>windowRestoreUpSound [
	"Answer the window restore up sound."

	^self sounds at: #windowRestoreUp ifAbsent: [self defaultSound]
]
