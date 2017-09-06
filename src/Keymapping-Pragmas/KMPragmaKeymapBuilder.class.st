"
I am a singleton object, subscribed to system events, to listen to the creation of methods marked with the <keymap> and keymap:> pragmas.

When I listen one of those events, I reinitialize the KMRepository default instance and reload it with all declared keymaps.
"
Class {
	#name : #KMPragmaKeymapBuilder,
	#superclass : #Object,
	#instVars : [
		'pragmaKeywords',
		'model',
		'pragmaCollector'
	],
	#classVars : [
		'UniqueInstace'
	],
	#category : #Keymapping-Pragmas,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder class>>event: anEvent [
	anEvent method ifNil: [ ^self ].
	((anEvent method pragmas collect: #keyword) includesAnyOf: self pragmas )
		ifTrue: [ self uniqueInstance reset ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder class>>initialize [
	"KMPragmaKeymapBuilder initialize"
	self uniqueInstance reset.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder class>>pragmas [
	^#(#keymap #keymap:)
]

{
	#category : #system-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder class>>registerInterestToSystemAnnouncement [
	<systemEventRegistration>
	SystemAnnouncer uniqueInstance 
		unsubscribe: self.
	SystemAnnouncer uniqueInstance weak subscribe: MethodAdded, MethodModified, MethodRemoved 
		send: #event: 
		to: self.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder class>>release [
	SystemAnnouncer uniqueInstance unsubscribe: self.
	self uniqueInstance release
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder class>>uniqueInstance [
	^UniqueInstace ifNil: [ UniqueInstace := self new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder>>builder [
	^ self
]

{
	#category : #'registrations handling',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder>>collectRegistrations [
	| menu |
	menu := PragmaMenuAndShortcutRegistration model: self.
	self pragmaCollector
		do: [ :prg | 
			prg methodClass theNonMetaClass
				perform: prg methodSelector
				with:
					(menu
						platform: prg arguments;
						yourself) ].
	self interpretRegistration: menu
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder>>initialize [
	super initialize.
	pragmaKeywords := OrderedCollection new.
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder>>interpretRegistration: aRegistration [
	
	aRegistration handOutItems do: [:item || node |
		node := KMKeymapBuilder 
					for: item shortcut
					platform: item platform.
		item help 
			ifNil: [
				node
					category: item category
					shortcut: item default
					do: item action ]
			ifNotNil:[ 
				node
					category: item category
					shortcut: item default
					do: item action
					description: item help ]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder>>itemReceiver [
	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder>>model [
	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder>>model: anObject [
	model := anObject
]

{
	#category : #'registrations handling',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder>>pragmaCollector [
	"Return an up-to-date pragmaCollector which contains all pragmas which keyword is self pragmaKeyword"

	^ pragmaCollector
		ifNil: [ pragmaCollector := PragmaCollector
				filter: [ :prg | 
					(self pragmaKeywords includes: prg keyword)
						and: [ prg methodSelector numArgs = 1 ] ].
			(self pragmaKeywords notNil and: [ self pragmaKeywords notEmpty ])
				ifTrue: [ pragmaCollector reset ].
			pragmaCollector whenChangedSend: #reset to: self.
			pragmaCollector ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder>>pragmaKeywords [
	"Returns the pragmas keyword used to select pragmas (see #pragmaCollector)"
	^  self class pragmas
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder>>release [
	self pragmaCollector unsubscribe: self.
	self pragmaCollector announcer initialize. "Hack because the announcer is not garbage collected."
	pragmaCollector := nil.
	model := nil.
	self releaseActionMap. "we are not sure if we need it"
	super release.
	
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPragmaKeymapBuilder>>reset [
	pragmaCollector := nil.
	"KeymapManager default: KeymapManager new."
	self collectRegistrations.
]
