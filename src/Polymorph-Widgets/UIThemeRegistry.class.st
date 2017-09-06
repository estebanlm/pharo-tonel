"
Registry for UI themes
"
Class {
	#name : #UIThemeRegistry,
	#superclass : #Object,
	#category : #Polymorph-Widgets-Themes,
	#timestamp : 'TorstenBergmann 2/5/2014 10:31'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeRegistry class>>icons [
	^ ThemeIcons current
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
UIThemeRegistry class>>theme  [
	^ UITheme current
]
