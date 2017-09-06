"
I am a an object representing a Mac OS (pre OSX) platform. Use myself to access platform specific features.

"
Class {
	#name : #MacOSPlatform,
	#superclass : #OSPlatform,
	#category : #System-Platforms,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
MacOSPlatform class>>isActivePlatform [
	^ self isMacOS and: [ self currentVersion asNumber < 1000 ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
MacOSPlatform class>>isMacOS [

	^ self currentPlatformName = 'Mac OS'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
MacOSPlatform>>family [
	^#MacOS
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
MacOSPlatform>>isMacOS [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
MacOSPlatform>>keyForValue: aKeyValue [
	^Key valueForMacOSXPlatform: aKeyValue.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
MacOSPlatform>>lineEnding [

	^ String lf
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
MacOSPlatform>>menuShortcutString [
	^ 'cmd'
]
