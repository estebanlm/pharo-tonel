"
SUnit tests for tutorial navigation
"
Class {
	#name : #PharoTutorialTestNavigation,
	#superclass : #TestCase,
	#instVars : [
		'prof',
		'mockView'
	],
	#category : #ProfStef-Tests,
	#timestamp : 'TorstenBergmann 2/12/2014 22:52'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestNavigation>>setUp [
	prof := ProfStef new.
	prof player: (
		TutorialPlayer new 
			tutorial: MockTutorial new; 
			yourself).
	mockView := MockLessonView new.
	prof lessonView: mockView.
	prof open.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestNavigation>>testNextOpenSecondLesson [
	prof next.
	self assert: mockView title equals: 'second (2/3)'.
	self assert: mockView lesson lesson equals: 'Second lesson'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestNavigation>>testSequenceNextNextOpenThirdLesson [
	prof next; next.
	self assert: mockView title equals: 'third (3/3)'.
	self assert: mockView lesson lesson equals: 'Third lesson'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestNavigation>>testSequenceNextNextPreviousOpenSecondLesson [
	prof next; next; previous.
	self assert: mockView title equals: 'second (2/3)'.
	self assert: mockView lesson lesson equals: 'Second lesson'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestNavigation>>testShowFirstLessonOnGo [
	| lesson |
	lesson := mockView lesson.
	self assert: lesson title equals: 'first'.
	self assert: lesson lesson equals: 'First lesson'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestNavigation>>testShowingLessonByIndex [
	prof tutorial: MockTutorial lessonAt: 2.
	self assert: mockView title equals: 'second (2/3)'.
	self assert: mockView lesson lesson equals: 'Second lesson'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestNavigation>>testShowingLessonBySelector [
	prof tutorial: MockTutorial lesson: #firstLesson.
	self assert: mockView title equals: 'first (1/3)'.
	self assert: mockView lesson lesson equals: 'First lesson'.
]
