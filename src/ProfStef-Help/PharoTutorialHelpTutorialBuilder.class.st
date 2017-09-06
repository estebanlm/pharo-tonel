"
I build HelpSystem topics to browse PharoTutorial tutorials
"
Class {
	#name : #PharoTutorialHelpTutorialBuilder,
	#superclass : #HelpBuilder,
	#category : #ProfStef-Help,
	#timestamp : 'CamilloBruni 2/22/2014 18:59'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialHelpTutorialBuilder class>>new [
	"We prohibid new"
	^ (self class lookupSelector: #buildHelpTopicFrom:)  == thisContext sender method  
		ifFalse:[self error: 'Please use buildHelpTopicFrom: instead']
		ifTrue: [super new]
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialHelpTutorialBuilder>>build [
	topicToBuild := HelpTopic named: rootToBuildFrom bookName.
	
	AbstractTutorial tutorials do: [:aTutorial| 
		topicToBuild addSubtopic: (self buildTutorialTopicFor: aTutorial)
	].

	^ topicToBuild.
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialHelpTutorialBuilder>>buildTutorialTopicFor: aTutorial [
	|tutorialTopic|
	tutorialTopic := HelpTopic named: aTutorial title.	
	
	aTutorial new lessons do:[:aLesson|
		tutorialTopic addSubtopic: (HelpTopic 
									title: aLesson title 
									contents:  aLesson lesson)
	].

	^ tutorialTopic 
]
