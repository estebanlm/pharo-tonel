"
I represent a shortcut setting. I relate a keymap with its default shortcut and its current shortcut, so it can be mutated.
"
Class {
	#name : #KMShortcutSetting,
	#superclass : #Object,
	#instVars : [
		'shortcutName',
		'category',
		'action'
	],
	#category : #Keymapping-Settings,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutSetting class>>for: aShortcutName in: aCategory [
	^ (self new)
		shortcutName: aShortcutName;
		category: aCategory;
		yourself
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutSetting class>>settingInputWidgetForNode: aSettingNode [
	| catcherMorph theme |
	theme := UITheme builder.
	catcherMorph := KMCatcherMorph for: aSettingNode realValue.
	^ theme newRow: {catcherMorph}
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutSetting>>accept: aShortcut  [
	self keymap shortcut: aShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutSetting>>action: anActionBlock [
	action := anActionBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutSetting>>category: aCategory [
	category := aCategory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutSetting>>defaultShortcut [
	^ self keymap defaultShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutSetting>>keymap [
	^ KMFactory keymapContainer keymapNamed: shortcutName inCategory: category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutSetting>>keystrokes [
	^ self keymap shortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutSetting>>shortcut [
	^ self keymap shortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutSetting>>shortcutName: aShortcutName [
	shortcutName := aShortcutName
]
