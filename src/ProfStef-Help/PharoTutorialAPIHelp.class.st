"
I'm a PharoTutorial which builds a HelpSystem book by collecting comment from classes and method.
"
Class {
	#name : #PharoTutorialAPIHelp,
	#superclass : #PharoTutorialHelp,
	#category : #ProfStef-Help,
	#timestamp : 'CamilloBruni 2/22/2014 18:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialAPIHelp class>>bookName  [
	^ 'Reference'
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialAPIHelp class>>builder  [
	^ PackageAPIHelpBuilder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialAPIHelp class>>helpPackages [
	^ #('ProfStef-Core')
]
