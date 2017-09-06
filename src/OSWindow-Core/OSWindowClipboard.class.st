"
This is a private class for handling clipboard text. There's no direct use of it.
For setting/retrieving clipboard text, use clipboardText/clipboardText: accessors of OSWindow instances.
"
Class {
	#name : #OSWindowClipboard,
	#superclass : #Clipboard,
	#category : #OSWindow-Core,
	#timestamp : 'IgorStasenko 7/30/2014 16:20'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowClipboard>>chooseRecentClipping [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowClipboard>>clipboardText [
	^ World osWindow clipboardText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowClipboard>>clipboardText: aString [
	World osWindow clipboardText: aString asString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowClipboard>>noteRecentClipping: text [

]
