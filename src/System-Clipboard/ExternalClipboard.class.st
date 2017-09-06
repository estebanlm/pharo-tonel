"
An ExternalClipboard is the abstract superclass for the platform specific clipboards based on the clipboard plugin (former ExtendedClipboardInterface originally developed for Sophie).

Instance Variables
	clipboard:		SmallInteger

clipboard
	- handle for the external clipboard. If 0 the external clipboard is invalid

"
Class {
	#name : #ExternalClipboard,
	#superclass : #Clipboard,
	#instVars : [
		'clipboard'
	],
	#category : #System-Clipboard,
	#timestamp : 'michael.rueger 3/2/2009 13:25'
}

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalClipboard>>addClipboardData: data dataFormat: aFormat [
	clipboard = 0 ifTrue: 
		[Clipboard clipboardText: data asString.	
		^self].
	self primAddClipboardData: clipboard data: data dataFormat: aFormat
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalClipboard>>clearClipboard [
	clipboard = 0 ifTrue: [^self].
	^ self primClearClipboard: clipboard.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalClipboard>>clipboardText [
	"Return the text currently in the clipboard. If the system clipboard is empty, or if it differs from the Smalltalk clipboard text, use the Smalltalk clipboard. This is done since (a) the Mac clipboard gives up on very large chunks of text and (b) since not all platforms support the notion of a clipboard."

	| decodedString bytes |
	clipboard = 0 ifTrue: 
		[^super clipboardText].
	bytes := self primReadClipboardData: clipboard format: 'public.utf8-plain-text'.
	bytes
		ifNil: [^super clipboardText].
	decodedString := bytes asString convertFromWithConverter: UTF8TextConverter new.
	decodedString := decodedString replaceAll: 10 asCharacter with: 13 asCharacter.
	^decodedString = contents asString
		ifTrue: [contents]
		ifFalse: [decodedString asText].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalClipboard>>clipboardText: text  [

	| string data |
	string := text asString.
	self noteRecentClipping: text asText copyWithoutExternalReferences.
	contents := text asText copyWithoutExternalReferences.
	data := (string convertToWithConverter: UTF8TextConverter new) asByteArray.
	clipboard = 0 ifTrue: 
		[^super clipboardText: text].
	self clearClipboard.
	self primAddClipboardData: clipboard data: data dataFormat: 'public.utf8-plain-text'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalClipboard>>createClipboard [
	clipboard = 0 ifTrue: [^self].
	^ self primCreateClipboard.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalClipboard>>initialize [
	super initialize.
	clipboard := [self createClipboard] on: Error do: [:ex | clipboard := 0]
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalClipboard>>primAddClipboardData: aClipboard data: data dataFormat: aFormat [

	<primitive:'ioAddClipboardData' module: 'ClipboardExtendedPlugin'>
	^ self primitiveFailed
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalClipboard>>primClearClipboard:  aClipboard [
	<primitive:'ioClearClipboard' module: 'ClipboardExtendedPlugin'>
	^ self primitiveFailed.

]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalClipboard>>primCreateClipboard [
	<primitive:'ioCreateClipboard' module: 'ClipboardExtendedPlugin'>
	^ self primitiveFailed.

]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalClipboard>>primGetClipboardFormat: aClipboard formatNumber: formatNumber [

	<primitive:'ioGetClipboardFormat' module: 'ClipboardExtendedPlugin'>
	^ self primitiveFailed
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalClipboard>>primReadClipboardData: aClipboard format: format [

	<primitive:'ioReadClipboardData' module: 'ClipboardExtendedPlugin'>
	^ self primitiveFailed
]
