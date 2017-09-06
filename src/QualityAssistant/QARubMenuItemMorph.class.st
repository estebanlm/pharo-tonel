"
I simulate the functionality of MenuItemMorph while providing more sophisticated visualization for rubric annotations 
"
Class {
	#name : #QARubMenuItemMorph,
	#superclass : #Morph,
	#category : #QualityAssistant,
	#timestamp : 'YuriyTymchuk 6/21/2016 20:54'
}

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:37'
}
QARubMenuItemMorph>>activateSubmenu: evt [

	^ false
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:37'
}
QARubMenuItemMorph>>deselect: sth [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
QARubMenuItemMorph>>hasIconOrMarker [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
QARubMenuItemMorph>>hasSubMenu [

	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
QARubMenuItemMorph>>isEnabled [

	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
QARubMenuItemMorph>>isMenuItemMorph [
	^ true
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:37'
}
QARubMenuItemMorph>>select: sth [

]
