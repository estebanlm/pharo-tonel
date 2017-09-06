"
SUnit tests for tutorial player
"
Class {
	#name : #TutorialPlayerTestWithMockTutorial,
	#superclass : #TestCase,
	#instVars : [
		'player'
	],
	#category : #ProfStef-Tests,
	#timestamp : 'TorstenBergmann 2/12/2014 22:53'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:44'
}
TutorialPlayerTestWithMockTutorial>>setUp [
	| tutorial |
	tutorial := MockTutorial new.
	player := TutorialPlayer new tutorial: (MockTutorial new)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
TutorialPlayerTestWithMockTutorial>>testCurrentLessonIsFirstOneAtCreation [
	self assert: player currentLesson title equals: 'first'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
TutorialPlayerTestWithMockTutorial>>testNavigation [
	self assert: player next title equals: 'second'.
	self assert: player currentLesson title equals: 'second'.
	
	self assert: player next title equals: 'third'.
	self assert: player currentLesson title equals: 'third'.
	
	self assert: player next title equals: 'third'.
	self assert: player currentLesson title equals: 'third'.
	
	self assert: player previous title equals: 'second'.
	self assert: player currentLesson title equals: 'second'.
	
	self assert: player previous title equals: 'first'.
	self assert: player currentLesson title equals: 'first'.
	
	self assert: player previous title equals: 'first'.
	self assert: player currentLesson title equals: 'first'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
TutorialPlayerTestWithMockTutorial>>testResetTutorialGoBackToFirstLesson [
	player next; next.
	self assert: player currentLesson title equals: 'third'.
	
	player rewind.
	self assert: player currentLesson title equals: 'first'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
TutorialPlayerTestWithMockTutorial>>testSizeReturnsThree [
	self assert: player size equals: 3.
]
