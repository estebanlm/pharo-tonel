"
This is the base class for a sound system. A sound system offers a small protocol for playing sounds and making beeps. 

While SoundSystem is an abstract class, it acts as a facade to 
the actual SoundSystem.

When the SoundPackage is not loaded, SoundSystem current refers to DummySoundSystem. 

SoundSystem current gives access to the currently installed SoundSystem.

When no SoundSystem is available, a dummy one is installed as current.  
    
SoundSystem soundEnabled: true.
SoundSystem current beep


SoundSystem current: BaseSoundSystem new



"
Class {
	#name : #SoundSystem,
	#superclass : #Object,
	#classVars : [
		'Current',
		'SoundEnabled',
		'SoundQuickStart'
	],
	#category : #System-Sound,
	#timestamp : '<historical>'
}

{
	#category : #'current ',
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem class>>current [

	^ Current ifNil: [ Current := DummySoundSystem new ]
]

{
	#category : #'current ',
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem class>>current: aSoundSystem [

	Current ifNotNil: [Current deactivate].
	Current := aSoundSystem.
	Current activate.
]

{
	#category : #'current ',
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem class>>resetSoundSystem [
	Current := nil
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem class>>soundEnabled [
	^ SoundEnabled ifNil: [SoundEnabled := false]
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem class>>soundEnabled: aBoolean [
	SoundEnabled := aBoolean
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem class>>soundQuickStart [
	^ SoundQuickStart ifNil: [SoundQuickStart := false]
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem class>>soundQuickStart: aBoolean [
	SoundQuickStart := aBoolean
]

{
	#category : #'activation hooks',
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem>>activate [
	"Hook for possible specialization when activating a sound system"
]

{
	#category : #beep,
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem>>beep [
	"Make a primitive beep."

	self subclassResponsibility
]

{
	#category : #'activation hooks',
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem>>deactivate [
	"Hook for possible specialization when activating a sound system"
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem>>playSampledSound: samples rate: rate [

	self subclassResponsibility
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem>>playSoundNamed: soundName [

	self subclassResponsibility
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem>>playSoundNamed: soundName ifAbsentReadFrom: aifFileName [

	self subclassResponsibility
]

{
	#category : #sounds,
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem>>playSoundNamedOrBeep: soundName [

	self subclassResponsibility
]

{
	#category : #'to deprecate',
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem>>randomBitsFromSoundInput: bitCount [

	self subclassResponsibility
]

{
	#category : #'to deprecate',
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem>>sampledSoundChoices [

	self subclassResponsibility
]

{
	#category : #'activation hooks',
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem>>shutDown [
	"by default do nothing"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem>>soundEnabled [

	^ self class soundEnabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem>>soundEnabled: aBoolean [

	^ self class soundEnabled: aBoolean
]

{
	#category : #query,
	#timestamp : ' 8/31/2017 05:26:16'
}
SoundSystem>>soundNamed: soundName [

	self subclassResponsibility
]
