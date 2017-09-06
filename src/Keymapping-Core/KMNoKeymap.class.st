"
I am a Null object representing the absence of a Keymap.
"
Class {
	#name : #KMNoKeymap,
	#superclass : #Object,
	#category : #Keymapping-Core,
	#timestamp : 'GuillermoPolito 2/24/2011 23:43'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMNoKeymap>>shortcut [
	^ KMNoShortcut new
]
