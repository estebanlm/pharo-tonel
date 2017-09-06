"
Tests for HowToMakeYourOwnTutorial
"
Class {
	#name : #HowToMakeYourOwnTutorialTest,
	#superclass : #TestCase,
	#traits : 'TTutorialTest',
	#classTraits : 'TTutorialTest classTrait',
	#category : #ProfStef-Tests,
	#timestamp : 'TorstenBergmann 2/12/2014 22:50'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
HowToMakeYourOwnTutorialTest>>testEachSelectorExists [
	self testedTutorial tutorial do: [:aSelector|
		self assert: (self testedTutorial respondsTo: aSelector) 
	]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
HowToMakeYourOwnTutorialTest>>testedTutorial [
	"Returns an instance of an AbstractTutorial subclass"
	^ HowToMakeYourOwnTutorial new
]
