"
I am a an object representing a Mac OS (pre OSX) platform. Use myself to access platform specific features.

"
Class {
	#name : #MacOSPlatform,
	#superclass : #OSPlatform,
	#category : #System-Platforms
}

{ #category : #testing }
MacOSPlatform class >> isActivePlatform [
	^ self isMacOS and: [ self currentVersion asNumber < 1000 ]
]

{ #category : #testing }
MacOSPlatform class >> isMacOS [

	^ self currentPlatformName = 'Mac OS'
]

{ #category : #accessing }
MacOSPlatform >> family [
	^#MacOS
]

{ #category : #testing }
MacOSPlatform >> isMacOS [
	^ true
]

{ #category : #accessing }
MacOSPlatform >> keyForValue: aKeyValue [
	^Key valueForMacOSXPlatform: aKeyValue.
]

{ #category : #accessing }
MacOSPlatform >> lineEnding [

	^ String lf
]

{ #category : #accessing }
MacOSPlatform >> menuShortcutString [
	^ 'cmd'
]
