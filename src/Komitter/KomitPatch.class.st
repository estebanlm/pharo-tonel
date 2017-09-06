"
I am a simple wrapper for patches
"
Class {
	#name : #KomitPatch,
	#superclass : #Object,
	#instVars : [
		'base',
		'patch'
	],
	#category : #Komitter-Models,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPatch class>>base: base patch: patch [

	^ self new
		base: base;
		patch: patch;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPatch>>base [
	^ base ifNil: [ MCSnapshot empty ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPatch>>base: anObject [
	base := anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPatch>>operations [

	^ patch operations
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPatch>>patch [
	^ patch
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPatch>>patch: anObject [
	patch := anObject
]
