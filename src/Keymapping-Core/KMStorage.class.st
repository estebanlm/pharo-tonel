"
I am a storage of shortcuts. I store and provide facilities to access named and annonimous shortcuts.
"
Class {
	#name : #KMStorage,
	#superclass : #Object,
	#instVars : [
		'namedRegistry',
		'anonymousRegistry'
	],
	#category : #Keymapping-Core,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMStorage>>, aKMStorage [
	^self class new
		addAll: self keymaps;
		addAll: aKMStorage keymaps.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMStorage>>add: aKeymap [
	aKeymap hasName
		ifTrue: [ namedRegistry at: aKeymap name put: aKeymap ]
		ifFalse: [ anonymousRegistry add: aKeymap ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMStorage>>addAll: keymaps [
	keymaps do: [ :km | self add: km ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMStorage>>hasKeymapNamed: aKmName [
	^namedRegistry includesKey: aKmName
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMStorage>>initialize [
	anonymousRegistry := Set new.
	namedRegistry := Dictionary new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMStorage>>keymapForShortcut: aShortcut [

	^ namedRegistry
		detect: [ :keymap | keymap shortcut = aShortcut ]
		ifNone: [ 
			anonymousRegistry
				detect: [ :keymap | keymap shortcut = aShortcut ]
				ifNone: [ nil ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMStorage>>keymapNamed: aKmName [
	^namedRegistry at: aKmName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMStorage>>keymaps [
	^anonymousRegistry , namedRegistry values
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMStorage>>remove: aKeymap [
	aKeymap hasName
		ifTrue: [ namedRegistry removeKey: aKeymap name ]
		ifFalse: [ anonymousRegistry remove: aKeymap ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMStorage>>size [
	^self keymaps size
]
