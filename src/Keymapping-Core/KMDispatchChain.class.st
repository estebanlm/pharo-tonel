"
I am an object that controls the dispatch order of keymaps given a hierarchy of morphs.

"
Class {
	#name : #KMDispatchChain,
	#superclass : #Object,
	#instVars : [
		'target',
		'dispatcher',
		'initialTarget'
	],
	#category : #Keymapping-Core,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDispatchChain class>>from: anInitialTarget andDispatcher: aDispatcher [
	^self new
			dispatcher: aDispatcher;
			startOn: anInitialTarget;
			yourself
]

{
	#category : #dispatching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDispatchChain>>dispatch: aKeyboardEvent [
	self do: [ :targetToDispatch |
		targetToDispatch dispatch: KMBuffer uniqueInstance buffer copy.
		aKeyboardEvent wasHandled ifTrue: [ ^self ].
	].
	"This should be a noMatch event"
	aKeyboardEvent wasHandled ifFalse: [ KMBuffer uniqueInstance clearBuffer ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDispatchChain>>dispatcher: aDispatcher [
	dispatcher := aDispatcher.
	self target: dispatcher target.
]

{
	#category : #iterating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDispatchChain>>do: aBlock [
	| currentTarget |
	currentTarget := initialTarget.
	[ currentTarget isNil ]
		whileFalse: [
			aBlock value: currentTarget.
			currentTarget := currentTarget nextForKmChain: self.
		]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDispatchChain>>startOn: anInitialTarget [
	initialTarget := anInitialTarget.
]

{
	#category : #iterating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDispatchChain>>target [
	^target
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDispatchChain>>target: aTarget [
	target := aTarget
]
