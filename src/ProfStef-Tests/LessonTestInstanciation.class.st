"
SUnit tests for lessons
"
Class {
	#name : #LessonTestInstanciation,
	#superclass : #TestCase,
	#category : #ProfStef-Tests,
	#timestamp : 'TorstenBergmann 2/12/2014 22:50'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
LessonTestInstanciation>>testNewLessonHaveEmptyStringForTitleLesson [
	| newLesson  |
	newLesson := Lesson new.
	self assert: newLesson title equals: ''.
	self assert: newLesson lesson equals: ''.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
LessonTestInstanciation>>testTitleLessonCreation [
	| firstLesson secondLesson |
	firstLesson := Lesson title: 'First lesson' lesson: 'Pharo rules!'.
	secondLesson := Lesson title: 'Second lesson' lesson: 'PharoTutorial is cool'.
	
	self assert: firstLesson title equals: 'First lesson'.
	self assert: firstLesson lesson equals: 'Pharo rules!'.
	
	self assert: secondLesson title equals: 'Second lesson'.
	self assert: secondLesson lesson equals: 'PharoTutorial is cool'.
]
