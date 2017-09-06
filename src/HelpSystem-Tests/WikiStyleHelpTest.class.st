"
SUnit tests for WikiStyleHelp
"
Class {
	#name : #WikiStyleHelpTest,
	#superclass : #TestCase,
	#category : #HelpSystem-Tests-Core-Utilities,
	#timestamp : 'TorstenBergmann 2/4/2014 21:20'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:43'
}
WikiStyleHelpTest>>testOpenBrowserOnThisHelpType [
	| browser |
	browser := HelpBrowser openOn: WikiStyleHelp.
	World doOneCycleNow.
	browser close
]
