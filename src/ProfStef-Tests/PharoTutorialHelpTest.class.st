"
SUnit tests for PharoTutorialHelp
"
Class {
	#name : #PharoTutorialHelpTest,
	#superclass : #TestCase,
	#category : #ProfStef-Tests,
	#timestamp : 'CamilloBruni 2/22/2014 18:58'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialHelpTest>>testBookName [
	self assert: PharoTutorialHelp bookName isString
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialHelpTest>>testCreateATutorial [
	| helpTopic |
	helpTopic := PharoTutorialHelp createATutorial.
	self assert: helpTopic notNil.
	self assert: helpTopic class == HelpTopic.
	self assert: helpTopic title = 'Create a tutorial'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialHelpTest>>testIntroduction [
	| helpTopic |
	helpTopic := PharoTutorialHelp introduction.
	self assert: helpTopic notNil.
	self assert: helpTopic class == HelpTopic.
	self assert: helpTopic title = 'Introduction'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialHelpTest>>testListOfTutorials [
	| helpTopic |
	helpTopic  := PharoTutorialHelp listOfTutorials.
	self assert: (helpTopic notNil).
	self assert: (helpTopic title =  'List of tutorials'  )
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialHelpTest>>testPages [
	self assert: PharoTutorialHelp pages isCollection.
	self assert: (PharoTutorialHelp pages allSatisfy: #isSymbol).
]
