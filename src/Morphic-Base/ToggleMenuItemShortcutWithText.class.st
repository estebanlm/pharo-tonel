"
I show a menu as a text. 
I'm the simplest mechanism and then, the default.
"
Class {
	#name : #ToggleMenuItemShortcutWithText,
	#superclass : #ToggleMenuItemShortcut,
	#category : #Morphic-Base-Menus,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemShortcutWithText class>>canBeUsed [
	"this is the default and is available as default to all platforms"
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemShortcutWithText class>>priority [
	"Lowest priority... last to be choosen"
	^ 999
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemShortcutWithText>>drawOn: aCanvas [
	| keyBounds |
	
	keyBounds := self boundsForKeyText: self keyText font: self owner fontToUse.
	self owner
		drawText: keyText
		on: aCanvas
		in: keyBounds
		color: self owner stringColorToUse
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemShortcutWithText>>text [

	^ keyText
]
