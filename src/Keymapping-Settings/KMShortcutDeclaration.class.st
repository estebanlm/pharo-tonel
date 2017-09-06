"
I represent a shortcut declaration for the settings pharo framework.
"
Class {
	#name : #KMShortcutDeclaration,
	#superclass : #SettingDeclaration,
	#instVars : [
		'categoryName',
		'declaration',
		'shortcutName'
	],
	#category : #Keymapping-Settings,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutDeclaration>>categoryName [
	^categoryName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutDeclaration>>categoryName: aCategoryName [
	categoryName := aCategoryName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutDeclaration>>defaultValue [
	^self realValue defaultShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutDeclaration>>realValue [
	"Answer the value of realValue"

	^ declaration
		ifNil: [
			declaration := KMShortcutSetting for: self shortcutName in: self categoryName]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutDeclaration>>realValue: aShortcut [
	self realValue accept: aShortcut.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutDeclaration>>shortcutName [
	^shortcutName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutDeclaration>>shortcutName: aShortcutName [
	shortcutName := aShortcutName
]
