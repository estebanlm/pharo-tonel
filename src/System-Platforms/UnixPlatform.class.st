"
I am a an object representing a Unix platform. Use myself to access platform specific features.

Please keep me polymorphic to the the other platform objects.

To get the current platform, you can evaluate:

OSPlatform current.
"
Class {
	#name : #UnixPlatform,
	#superclass : #OSPlatform,
	#category : #System-Platforms
}

{ #category : #testing }
UnixPlatform class >> isActivePlatform [
	^ false
]

{ #category : #accessing }
UnixPlatform >> family [
	^#Unix
]

{ #category : #testing }
UnixPlatform >> isUnix [
	^ true
]

{ #category : #accessing }
UnixPlatform >> keyForValue: aKeyValue [
	^Key valueForUnixPlatform: aKeyValue.
]

{ #category : #accessing }
UnixPlatform >> lineEnding [

	^ String lf
]

{ #category : #accessing }
UnixPlatform >> menuShortcutString [
	^ 'ctrl'
]
