"
SUnit tests for class CustomHelp

"
Class {
	#name : #CustomHelpTest,
	#superclass : #TestCase,
	#category : #HelpSystem-Tests-Core-Utilities,
	#timestamp : 'TorstenBergmann 2/4/2014 21:18'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:43'
}
CustomHelpTest>>testOpenBrowserOnThisHelpType [
	| browser |
	browser := HelpBrowser openOn: CustomHelp.
	World doOneCycleNow.
	browser close
]
