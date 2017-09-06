"
General access to a webbrowser
"
Class {
	#name : #WebBrowser,
	#superclass : #Object,
	#category : #WebBrowser-Core-Base,
	#timestamp : 'TorstenBergmann 4/13/2016 08:25'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
WebBrowser class>>example [

	self openOn: 'http://www.pharo.org'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:19'
}
WebBrowser class>>isForCurrentSystem [

	^self subclassResponsibility 
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:19'
}
WebBrowser class>>openOn: aURLString [
	"Open the webbrowser on the given URL"
	
	^self webbrowserClassForPlatform openOn: aURLString	

]

{
	#category : #'private - accessing',
	#timestamp : ' 8/31/2017 05:26:19'
}
WebBrowser class>>webbrowserClassForPlatform [

  ^ self allSubclasses detect: #isForCurrentSystem ifNone: [ self error: 'No web browser subclass for platform provided' ]
]
