"
I am a null shortcut handler for morphic. I register myself as a tool to be replaced by somebody else who really wants to handle shortcuts.
"
Class {
	#name : #MorphicShortcutHandler,
	#superclass : #Object,
	#category : #Morphic-Core-Events,
	#timestamp : '<historical>'
}

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicShortcutHandler class>>registerToolsOn: aToolRegistry [
	"commente out as Smalltalk resetTools might register this handler and break keybindings"
	"aToolRegistry register: self new as: #shortcuts"
]

{
	#category : #shortcut-handling,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicShortcutHandler>>handleKeystroke: aKeystrokeEvent inMorph: aMorph [

	"I do nothing. I'm a null object"
]
