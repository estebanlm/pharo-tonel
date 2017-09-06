"
I am a an object representing a MacOSX platform. Use myself to access platform specific features.

Please keep me polymorphic to the the other platform objects.

To get the current platform, you can evaluate:

OSPlatform current.
"
Class {
	#name : #MacOSXPlatform,
	#superclass : #MacOSPlatform,
	#category : #System-Platforms,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
MacOSXPlatform class>>isActivePlatform [
	^ self isMacOS and: [ self currentVersion asNumber >= 1000 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
MacOSXPlatform>>family [
	^#MacOSX
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
MacOSXPlatform>>isMacOSX [
	^ true
]
