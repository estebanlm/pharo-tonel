"
I am a keymap builder that is used when configuring keymappings by pragmas.

Send me the #shortcut: message with a keymap name, so I give you a specific builder to build a keymap.

You can also tell me to install a category as global.
"
Class {
	#name : #KMBuilder,
	#superclass : #Object,
	#instVars : [
		'platform'
	],
	#category : #Keymapping-Pragmas,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMBuilder class>>keymap [
	^self keymap: #all
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMBuilder class>>keymap: aPlatform [
	(#( all Unix MacOSX Windows ) includes: aPlatform) ifFalse: [ self error: aPlatform, ' is not a valid platform' ].
	^self new
		platform: aPlatform;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMBuilder>>platform: aPlatform [
	platform := aPlatform
]

{
	#category : #keymap-building,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMBuilder>>setAsGlobalCategory: aGlobalCategory [

	KMRepository default setAsGlobalCategory: aGlobalCategory
]

{
	#category : #keymap-building,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMBuilder>>shortcut: aKeymapName [
	^KMKeymapBuilder 
		for: aKeymapName
		platform: platform
]
