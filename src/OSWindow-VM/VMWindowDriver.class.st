"
This driver using a legacy VM functionality which will be removed in future versions,
because it is limited only to a single OS Window, and furthermore, image don't have a direct control over window creation/destruction neither controlling its various attributes and event delivery and handling mechanisms.

This driver is used by image, when it detects there's no other more suitable driver(s) available on currently running platform.
"
Class {
	#name : #VMWindowDriver,
	#superclass : #OSWindowDriver,
	#category : #OSWindow-VM,
	#timestamp : 'IgorStasenko 7/30/2014 17:55'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
VMWindowDriver class>>isSuitable [
	"It is never suitable, because we wanna get rid of it"
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
VMWindowDriver class>>isSupported  [
	^ self primitiveScreenDepth notNil
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:40'
}
VMWindowDriver class>>primitiveScreenDepth [
	<primitive: #primitiveScreenDepth>
	^ nil 
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
VMWindowDriver>>createWindowWithAttributes: attributes osWindow: osWindow [
	^ OSVMWindowHandle new initWithAttributes: attributes; osWindow: osWindow; yourself
]
