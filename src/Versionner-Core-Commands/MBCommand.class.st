"
MBCommand is a command design pattern for capturing actions.
"
Class {
	#name : #MBCommand,
	#superclass : #Object,
	#instVars : [
		'target',
		'targetNode',
		'requestor'
	],
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand class>>isMorphicCommand [

	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand class>>isOBCommand [

	^true
]

{
	#category : #util,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand class>>newCommand [
	" 
	MBCommand newCommand
	"
	| command baseName newCommandName receiverClassIndex clss title documentation |
	baseName :=  self uiManager request: 'Enter the base name (''MB'' and ''Command'' will be automatically added'.
	baseName ifNil: [ ^ self ].
	
	clss := MBCommand subclasses.
	receiverClassIndex := self uiManager chooseFrom: (clss collect: #name).
	receiverClassIndex isZero ifTrue: [ ^ self ].
	
	newCommandName := 'MB', baseName, 'Command'.
	command := 
		(clss at: receiverClassIndex) 
			subclass: newCommandName asSymbol 
			instanceVariableNames: '' 
			classVariableNames: '' 
			poolDictionaries: '' 
			category: self category.
	
	documentation := self uiManager request: 'Enter the documentation'.
	documentation ifNil: [ ^ self ].
	 command compile: 'documentation
	^ ''', documentation, '''' classified: 'documentation'.

	 command compile: 'execute
	self subclassResponsibility ' classified: 'execute'.
	
	title := self uiManager request: 'Enter the command title'.
	title ifNil: [ ^ self ].
	 command compile: 'title
	^ ''', title, '''' classified: 'accessing'.
	
	clss := MBInfo allSubclasses.
	receiverClassIndex := self uiManager chooseFrom: (clss collect: #name).
	receiverClassIndex isZero ifTrue: [ ^ self ].
	(clss at: receiverClassIndex) compile: 'cmd', baseName, '
	^ ', newCommandName classified: 'commands'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand class>>target: target for: requestor [
	^ self new
		target: target;
		requestor: requestor;
		yourself
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>askForVersionNumber [
	"Return a new version number as a string"

	| latestVersion newVersion versions |
	newVersion := (versions := target configurationInfo versions) isEmpty
		ifTrue: [ '1.0' ]
		ifFalse: [ 
			latestVersion := versions first version.
			latestVersion versionNumber copy incrementMinorVersionNumber printString ].
	^ self uiManager  request: 'enter new version number' initialAnswer: newVersion
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>browseVersionHistory [
	"Used to browse version history of a Configuration package or a package"
	
	target workingCopy ancestors isEmpty
		ifTrue: [ ^ self ].
	(MCVersionHistoryBrowser new ancestry: target workingCopy ancestors first) perform: #show
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>canBeApplied [
	^ true
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>checkUserInRepository: repository [
	"Try to find the http repository of packageName. If it does not find one, then add one and ask for the username and password"

	| answerUser |
	(repository isKindOf: MCHttpRepository ) ifFalse: [ ^self ].
	repository user
		ifEmpty: [ 
			answerUser := self uiManager confirm: 'No user defined. Do you want to add one? '.
			answerUser
				ifTrue: [ 
					repository user: self username.
					repository password: self password ] ]
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>checkUserInRepositoryOfPackage: packageName [
	"Try to find the http repository of packageName. If it does not find one, then add one and ask for the username and password"

	| repo |
	(repo := self repositoryOfPackageNamed: packageName) ifNil: [ ^nil ].
	self checkUserInRepository: repo.
	^repo
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>chooseRepositoryFromList: repos [
	"Return the repository of the configuration. Create one (using UI) if necessary"

	repos size > 1
		ifTrue: [ 
			^ self uiManager
				chooseFrom: (repos collect: [ :repo | repo description ])
				values: repos
				title: 'Select repository' ].
	^ repos first
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>compiledMethodForVersion: aMetacelloVersion [

	| toolbox pragma |
	toolbox := MetacelloToolBox new project: aMetacelloVersion project.
	pragma := (toolbox constructor extractAllVersionPragmas at: aMetacelloVersion versionString ifAbsent: [ ^ nil ]) first.
	^pragma method
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>configurationClass [
	^ target
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>configurationReferencesFrom: aRepository [

	| map |
	map := Dictionary new.
	aRepository goferReferences do: [ :ref | 
		(ref packageName beginsWith: 'ConfigurationOf')
			ifTrue: [ | nameWithBranch |
				nameWithBranch := ref metacelloPackageNameWithBranch at: 2.
				(map at: nameWithBranch ifAbsent: [map at: nameWithBranch put: OrderedCollection new]) add: ref ]].
	^map
]

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>documentation [
	self subclassResponsibility
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>execute [
	self subclassResponsibility 
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>executeWithDevWorkflow: devWorkflow [
	self execute
]

{
	#category : #changes,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>findChangesBetween: versionSnapshot toLabel: toLabel and: ancestorVersionSnapshot fromLabel: fromLabel [
	"View changes between 2 versions."
	| patch |
	
	patch := versionSnapshot patchRelativeToBase: ancestorVersionSnapshot.
	patch isNil ifTrue: [^ self].
	patch isEmpty
		ifTrue: [
			self uiManager inform: 'No changes' ]
		ifFalse: [
			self
				viewChanges: patch
				from: fromLabel
				to: toLabel
				title: 'Changes between ', fromLabel, ' and ', toLabel   ]
]

{
	#category : #changes,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>findChangesFor: workingCopy relativeToRepository: repository [
	| patch fromDescription |
	repository isNil
		ifTrue: [ ^ self ].
	patch := workingCopy changesRelativeToRepository: repository.
	patch isNil
		ifTrue: [ ^ self ].
	patch isEmpty
		ifTrue: [ 
			workingCopy modified: false.
			self uiManager inform: 'No changes' ]
		ifFalse: [ 
			workingCopy modified: true.
			fromDescription := workingCopy packageName , ' (' , workingCopy ancestry ancestorString , ')'.
			self
				viewChanges: patch
				from: fromDescription
				to: ('Modified {1}' translated format: {(workingCopy description)}) 
				title: ('Changes to {1}' translated format: {fromDescription}) ]
]

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>helpDocumentation [
	^self documentation
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>initialize [
	super initialize.

]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>on: anObject for: aRequestor [
	^ self class on: anObject for: aRequestor
]

{
	#category : #ordering,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>order [
	^ self title
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>password [
	| password |
	password := target configurationRoot password. 
	password ifNotNil: [ ^ password ].
	password := self uiManager requestPassword: 'enter your Monticello password for '.
	target configurationRoot password: password.
	^ password
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>pickRepository [
	^ self pickRepositoryFrom: self repositories.

]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>pickRepositoryFrom: repositories [

	^self pickRepositoryFrom: repositories title: 'Choose repository'
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>pickRepositoryFrom: repositories title: title [
	| index |
	index := self uiManager chooseFrom: (repositories collect: [ :ea | ea description ]) title: title.
	^ index = 0
		ifFalse: [ repositories at: index ] 
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>projectName [
	^ self configurationClass name configurationBaseName
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>repositories [
	^MCRepositoryGroup default repositories
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>repositoryOfPackageNamed: packageName [
	"Return the repository of the configuration. Create one (using UI) if necessary"

	| mcPackage workingCopy repositories repository repositoryIndex username password |
	mcPackage := MCPackage named: packageName.
	workingCopy := mcPackage workingCopy.
	repositories := workingCopy repositoryGroup repositories reject: [ :rep | rep == MCCacheRepository default ].
	repositories
		ifEmpty: [ 
			| projectName answer squeakSourceURL |
			projectName := self configurationClass name configurationBaseName.
			squeakSourceURL := 'http://www.squeaksource.com/' , projectName.
			answer := self uiManager
				confirm: 'No repository associated with your project. Do you want to add ' , squeakSourceURL.
			answer
				ifFalse: [ 
					self uiManager  inform: 'Add a http repository with Monticello browser'.
					^ nil ].
			repository := MCHttpRepository location: squeakSourceURL user: '' password: ''.
			repository user isEmpty
				ifTrue: [ username := self username ].
			repository password isEmpty
				ifTrue: [ password := self password ].
			workingCopy repositoryGroup
				addRepository: (repository := MCHttpRepository location: squeakSourceURL user: username password: password) ].
	repositories size > 1
		ifTrue: [ 
			repositoryIndex := self uiManager chooseFrom: (repositories collect: #printString).
			repositoryIndex = 0
				ifTrue: [ ^ nil ].
			repository := repositories at: repositoryIndex ].
	repositories size = 1
		ifTrue: [ repository := repositories first ].
	^ repository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>requestor: aRequestor [

	requestor := aRequestor 
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>selectRepositoryFromWorkingCopy: workingCopy [
	| repos repo |
	repos := workingCopy repositoryGroup repositories.
	repos size = 0
		ifTrue: [ ^ self uiManager  inform: 'No repositories associated with ' , target name printString ].
	repo := repos size = 1
		ifTrue: [ repos first ]
		ifFalse: [ 
			self uiManager 
				chooseFrom: (repos collect: [ :r | r description ])
				values: repos
				title: 'Please choose which repository to use for diff' ].
	^ repo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>target [
	^ target
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>target: anObject [
	target := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>targetNode [
	^ targetNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>targetNode: anObject [
	targetNode := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>title [
	^ 'Abstract Command'
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>uiManager [

	^ UIManager default
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>username [
	| username |
	username := target configurationRoot username. 
	username ifNotNil: [ ^ username ].
	username := self uiManager request: 'enter your Monticello username (login)'.
	target configurationRoot username: username.
	^ username
]

{
	#category : #changes,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommand>>viewChanges: patch from: fromDescription to: toDescription title: title [
	"Open a browser on the given patch."

	^ ( PSMCPatchMorph forPatch:  patch)
			fromDescription: fromDescription;
			toDescription:  toDescription;
			newWindow;
			title: title;
			open 
]
