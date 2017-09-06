"
WorkingCopyToolBar new openWithSpec
"
Class {
	#name : #WorkingCopyToolBar,
	#superclass : #ComposableModel,
	#instVars : [
		'browseButton',
		'configButton',
		'packageButton',
		'sliceButton'
	],
	#category : #Spec-Tools-Monticello,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
WorkingCopyToolBar class>>defaultSpec  [

	^ {#ContainerModel.
			#add: . {{#model . #packageButton.} . #layout: .  #(FrameLayout
										rightFraction: 0.25
										bottomFraction: 0
										bottomOffset: 25)} . 

			#add: . {{#model . #configButton.} .
						#layout: . #(FrameLayout
										leftFraction: 0.25
										rightFraction: 0.5
										bottomFraction: 0
										bottomOffset: 25) } .
											
			#add: . {{#model . #sliceButton.} .
						#layout: . #(FrameLayout
										leftFraction: 0.5
										rightFraction: 0.75
										bottomFraction: 0
										bottomOffset: 25) } .											

			#add: . {{#model . #browseButton.} .
						#layout: . #(FrameLayout
										leftFraction: 0.75
										bottomFraction: 0
										bottomOffset: 25)} 	
		}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
WorkingCopyToolBar>>browseButton [
	^ browseButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
WorkingCopyToolBar>>configButton [
	
	^ configButton
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
WorkingCopyToolBar>>createPackage [
	| name |
	name := UIManager default request: 'Name of package:'.
	name isEmptyOrNil
		ifTrue: [ ^ self ].
	RPackageOrganizer default registerPackageNamed: name.
	MCWorkingCopy forPackage: (MCPackage new name: name)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
WorkingCopyToolBar>>initializeWidgets [

	browseButton := self newButton.
	configButton := self newButton.
	packageButton := self newButton.
		
	self setBrowseButton.
	self setConfigButton.
	self setPackageButton.
	self setSliceButton.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
WorkingCopyToolBar>>packageButton [

	^ packageButton
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
WorkingCopyToolBar>>setBrowseButton [

	browseButton
		state: false;
		enabled: false;
		label: 'Browse';
		help: 'Browse the working copy of the selected package';
		action: [ self browseWorkingCopy ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
WorkingCopyToolBar>>setConfigButton [

	configButton
		state: false;
		label: '+Config';
		help: 'Add a new metacello configuration';
		action: [ self createConfiguration ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
WorkingCopyToolBar>>setPackageButton [

	packageButton
		state: false;
		label: '+Package';
		help: 'Add a new package and make it the working copy';
		action: [ self createPackage ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
WorkingCopyToolBar>>setSliceButton [
	sliceButton := self instantiate: ButtonModel.
	sliceButton
		state: false;
		label: '+Slice';
		help: 'Add a slice to cleaning and nicely propose a bug fix';
		action: [ self createSlice ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
WorkingCopyToolBar>>sliceButton [
	
	^ sliceButton
]
