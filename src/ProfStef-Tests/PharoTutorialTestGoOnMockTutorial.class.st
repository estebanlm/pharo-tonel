"
SUnit tests for tutorial navigation
"
Class {
	#name : #PharoTutorialTestGoOnMockTutorial,
	#superclass : #TestCase,
	#category : #ProfStef-Tests,
	#timestamp : 'TorstenBergmann 2/12/2014 22:52'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestGoOnMockTutorial>>setUp [
	ProfStef tutorial: MockTutorial lesson: #firstLesson 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestGoOnMockTutorial>>tearDown [
	ProfStef default close
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestGoOnMockTutorial>>testFirstLessonShouldBeDisplayed. [
 	self assert:  'First lesson' equals: ProfStef default lessonView text
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestGoOnMockTutorial>>testLastShouldGoToThirdLesson [
	ProfStef last.
 	self assert:  'Third lesson' equals: ProfStef default lessonView text
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestGoOnMockTutorial>>testLastThenFirstShouldGoToFirstLesson [
	ProfStef last; first.
 	self assert:  'First lesson' equals: ProfStef default lessonView text
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestGoOnMockTutorial>>testLastThenPreviousShouldGoToSecondLesson [
	ProfStef last; previous.
 	self assert:  'Second lesson' equals: ProfStef default lessonView text
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestGoOnMockTutorial>>testNextShouldGoToSecondLesson [
	ProfStef next.
 	self assert:  'Second lesson' equals: ProfStef default lessonView text
]
