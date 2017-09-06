"
Versionner configuration list toolBar spec definition.

"
Class {
	#name : #VersionnerToolBar,
	#superclass : #ComposableModel,
	#instVars : [
		'newButton',
		'loadButton',
		'openButton'
	],
	#category : #Versionner-Spec-Browser,
	#timestamp : '<historical>'
}

{
	#category : #spec,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerToolBar class>>defaultSpec [
	<spec>

	"Define the layout of the Versionner configuration list toolBar"
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #newButton;
				add: #loadButton;
				add: #openButton ];
	yourself.
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerToolBar class>>loadIcon [
	^ self iconNamed: #downIcon
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerToolBar class>>newIcon [
	^ self iconNamed: #packageAddIcon
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerToolBar class>>openIcon [
	^ self iconNamed: #openIcon
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerToolBar>>initializePresenter [
	"Initialize widgets behavior"

	newButton action: [ self newConfiguration ].
	loadButton action: [ (VSLoadProjectCommand target: self for: self) execute ].
	openButton action: [ owner configurationList selectedItem ifNotNil: [ :selection | 
				owner browseConfiguration: selection ]  ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerToolBar>>initializeWidgets [
	newButton := (self instantiate: ButtonModel)
		label: ' New project';
		icon: self class newIcon;
		help: 'Create a new project (configuration). Once created, double-click on the projet to edit it';
		yourself.
	
	loadButton := (self instantiate: ButtonModel)
		label: ' Load project';
		icon: self class loadIcon;
		help: 'Load an existing project (only its configuration) into the image';
		yourself.

	openButton := (self instantiate: ButtonModel)
		label: ' Open project';
		icon: self class openIcon;
		help: 'Open a new window on the selected project';
		yourself.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerToolBar>>loadButton [
	^ loadButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerToolBar>>newButton [
	^ newButton
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerToolBar>>newConfiguration [
	| name selection |
	name := UIManager default request: 'Name of the new project'.
	name isEmptyOrNil ifFalse: [ 
		Cursor execute showWhile:  [ | project |
			project := MTProject
				newNamed: name configurationBaseName
				withInitialVersion: '0.1'
				inRepository: nil.
			MCWorkingCopy forPackage: (MCPackage new name: project configurationClass name).
			selection :=  owner configurationList listItems 
					detect: [ :item | item name configurationBaseName = name configurationBaseName].
			owner configurationList setSelectedItem: selection.
			owner browseConfiguration: selection ]  ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerToolBar>>openButton [
	^ openButton
]
