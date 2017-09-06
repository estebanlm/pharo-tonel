"
A VersionnerRepositoriesManager allows to select / deselect  / add new repositories. The UI is shared with Komitter.
"
Class {
	#name : #VersionnerRepositoriesManager,
	#superclass : #Object,
	#instVars : [
		'remotesUI',
		'packageName'
	],
	#category : #Versionner-Spec-Browser,
	#timestamp : 'ChristopheDemarey 1/17/2014 16:28'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerRepositoriesManager class>>newWithPackage: aPackageName [
	| repoManager |
	
	repoManager := self new.
	aPackageName ifNotNil: [ repoManager 
								packageName: aPackageName;
								initializeSelectedRemotes;
								yourself ].
	^ repoManager
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerRepositoriesManager>>initialize [

	super initialize.
	remotesUI := RemotesManager new.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerRepositoriesManager>>initializeSelectedRemotes [
	| workingCopy |
	
	workingCopy := MCWorkingCopy allManagers detect: [ :wc | wc package name = packageName ].
	remotesUI selectedRemotes: workingCopy repositoryGroup repositories asOrderedCollection.
	remotesUI initializeWidgets.
	remotesUI initializePresenter

]

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerRepositoriesManager>>open [
	| dialog |
	dialog := remotesUI openDialogWithSpec.
	dialog okAction: [  ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerRepositoriesManager>>packageName: aString [
	packageName := aString
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerRepositoriesManager>>selectedChangedBlock: aBlock [
	remotesUI selectedChangedBlock: aBlock
]
