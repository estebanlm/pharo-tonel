"
Versionner toolbar spec definition.

"
Class {
	#name : #VersionnerProjectToolBar,
	#superclass : #ComposableModel,
	#instVars : [
		'browser',
		'updateButton',
		'releaseButton',
		'commitButton'
	],
	#category : #Versionner-Spec-Browser,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerProjectToolBar class>>defaultSpec [
	<spec>

	"Define the layout of the Versionner ToolBar"
	^ SpecLayout composed
		newRow: [ :r | r
					add: #updateButton;
					add: #releaseButton;
					add: #commitButton ];
		yourself.
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerProjectToolBar class>>title [
	^ 'Versionner Project Browser ToolBar'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerProjectToolBar>>browser [
	^ browser.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerProjectToolBar>>browser: aSpecBrowser [
	browser := aSpecBrowser.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerProjectToolBar>>commitButton [
	^ commitButton.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerProjectToolBar>>executeWithDevWorkflow: aCommandClass [
	browser projectPanel project
		ifNotNil: [ :project | | cmd |
			 cmd := aCommandClass 
						target: project	devWorkflow
						for: self.
			[ cmd executeWithDevWorkflow: project devWorkflow ]
				on: MetacelloValidationFailure 
				do: [ :error | (VSConfigurationValidationIssuesDisplayCommand target: error for: self) execute] ].
	browser refreshConfiguration.
	browser selectDevelopmentVersion.
	browser update
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerProjectToolBar>>initializePresenter [
	"Initialize widgets behavior"

	updateButton action: [  self browser hasChanges 
								ifTrue: [ self executeWithDevWorkflow: VSUpdateDevelopmentVersionCommand ]
								ifFalse: [ UIManager default inform: 'Nothing to save' ] ].
	
	releaseButton action: [ self browser ignoreUnsavedChangesOnDevelopmentIfAny
								ifTrue: [ self executeWithDevWorkflow: VSReleaseDevelopmentVersionCommand ] ].
	
	commitButton action: [ (VSSaveProjectCommand target: browser project for: self) execute ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerProjectToolBar>>initializeWidgets [
	updateButton := (self instantiate: ButtonModel)
		label: ' Save to development';
		icon: (self iconNamed: #smallSaveIcon);
		help: 'Save the current modifications into the development baseline. It will save your changes into the Configuration class but will not save your code in the Version Control System. To publish your changes, use the commit button.';
		yourself.

	releaseButton := (self instantiate: ButtonModel)
		label: ' Release version';
		icon: (self iconNamed: #smallPublishIcon);
		help: 'Make a release. It will create a version method for this release and a new development baseline. It will save your changes into the Configuration class but will not save your code in the Version Control System. To publish your changes, use the commit button.';
		enabled: false;
		yourself.
	
	commitButton := (self instantiate: ButtonModel)
		label: ' Commit the project';
		icon: (self iconNamed: #monticelloPackageIcon);
		help: 'Commit the configuration and all dirty packages of the project to the main repository of your Version Control system (e.g. Monticello, git)';
		yourself.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerProjectToolBar>>releaseButton [
	^ releaseButton.
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerProjectToolBar>>releaseEnabled: aBoolean [
	releaseButton enabled: aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerProjectToolBar>>updateButton [
	^ updateButton.
]
