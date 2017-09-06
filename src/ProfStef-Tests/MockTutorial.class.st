"
Mocking a tutorial for test purposes
"
Class {
	#name : #MockTutorial,
	#superclass : #AbstractTutorial,
	#category : #ProfStef-Tests,
	#timestamp : 'TorstenBergmann 2/12/2014 22:49'
}

{
	#category : #lesson,
	#timestamp : ' 8/31/2017 05:26:44'
}
MockTutorial>>firstLesson [
	^ Lesson title: 'first' lesson: 'First lesson'.
]

{
	#category : #lesson,
	#timestamp : ' 8/31/2017 05:26:44'
}
MockTutorial>>secondLesson [
	^ Lesson title: 'second' lesson: 'Second lesson'.
]

{
	#category : #lesson,
	#timestamp : ' 8/31/2017 05:26:44'
}
MockTutorial>>thirdLesson [
	^ Lesson title: 'third' lesson: 'Third lesson'.
]

{
	#category : #tutorial,
	#timestamp : ' 8/31/2017 05:26:44'
}
MockTutorial>>tutorial  [
	^ #(
firstLesson
secondLesson
thirdLesson
)
]
