"
I am an user interface used to link mcpackages and remotes

PackageRemotesManager new openWithSpec
"
Class {
	#name : #PackageRemotesManager,
	#superclass : #ComposableModel,
	#instVars : [
		'packages',
		'remotes',
		'silent'
	],
	#category : #Komitter-Support,
	#timestamp : 'ChristopheDemarey 1/8/2014 16:53'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager class>>defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed
		newRow: [ :row |
			row
				add: #packages;
				addSplitter;
				add: #remotes
		];
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>change: selected forRemote: remote [
	| selectedPackage group |
	
	selectedPackage := packages selectedItem.
	selectedPackage ifNil: [ ^ self ].
	
	group := selectedPackage content repositoryGroup.
	
	selected
		ifTrue: [ group addRepository: remote ]
		ifFalse: [ group removeRepository: remote ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>doIfNotSilent: aBlock [

	silent ifTrue: [ ^ self ].
	aBlock value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>initialExtent [

	^  700@460
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>initialize [

	super initialize.
	silent := false.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>initializeDialogWindow: aWindow [

	aWindow
		toolbar: OkToolbar new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>initializePresenter [

	packages whenSelectedItemChanged: [ :item |	self updateRemoteSelectionFrom: item ].
		
	packages whenRootsChanged: [ :nodes | 
		nodes ifNotEmpty: [ nodes first takeHighlight ] ].
	
	remotes selectedChangedBlock: [:remote :selected | 
		self doIfNotSilent: [ self change: selected forRemote: remote ]].
	
	self whenBuiltDo: [ | nodes |
		nodes := packages roots.
		nodes ifNotEmpty: [
			packages selectedItem: (
			nodes first 
				selected: true;
				takeHighlight;
				yourself ) ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>initializeWidgets [

	packages := self instantiate: SearchableTree.
	remotes := self instantiate: RemotesManager.

	packages displayBlock: [ :each | each packageName ].
	
	remotes selectedRemotes: self selectedPackageRepositories.
		
	self focusOrder
		add: packages;
		add: remotes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>packages [

	^ packages
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>packages: mcPackages [

	packages roots: mcPackages
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>remotes [

	^ remotes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>remotesTree [

	^ remotes remotes
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>selectedPackageRepositories [

	^ packages selectedItem
		ifNil: [ #() ]
		ifNotNil: [ :item | item content repositoryGroup repositories ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>silentWhile: aBlock [
	| oldSilent |
	
	oldSilent := silent.
	silent := true.
	aBlock ensure: [ silent := oldSilent ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>title [

	^ 'Remotes manager'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageRemotesManager>>updateRemoteSelectionFrom: aPackage [
	| repositories |
	
	aPackage 
		ifNil: [ repositories := #() ]
		ifNotNil: [ repositories := aPackage repositoryGroup repositories ].

	self remotesTree roots do: [ :node |
		self silentWhile: [ 
			node selected: (repositories includes: node content remote) ] ]
]
