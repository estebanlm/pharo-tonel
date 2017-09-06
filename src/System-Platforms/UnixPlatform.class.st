"
I am a an object representing a Unix platform. Use myself to access platform specific features.

Please keep me polymorphic to the the other platform objects.

To get the current platform, you can evaluate:

OSPlatform current.
"
Class {
	#name : #UnixPlatform,
	#superclass : #OSPlatform,
	#category : #System-Platforms,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
UnixPlatform class>>isActivePlatform [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
UnixPlatform>>family [
	^#Unix
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
UnixPlatform>>isUnix [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
UnixPlatform>>keyForValue: aKeyValue [
	^Key valueForUnixPlatform: aKeyValue.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
UnixPlatform>>lineEnding [

	^ String lf
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
UnixPlatform>>menuShortcutString [
	^ 'ctrl'
]
