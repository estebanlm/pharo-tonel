"
I am the real keymap.  I have an action to evaluate when my keymap sequence is pressed.
"
Class {
	#name : #KMKeymap,
	#superclass : #Object,
	#instVars : [
		'action',
		'name',
		'shortcut',
		'defaultShortcut',
		'description'
	],
	#category : #Keymapping-Core,
	#timestamp : 'GuillermoPolito 12/14/2010 21:33'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap class>>named: keymapName shortcut: aShortcut action: anAction [
	^ (self new)
		name: keymapName;
		defaultShortcut: aShortcut;
		shortcut: aShortcut;
		action: anAction;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap class>>named: keymapName shortcut: aShortcut action: anAction description: aDescription [
	^ (self new)
		name: keymapName;
		defaultShortcut: aShortcut;
		shortcut: aShortcut;
		action: anAction;
		description: aDescription;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap class>>shortcut: aShortcut action: anAction [
	^ (self new)
		defaultShortcut: aShortcut;
		shortcut: aShortcut;
		action: anAction;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>= aKeymap [
	self == aKeymap
		ifTrue: [ ^ true ].
	self species = aKeymap species
		ifFalse: [ ^ false ].
	^action = aKeymap action and: [ shortcut = aKeymap shortcut and: [ name = aKeymap name ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>action [
	^ action
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>action: anAction [
	action := anAction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>defaultShortcut [
	^defaultShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>defaultShortcut: aShortcut [
	defaultShortcut := aShortcut.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>description [
	^description ifNil: [ '' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>description: aDescription [
	description := aDescription asString
]

{
	#category : #enabling/disabling,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>disable [

	self shortcut: KMNoShortcut new.
]

{
	#category : #executing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>executeActionTargetting: target [
	^ self action cull: target cull: target
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>hasName [
	^name notNil
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>hash [
	^action hash bitXor: (shortcut hash bitXor: name hash)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>key [
	^ name
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>matches: anEventBuffer [

	^ anEventBuffer
		ifEmpty: [ false ]
		ifNotEmpty: [ self shortcut matches: anEventBuffer ]
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>matchesCompletely: aShortcut [
	^ self shortcut matchesCompletely: aShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>name: aName [
	name := aName
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>notifyCompleteMatchTo: aListener buffer: aBuffer [
	| listeners |
	aListener isCollection ifTrue: [ listeners := aListener ] ifFalse: [ listeners := { aListener } ].
	listeners do: [ :l | l completeMatch: self buffer: aBuffer ].
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>notifyPartialMatchTo: aListener [
	| listeners |
	aListener isCollection ifTrue: [ listeners := aListener ] ifFalse: [ { aListener } ].
	listeners do: [ :l | l partialMatch ].
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>onMatchWith: anEventBuffer notify: aMatchListener andDo: anAction [
	(self matches: anEventBuffer)
			ifTrue: [ 
				(self matchesCompletely: anEventBuffer)
					ifTrue: [ self notifyCompleteMatchTo: aMatchListener buffer: anEventBuffer ]
					ifFalse: [ self notifyPartialMatchTo: aMatchListener ].
					anAction value.
				] 
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>printOn: aStream [
	aStream 
		nextPutAll: self name printString;
		nextPutAll: ' on ';
		nextPutAll: self shortcut printString;
		nextPutAll: ' do ' ;
		nextPutAll: self action printString;
		cr.    
]

{
	#category : #enabling/disabling,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>reset [

	self shortcut: self defaultShortcut.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>shortcut [
	^ shortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>shortcut: aShortcut [
	shortcut := aShortcut.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymap>>shortcutHasChangedBy: aShortcut [
	self defaultShortcut = self shortcut ifTrue: [ self shortcut: aShortcut ].
	self defaultShortcut: aShortcut
]
