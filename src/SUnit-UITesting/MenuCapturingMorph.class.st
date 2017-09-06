"
It's difficult to test whether menus appear because the test might block the UI thread and prevent it.

I use Morphic stepping to monitor the world for a new menu. If I find one, you can get it by sending me #menu.
"
Class {
	#name : #MenuCapturingMorph,
	#superclass : #Morph,
	#instVars : [
		'menu'
	],
	#category : #SUnit-UITesting,
	#timestamp : 'SeanDeNigris 2/20/2014 08:47'
}

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
MenuCapturingMorph>>menu [

	^ menu.
]

{
	#category : #'stepping and presenter',
	#timestamp : ' 8/31/2017 05:26:20'
}
MenuCapturingMorph>>step [

	menu := World submorphs detect: [ :m | m isKindOf: MenuMorph ] ifNone: [ menu ].
	menu isNil ifFalse: [ 
		menu delete.
		self delete ].
]
