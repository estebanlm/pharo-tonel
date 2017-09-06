"
I am a subclass of StandardWindow with my own icon

Maybe I'm useless, but right now I'm not on the top of the to do list
"
Class {
	#name : #NautilusWindow,
	#superclass : #StandardWindow,
	#category : #NautilusCommon,
	#timestamp : '<historical>'
}

{
	#category : #about,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusWindow>>aboutText [

	^'Nautilus is a new browser for Pharo Smalltalk based on RPackage and Announcements with fancy goodies:
	- groups
	- multi-selections
	- environments
	- iconic buttons
	- hierarchy
	- pragma based menus
	- KeyMapping shortcuts
	- Ring compliant
	- refactorings support
	- stateless shortcuts
	- multiple source code panel
	- direct feedback (method too long, class uncommented ...)

Made by Benjamin Van Ryseghem and friends'
]

{
	#category : #about,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusWindow>>aboutTitle [

	^'About Nautilus'
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusWindow>>delete [
	
	| mod |
	mod := self model.
	super delete.
	mod 
		ifNotNil: [ mod announce: (WindowClosed new window: self) ]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusWindow>>hasFocus [

	^ ActiveHand keyboardFocus == self
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusWindow>>initialExtent [
	^ 850@620
]
