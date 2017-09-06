"
SUnit tests for PharoTutorialHelpTutorialBuilder
"
Class {
	#name : #PharoTutorialHelpTutorialBuilderTest,
	#superclass : #TestCase,
	#category : #ProfStef-Tests,
	#timestamp : 'CamilloBruni 2/22/2014 18:58'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialHelpTutorialBuilderTest>>testBuild [
	| helpTopic tutorial |
	tutorial := PharoTutorialsHelp.
	helpTopic := PharoTutorialHelpTutorialBuilder buildHelpTopicFrom: tutorial.
	self assert: helpTopic notNil
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialHelpTutorialBuilderTest>>testInstantiation  [
	self should: [ PharoTutorialHelpTutorialBuilder new ] raise: Error
]
