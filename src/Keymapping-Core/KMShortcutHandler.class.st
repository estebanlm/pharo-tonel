"
I am a shortcut handler that installs keymappings in the system.
"
Class {
	#name : #KMShortcutHandler,
	#superclass : #Object,
	#category : #Keymapping-Core,
	#timestamp : '<historical>'
}

{
	#category : #shortcut-handling,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShortcutHandler>>handleKeystroke: aKeystrokeEvent inMorph: aMorph [

	aMorph handleKeystrokeWithKeymappings: aKeystrokeEvent
]
