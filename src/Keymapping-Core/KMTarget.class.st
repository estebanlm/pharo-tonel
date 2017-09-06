"
I am the reification of the Keymap target.  I am the one that receives the actions.
"
Class {
	#name : #KMTarget,
	#superclass : #Object,
	#instVars : [
		'realTarget',
		'morph',
		'targetSelector',
		'directKeymaps',
		'perInstanceCategories'
	],
	#category : #Keymapping-Core,
	#timestamp : 'GuillermoPolito 2/24/2011 23:44'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMTarget class>>for: aTarget in: aMorph [
	^ (self new)
		targetSelector: aTarget;
		morph: aMorph;
		yourself
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMTarget>>announcer [

	^ self morph announcer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMTarget>>dispatch: buffer [

	morph kmDispatcher dispatch: buffer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMTarget>>morph [
	^morph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMTarget>>morph: aMorph [
	morph := aMorph
]

{
	#category : #iterating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMTarget>>nextForKmChain: aKMDispatchChain  [
	^self ownerTarget
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMTarget>>ownerTarget [
	morph owner ifNil: [ ^nil ].
	^morph owner kmDispatcher target.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMTarget>>realTarget [
	^morph perform: self targetSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMTarget>>targetSelector [
	^targetSelector ifNil: [ #yourself ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMTarget>>targetSelector: aTargetSelector [
	targetSelector := aTargetSelector
]
