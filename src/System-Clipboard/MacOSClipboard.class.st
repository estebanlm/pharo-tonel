"
The clipboard for MacOS
"
Class {
	#name : #MacOSClipboard,
	#superclass : #ExternalClipboard,
	#category : #System-Clipboard,
	#timestamp : 'TorstenBergmann 1/31/2014 10:28'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
MacOSClipboard>>addUF8StringClipboardData: aString [
	| ba  |

	self clearClipboard.
	ba := aString convertToWithConverter: (UTF8TextConverter new).
	self addClipboardData: ba dataFormat: 'public.utf8-plain-text'

]
