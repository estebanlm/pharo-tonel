"
I am a menu item morph with the ability to refresh periodically all my values (name, state, enablement, icon, submenu)

Since it is not a good idea to change the shortcut, this ability is not available
"
Class {
	#name : #UpdatingMenuItemMorph,
	#superclass : #ToggleMenuItemMorph,
	#instVars : [
		'nameSelector',
		'iconSelector',
		'subMenuSelector',
		'balloonTextSelector'
	],
	#category : #Morphic-Base-Menus,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>balloonText [

	^ self target perform: balloonTextSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>balloonTextSelector [
	^ balloonTextSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>balloonTextSelector: anObject [
	balloonTextSelector := anObject.
	self updateBalloonText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>contents [

	^ self target perform: nameSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>icon [

	^ (target perform: iconSelector)
		ifNil: [ super icon ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>iconSelector [
	^ iconSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>iconSelector: anObject [
	iconSelector := anObject.
	self updateIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>nameSelector [
	^ nameSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>nameSelector: aSymbol [
	nameSelector := aSymbol.
	self updateContents
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>step [

	owner ifNil: [ ^ self stopStepping ].
	self updateContents.
	self changed
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>stepTime [
	
	^ 250
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>subMenuSelector [
	^ subMenuSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>subMenuSelector: anObject [
	subMenuSelector := anObject.
	self updateSubMenu
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>updateBalloonText [

	target ifNotNil: [ self balloonText: (target perform: balloonTextSelector) ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>updateContents [

	target ifNotNil: [ contents := (target perform: nameSelector) ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>updateIcon [

	target ifNotNil: [ self icon: (target perform: iconSelector) ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
UpdatingMenuItemMorph>>updateSubMenu [

	target ifNotNil: [ subMenu := (target perform: subMenuSelector) ]
]
