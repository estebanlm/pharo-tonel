"
i am the root of keyboard events hierarchy.

The scan code represents an unique number identifying a key and comes directly from OS.
Some keys can be directly translated to corresponding character(s) by OS and thus such events will carry character ~= nil.  Character translation is not reliable with this event because many characters are introduced by using multiples key strokes. For a reliable way for getting text input, it is better to listen for the OSTextInputEvent.

character - An character representation of the key.
modifiers - Extra flags telling if special keys such as ctrl, alt, cmd, etc are being held.
position - The position of the mouse cursor when the key was pressed.
scanCode - Raw keyboard scan scode.
repeat - This value is non-zero if this event was originated by a repeated key stroke.
symbol - A virtual platform independent identifier for a keyboard key. Valid values are defined in the OSKeySymbols pool dictionary.
"
Class {
	#name : #OSKeyboardEvent,
	#superclass : #OSEvent,
	#instVars : [
		'scanCode',
		'symbol',
		'character',
		'modifiers',
		'position',
		'repeat'
	],
	#category : #OSWindow-Core-Events,
	#timestamp : 'RonieSalgado 9/28/2016 22:54'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyboardEvent>>character [
	
	^ character
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyboardEvent>>character: anObject [
	
	character := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyboardEvent>>characterCode [
	"answer the unicode value"
	
	^ character ifNil: [0] ifNotNil: [ character charCode ] 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyboardEvent>>initialize [
	super initialize.
	modifiers := OSStateModifiers new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyboardEvent>>modifiers [
	
	^ modifiers
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyboardEvent>>position [
	
	^ position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyboardEvent>>position: anObject [
	
	position := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyboardEvent>>printOn: stream [
	super printOn: stream.
	stream space; nextPutAll: 'scanCode: '; print: scanCode.
	stream space; nextPutAll: 'symbol '; print: symbol.
	stream space; nextPutAll: 'character '; print: character.
	stream space; nextPutAll: 'modifiers: '; print: modifiers.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyboardEvent>>repeat [
	^ repeat
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyboardEvent>>repeat: anObject [
	repeat := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyboardEvent>>scanCode [
	
	^ scanCode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyboardEvent>>scanCode: anObject [
	
	scanCode := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyboardEvent>>symbol [
	
	^ symbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyboardEvent>>symbol: anObject [
	
	symbol := anObject
]
