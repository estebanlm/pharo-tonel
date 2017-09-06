"
A silent sound theme
"
Class {
	#name : #NullSoundTheme,
	#superclass : #SoundTheme,
	#category : #Polymorph-Widgets-Themes,
	#timestamp : 'TorstenBergmann 2/5/2014 10:30'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
NullSoundTheme class>>themeName [
	"Answer the friendly name of the theme."

	^'No Sounds'
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
NullSoundTheme>>defaultDefaultSound [
	"Answer the default default sound!"

	^NullSound
]
