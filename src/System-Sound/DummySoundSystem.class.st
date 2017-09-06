"
A BeepingSoundSystem is a simple sound system just doing beep and niling everything else. 
"
Class {
	#name : #DummySoundSystem,
	#superclass : #SoundSystem,
	#category : #System-Sound,
	#timestamp : '<historical>'
}

{
	#category : #beep,
	#timestamp : ' 8/31/2017 05:26:16'
}
DummySoundSystem>>beep [
	"Make a primitive beep if possible."

	self soundEnabled 
		ifTrue: [ self beepPrimitive ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:16'
}
DummySoundSystem>>beepPrimitive [
	"Make a primitive beep. Not to be called directly.
	It is much better to use SoundSystem current beep
	since this method does not if sound is enabled"

	<primitive: 140>
	self primitiveFailed
]

{
	#category : #playing,
	#timestamp : ' 8/31/2017 05:26:16'
}
DummySoundSystem>>playSampledSound: samples rate: rate [
	"Do nothing."
	
]

{
	#category : #playing,
	#timestamp : ' 8/31/2017 05:26:16'
}
DummySoundSystem>>playSoundNamed: soundName [
	"Do nothing."
]

{
	#category : #playing,
	#timestamp : ' 8/31/2017 05:26:16'
}
DummySoundSystem>>playSoundNamed: soundName ifAbsentReadFrom: aifFileName [
	"Do nothing."
]

{
	#category : #playing,
	#timestamp : ' 8/31/2017 05:26:16'
}
DummySoundSystem>>playSoundNamedOrBeep: soundName  [
	"There is no sound support, so we make the beep."

	self beep
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:16'
}
DummySoundSystem>>randomBitsFromSoundInput: bitCount [
 	"I'm not sure what the right thing to do here is."

 	self error: 'Can not provide random data.'
	"in the future we should propose a simple random generator to be 
	for the DummySoundSystem."
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:16'
}
DummySoundSystem>>sampledSoundChoices [
	"No choices other than this."

	^ #('silence')
]

{
	#category : #query,
	#timestamp : ' 8/31/2017 05:26:16'
}
DummySoundSystem>>soundNamed: soundName [
	"There are no sounds to look up."

	^ nil
]
