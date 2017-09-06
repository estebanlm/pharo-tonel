"
I can navigate through an AbstractTutorial subclass. With #next and #previous you can go forward and backward through the tutorial. 
"
Class {
	#name : #TutorialPlayer,
	#superclass : #Object,
	#instVars : [
		'tutorialPosition',
		'tutorial'
	],
	#category : #ProfStef-Core,
	#timestamp : 'LaurentLaffont 1/21/2010 20:34'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
TutorialPlayer>>currentLesson [
	^ self tutorial lessonAt: self tutorialPosition.
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 05:26:23'
}
TutorialPlayer>>first [
	self rewind.
	^ self currentLesson
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 05:26:23'
}
TutorialPlayer>>last [
	tutorialPosition := self size.
	^ self currentLesson
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 05:26:23'
}
TutorialPlayer>>next [
	self tutorialPosition < self size
		ifTrue: [tutorialPosition := tutorialPosition + 1].
	^ self currentLesson
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 05:26:23'
}
TutorialPlayer>>previous [
	tutorialPosition >  1 ifTrue: [tutorialPosition := tutorialPosition  - 1].
	^ self currentLesson
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 05:26:23'
}
TutorialPlayer>>rewind [
	tutorialPosition := 1.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
TutorialPlayer>>size [
	^ self tutorial size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
TutorialPlayer>>tutorial [
	^ tutorial  ifNil: [tutorial := PharoSyntaxTutorial new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
TutorialPlayer>>tutorial: aTutorial [
	tutorial := aTutorial
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
TutorialPlayer>>tutorialPosition  [
	^ tutorialPosition  ifNil: [
		self rewind.
		tutorialPosition.
	].
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
TutorialPlayer>>tutorialPosition: aTutorialPosition  [
	tutorialPosition := aTutorialPosition 
	
]
