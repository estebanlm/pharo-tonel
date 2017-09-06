"
I am widget for selecting environments.
"
Class {
	#name : #EnvironmentChooser,
	#superclass : #ComposableModel,
	#instVars : [
		'enableGlobal',
		'enableCustom',
		'labelView',
		'environmentsView',
		'environmentsHolder',
		'environmentHolder'
	],
	#category : #NautilusRefactoring-Utilities,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser class>>defaultSpec [
	<spec>
	
	^ SpecLayout composed
		newRow: [ :r| 
			r 
				add: #labelView width: 45; 
				add: #environmentsView ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>chooseNewEnvironment [
	| packagesAndClasses packages classes packageEnvironment classEnvironment |
	
	packagesAndClasses := PackageAndClassChooser new chooseModalTo: self window.
	(packagesAndClasses isNil or: [ packagesAndClasses isEmpty])
		ifTrue: [ ^ nil ].
	
	self flag: 'TODO create proper environments in a less ugly way'.
	packages := OrderedCollection new.
	classes := OrderedCollection new.
	
	packagesAndClasses do: [ :each |
		(each isKindOf: RPackage)
			ifTrue: [ packages add: each ]
			ifFalse: [ classes add: each ]].
		
	packageEnvironment := RBPackageEnvironment packages: packages.
	classEnvironment := RBClassEnvironment classes: classes.
	
	classes ifEmpty: [ ^ packageEnvironment ].
	packages ifEmpty: [ ^ classEnvironment ].
	^ packageEnvironment | classEnvironment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>enableCustom [
	^ enableCustom value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>enableCustom: aBoolean [
	^ enableCustom value: aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>enableGlobal [
	^ enableGlobal value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>enableGlobal: aBoolean [
	^ enableGlobal value: aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>environment [
	^ environmentHolder value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>environment: anEnvironment [
	self environment = anEnvironment 
		ifFalse: [ environmentHolder value: anEnvironment ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>environments [
	^ environmentsHolder value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>environments: aCollection [
	environmentsHolder value: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>environmentsView [
	^ environmentsView ifNil: [ 
		environmentsView := self instantiate: DropListModel. ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>initialize [
	enableCustom := true asValueHolder.
	enableGlobal := true asValueHolder.
	environmentsHolder := #() asValueHolder.
	environmentHolder := nil asValueHolder.
	super initialize.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>initializeWidgets [
	environmentsHolder whenChangedDo: [ self update ].
	enableCustom whenChangedDo: [ self update ].
	enableGlobal whenChangedDo: [ self update ].
	self update.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>label [
	^ self labelView label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>label: aString [
	self labelView label: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>labelView [
	^ labelView ifNil: [ 
		labelView := self instantiate: LabelModel.
		labelView label: 'Environment:' ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>update [
	self environmentsView
		emptyList.
		
	self enableGlobal ifTrue: [ 
		self environmentsView addItemLabeled: 'System-wide' do: [ 
			self environment: RBBrowserEnvironment new ]].
	
	self environments do: [ :environemnt| |capturedValue|
		capturedValue := environemnt.
		self environmentsView
			addItemLabeled: capturedValue label
			do: [ self environment: capturedValue ]].
	
	self enableCustom ifTrue: [ 
		self environmentsView addItemLabeled: 'Custom...' do: [
			self chooseNewEnvironment ifNotNil: [ :newEnvironment | 
				self environment: newEnvironment ]]].
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:27'
}
EnvironmentChooser>>whenEnvironmentChanged: aBlock [
	environmentHolder whenChangedDo: aBlock
]
