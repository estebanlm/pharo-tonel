"
I am a an object representing a Unix platform (64bits). Use myself to access platform specific features.

Please keep me polymorphic to the the other platform objects.

To get the current platform, you can evaluate:

OSPlatform current.
"
Class {
	#name : #Unix64Platform,
	#superclass : #UnixPlatform,
	#category : #System-Platforms,
	#timestamp : 'EstebanLorenzano 3/6/2017 17:15'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
Unix64Platform class>>isActivePlatform [
	^ (self currentPlatformName = 'unix') and: [ Smalltalk vm wordSize = 8 ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
Unix64Platform>>isUnix64 [
	^ true
]
