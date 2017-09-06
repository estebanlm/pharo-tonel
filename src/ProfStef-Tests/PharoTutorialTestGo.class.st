"
SUnit tests for tutorial navigation
"
Class {
	#name : #PharoTutorialTestGo,
	#superclass : #TestCase,
	#category : #ProfStef-Tests,
	#timestamp : 'TorstenBergmann 2/12/2014 22:52'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestGo>>tearDown [
	ProfStef default close
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestGo>>testGoOnMockTutorial [
	| displayedText expected |
	ProfStef goOn: MockTutorial.
	
	displayedText := ProfStef default lessonView text.
	expected := MockTutorial new firstLesson lesson.
 	self assert: displayedText equals: expected.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestGo>>testGoOpenSmalltalkSyntaxTutorial [
	| displayedText expected |
	ProfStef go.
	
	displayedText := ProfStef default lessonView text.
	expected := PharoSyntaxTutorial new welcome lesson.
 	self assert: displayedText equals: expected.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestGo>>testGoTwiceShowLessonViewIfNotVisible [
	| firstLessonView |
	ProfStef go.
	firstLessonView := ProfStef default lessonView.
	firstLessonView close.
	ProfStef goOn: PharoSyntaxTutorial.
	self assert:  (World systemWindows includes:  firstLessonView window).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoTutorialTestGo>>testGoTwiceUseSameLessonView [
	| firstLessonView |
	ProfStef go.
	firstLessonView := ProfStef default lessonView.
	ProfStef goOn: PharoSyntaxTutorial.
	self assert: (firstLessonView ==  ProfStef default lessonView).
]
