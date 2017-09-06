"
An OSPlatform is an abstract representation of a 'OS platform'.
Platforms can be hierarchical, e.g., a ""general"" platform as superclass and more specific platforms as subclasses as long as the subclasses provide sufficient means to identify themselves.
The original implementation was for Tweak.

Current		holds the current OSPlatform subclass

Architectural considerations:
most platform specific methods that need to be added to the platform class should be in the form of extensions rather then adding them directly to this package. Otherwise the platform class will degenerate very quickly into a dependence hub for all kinds of sub systems.
"
Class {
	#name : #OSPlatform,
	#superclass : #Object,
	#classVars : [
		'Current'
	],
	#category : #System-Platforms,
	#timestamp : 'michael.rueger 2/25/2009 18:29'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform class>>current [
	"Answer the current platform"
	^Current
]

{
	#category : #'system attributes',
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform class>>currentPlatformName [
	"Return the name of the platform we're running on"

	^ Smalltalk vm getSystemAttribute: 1001
]

{
	#category : #'system attributes',
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform class>>currentVersion [
	"Return the version number string of the platform we're running on"

	^ (Smalltalk vm getSystemAttribute: 1002) asString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform class>>determineActivePlatform [
	"Look for the matching platform class"
	^ self allSubclasses 
		detect: [ :any | any isActivePlatform ].

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform class>>initialize [
	"OSPlatform initialize"

	SessionManager default
		registerSystemClassNamed: self name
		atPriority: 50.	
	self startUp: true.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform class>>isActivePlatform [
	"Answer whether the receiver is the active platform"
	^false
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform class>>shutDown: isImageQuitting [
	"The system is going down"
	Current ifNotNil: [ Current shutDown: isImageQuitting ].

]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform class>>startUp: isImageStarting [
	"Determine the current platform."
	
	isImageStarting ifFalse: [  ^ self ].
	
	Current := self determineActivePlatform new.
	Current startUp: isImageStarting
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>current [
	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>family [
	"Returns a symbol specific to the platform family (MacOSX, Windows, Unix, RiscOS).
	This may need to be extended if there are new platforms added or significant differences within a platform family arise (as was the case between MacOS 9 and X)."

	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>isMacOS [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>isMacOSX [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>isUnix [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>isUnix32 [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>isUnix64 [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>isWin32 [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>isWin64 [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>isWindows [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>isX11 [
	^ self windowSystemName = 'X11'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>lineEnding [

	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>menuShortcutString [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>name [
	"Return the name of the platform we're running on"

	^ self class currentPlatformName
]

{
	#category : #compatbility,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>platformFamily [
	^ self family
]

{
	#category : #compatbility,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>platformName [
	^ self name
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>shutDown: quitting [
	"Pharo is shutting down. If this platform requires specific shutdown code, this is a great place to put it."

]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>startUp: resuming [
	"Pharo is starting up. If this platform requires specific intialization, this is a great place to put it."

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>subtype [
	"Return the subType of the platform we're running on"

	^ (Smalltalk vm getSystemAttribute: 1003)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>version [
	"Return the version number string of the platform we're running on"

	^ self class currentVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>virtualKey: virtualKeyCode [
	"Subclass responsibility to override if necessary"
	^nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
OSPlatform>>windowSystemName			 [
	"Return the name of the window system currently being used for display."

	^ Smalltalk vm getSystemAttribute: 1005
]
