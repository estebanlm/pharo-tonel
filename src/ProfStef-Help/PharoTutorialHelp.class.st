"
HelpSystem book documenting PharoTutorial
"
Class {
	#name : #PharoTutorialHelp,
	#superclass : #CustomHelp,
	#category : #ProfStef-Help,
	#timestamp : 'CamilloBruni 2/22/2014 18:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialHelp class>>bookName  [
	^ 'Pharo Tutorial'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialHelp class>>canHaveSyntaxHighlighting [
	^ true 
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialHelp class>>createATutorial [
	^ HelpTopic 
		title: 'Create a tutorial'
		contents: 'See AbstractTutorial comment: ', AbstractTutorial comment.
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialHelp class>>introduction [
	^ HelpTopic 
		title: 'Introduction'
		contents: 'PharoTutorial is a framework to create interactive tutorials'.
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialHelp class>>listOfTutorials [
	^ HelpTopic title: 'List of tutorials' contents: AbstractTutorial contentsOfTutorials
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialHelp class>>pages [
	^ #(introduction listOfTutorials createATutorial)
]
