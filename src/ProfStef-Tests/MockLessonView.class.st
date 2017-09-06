"
A LessonView mock for testing purposes
"
Class {
	#name : #MockLessonView,
	#superclass : #Object,
	#instVars : [
		'lesson',
		'title'
	],
	#category : #ProfStef-Tests,
	#timestamp : 'TorstenBergmann 2/12/2014 22:48'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
MockLessonView>>isOpenInWindow [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
MockLessonView>>lesson [
	^ lesson
]

{
	#category : #gui,
	#timestamp : ' 8/31/2017 05:26:44'
}
MockLessonView>>showLesson: aLesson withTitle: aString [
	lesson := aLesson.
	title := aString.
]

{
	#category : #gui,
	#timestamp : ' 8/31/2017 05:26:44'
}
MockLessonView>>showTutorialNode: aTutorialNode [
	lesson:= aTutorialNode lessonInstance.
	title := aTutorialNode title.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
MockLessonView>>title [
	^ title
]
