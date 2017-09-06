"
SUnit tests for the help browser
"
Class {
	#name : #HelpBrowserTest,
	#superclass : #TestCase,
	#category : #HelpSystem-Tests-Core-UI,
	#timestamp : 'TorstenBergmann 2/4/2014 21:18'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
HelpBrowserTest>>defaultTestClass [
	^HelpBrowser
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:43'
}
HelpBrowserTest>>testDefaultHelpBrowser [
	
	| current replacement instance |
	current := self defaultTestClass defaultHelpBrowser.
	replacement := AdvancedHelpBrowserDummy.
	[
	  self defaultTestClass defaultHelpBrowser: replacement.
	  self assert: self defaultTestClass defaultHelpBrowser == replacement.
 
	  instance := self defaultTestClass open.
	  self assert: instance rootTopic notNil.
	  self assert: instance isOpen.
	] ensure: [ self defaultTestClass defaultHelpBrowser: current ]
	 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:43'
}
HelpBrowserTest>>testDefaultHelpBrowserIsReplacable [
	
	| current replacement instance |
	"save the one that is registered"
	current := self defaultTestClass defaultHelpBrowser.
	replacement := AdvancedHelpBrowserDummy.
	[
	  self defaultTestClass defaultHelpBrowser: replacement.
	  self assert: self defaultTestClass defaultHelpBrowser == replacement.	  
	  instance := self defaultTestClass open.
	  
	] ensure: [
		self defaultTestClass defaultHelpBrowser: current
	]
	 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:43'
}
HelpBrowserTest>>testLazyDefaultHelpBrowser [
	
	self assert: self defaultTestClass defaultHelpBrowser notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:43'
}
HelpBrowserTest>>testOpen [
	|browser|
	browser := self defaultTestClass open.
	World doOneCycleNow. 
	browser close 


		
]
