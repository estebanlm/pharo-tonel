"
Access to the web browser on Unix
"
Class {
	#name : #WBUnixWebBrowser,
	#superclass : #WebBrowser,
	#category : #WebBrowser-Core-OS-Unix,
	#timestamp : 'TorstenBergmann 4/13/2016 08:24'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:19'
}
WBUnixWebBrowser class>>example [

	self openOn: 'http://www.pharo.org'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:19'
}
WBUnixWebBrowser class>>isForCurrentSystem [

	^Smalltalk os isUnix  
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
WBUnixWebBrowser class>>openOn: anURLString [
	"
	self openOn: 'http://www.pharo.org'
	"
	| openCommand |
	openCommand := 'xdg-open {1} &' format: { anURLString }.
	self system: openCommand.
]

{
	#category : #'private - uffi',
	#timestamp : ' 8/31/2017 05:26:19'
}
WBUnixWebBrowser class>>system: command [

	^LibC system: command 
]
