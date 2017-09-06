"
I'm a HelpSystem book which list all Pharo tutorials
"
Class {
	#name : #PharoTutorialsHelp,
	#superclass : #PharoTutorialHelp,
	#category : #ProfStef-Help,
	#timestamp : 'CamilloBruni 2/22/2014 18:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialsHelp class>>bookName  [
	^ 'Browse tutorials'
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialsHelp class>>builder [
	^ PharoTutorialHelpTutorialBuilder
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:23'
}
PharoTutorialsHelp class>>menuCommandOn: aBuilder  [
	<worldMenu> 
	(aBuilder item: #'Pharo Tutorials')
			parent: #Help;
			order: 2.0;
			action:[ HelpBrowser openOn: self ]; 
			icon: ((self iconNamed: #pharoIcon) scaledToSize: 16@16);
			help: 'Browse and create Pharo tutorials'.
]
