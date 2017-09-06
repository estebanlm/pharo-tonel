"
I am a morph that prints the keys in the keyboard events.

KeyPrinterMorph new openInWorld
"
Class {
	#name : #KeyPrinterMorph,
	#superclass : #Morph,
	#category : #Tools-Debugger,
	#timestamp : '<historical>'
}

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:26'
}
KeyPrinterMorph>>handlesKeyboard: evt [
	^ true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:26'
}
KeyPrinterMorph>>handlesMouseDown: evt [
	^ true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:26'
}
KeyPrinterMorph>>keyDown: anEvent [
	UIManager default inform: anEvent key asString.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:26'
}
KeyPrinterMorph>>mouseDown: event  [
	super mouseDown: event.
	World activeHand newKeyboardFocus: self
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:26'
}
KeyPrinterMorph>>openInWorld [
	self  openInWindowLabeled: 'KeyPrinter'
]
