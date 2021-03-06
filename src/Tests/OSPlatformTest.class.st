Class {
	#name : #OSPlatformTest,
	#superclass : #TestCase,
	#category : #Tests-System
}

{ #category : #testing }
OSPlatformTest >> testAPI [
	"A test to make sure the full API will work"
	Smalltalk os
		isMacOS;
		isMacOSX;
		isWin32;
		isWindows;
		isX11;
		name;
		subtype;
		family.
]

{ #category : #testing }
OSPlatformTest >> testStartUpList [
	"This test documents issue http://code.google.com/p/pharo/issues/detail?id=838"
	| startupList |
	
	startupList := (SessionManager default startupList collect: #handledId).
	
	self should: [ (startupList indexOf: #OSPlatform) < (startupList indexOf: #InputEventSensor) ]
]
