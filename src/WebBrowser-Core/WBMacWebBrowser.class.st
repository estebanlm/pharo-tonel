"
Access to the web browser on Mac
"
Class {
	#name : #WBMacWebBrowser,
	#superclass : #WebBrowser,
	#category : #WebBrowser-Core-OS-Mac,
	#timestamp : 'TorstenBergmann 4/13/2016 08:24'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:19'
}
WBMacWebBrowser class>>example [

	self openOn: 'http://www.pharo.org'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:19'
}
WBMacWebBrowser class>>isForCurrentSystem [

	^Smalltalk os isMacOS 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
WBMacWebBrowser class>>openOn: anURLString [
	"
	self openOn: 'http://www.pharo.org'
	"
	| openCommand |
	openCommand := 'open "{1}"' format: { anURLString }.
	self system: openCommand.
]

{
	#category : #'private - uffi',
	#timestamp : ' 8/31/2017 05:26:19'
}
WBMacWebBrowser class>>system: command [

	^LibC system: command 
]
