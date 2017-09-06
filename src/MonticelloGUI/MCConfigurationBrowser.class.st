"
A MCConfigurationBrowser displays an MCConfiguration, and edits the configuration to add or remove package dependencies and repository specifications. It allows a configuration to be stored in a repository or posted to an update stream.
"
Class {
	#name : #MCConfigurationBrowser,
	#superclass : #MCTool,
	#instVars : [
		'configuration',
		'dependencyIndex',
		'repositoryIndex'
	],
	#category : #MonticelloGUI,
	#timestamp : 'StephaneDucasse 11/29/2011 22:23'
}

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser class>>open [
	<script>
	^self new show
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>add [
	(self pickWorkingCopiesSatisfying: [:each | (self includesPackage: each package) not])
		do: [:wc |
			wc ancestors isEmpty
				ifTrue: [self inform: 'You must save ', wc packageName, ' first!
Skipping this package']
				ifFalse: [
					self dependencies add: (MCVersionDependency
						package: wc package
						info: wc ancestors first)]].
	self changed: #dependencyList; changed: #description
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>addDependency [
	(self pickWorkingCopiesSatisfying: [:each | (self includesPackage: each package) not])
		do: [:wc |
			wc ancestors isEmpty
				ifTrue: [self inform: 'You must save ', wc packageName, ' first!
Skipping this package']
				ifFalse: [
					self dependencies add: (MCVersionDependency
						package: wc package
						info: wc ancestors first)]].
	self changed: #dependencyList; changed: #description
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>addRepository [
	(self pickRepositorySatisfying: [:ea | (self repositories includes: ea) not])
		ifNotNil: [:repo |
			(repo isKindOf: MCHttpRepository)
				ifFalse: [^self inform: 'Only HTTP repositories are supported'].
			self repositories add: repo.
			self repositoryListChanged.
		]
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>buttonSpecs [
	^ #(('Add' addDependency 'Add a dependency')
		('Update' updateMenu 'Update dependencies')
		('Install' installMenu 'Load/Merge/Upgrade into image')
		('Up' up 'Move item up in list' canMoveUp)
		('Down' down 'Move item down in list' canMoveDown)
		('Remove' remove 'Remove item' canRemove)
		('Migrate' migrate 'Migrate all packages to a repository')
		('Store' store 'store configuration')
		)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>canMoveDown [
	^self index between: 1 and: self maxIndex - 1 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>canMoveUp [
	^self index > 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>canRemove [
	^self index > 0
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>changedButtons [
	self changed: #canMoveDown.
	self changed: #canMoveUp.
	self changed: #canRemove.
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>changedList [
	self dependencyIndex > 0 ifTrue: [ ^ self changed: #dependencyList ].
	self repositoryIndex > 0 ifTrue: [ ^ self repositoryListChanged ].
	self error: 'nothing selected'
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>checkDependencies [
	^self checkModified and: [self checkMissing]
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>checkMissing [
	| missing |
	missing := (self dependencies collect: [:ea | ea versionInfo name]) asSet.

	self repositories
		do: [:repo |
			repo allVersionNames
				do: [:found | missing remove: found ifAbsent: []]]
		displayingProgress: 'searching versions'.

	^missing isEmpty or: [
		self selectDependency: missing anyOne.
		self confirm: (String streamContents: [:strm |
			strm nextPutAll: 'No repository found for'; cr.
			missing do: [:r | strm nextPutAll: r; cr].
			strm nextPutAll: 'Do you still want to store?'])]
	
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>checkModified [
	| modified |
	modified := self dependencies select: [:dep |
		dep isFulfilled and: [dep package workingCopy modified]].
	
	^modified isEmpty or: [
		self selectDependency: modified anyOne.
		self confirm: (String streamContents: [:strm |
			strm nextPutAll: 'These packages are modified:'; cr.
			modified do: [:dep | strm nextPutAll: dep package name; cr].
			strm nextPutAll: 'Do you still want to store?'])]
	
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>checkRepositories [
	| bad |
	bad := self repositories reject: [:repo | repo isKindOf: MCHttpRepository].
	^bad isEmpty or: [
		self selectRepository: bad first.
		self inform: (String streamContents: [:strm |
			strm nextPutAll: 'Please remove these repositories:'; cr.
			bad do: [:r | strm nextPutAll: r description; cr].
			strm nextPutAll: '(only HTTP repositories are supported)']).
		false].

]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>checkRepositoryTemplates [
	"unused for now - we only do HTTP"
	| bad |
	bad := self repositories select: [:repo | repo creationTemplate isNil].
	^bad isEmpty or: [
		self selectRepository: bad first.
		self inform: (String streamContents: [:strm |
			strm nextPutAll: 'Creation template missing for'; cr.
			bad do: [:r | strm nextPutAll: r description; cr].
			strm nextPutAll: 'Please fill in the details first!']).
		false].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>configuration [
	^configuration ifNil: [configuration := MCConfiguration new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>configuration: aConfiguration [
	configuration := aConfiguration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>dependencies [
	^self configuration dependencies

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>dependencies: aCollection [
	self configuration dependencies: aCollection.
	self changed: #dependencyList; changed: #description

]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>dependencyIndex [
	^dependencyIndex ifNil: [0]
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>dependencyIndex: anInteger [
	dependencyIndex := anInteger.
	dependencyIndex > 0
		ifTrue: [self repositoryIndex: 0].
	self changed: #dependencyIndex; changed: #description.
	self changedButtons.
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>dependencyList [
	^self dependencies collect: [:dep | 
		Text string: (dep isCurrent
				ifTrue: [dep versionInfo name]
				ifFalse: [':: ', dep versionInfo name])
			attributes: (Array streamContents: [:attr |
				dep isFulfilledByAncestors
					ifFalse: [attr nextPut: TextEmphasis bold]
					ifTrue: [dep isCurrent ifFalse: [attr nextPut: TextEmphasis italic]].
			])]

]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>dependencyMenu: aMenu [
	self fillMenu: aMenu fromSpecs: #(('Change log...' showChangeLog)).
	self fillMenu: aMenu fromSpecs: #(('Add dependency...' addDependency)).
	self selectedDependency ifNotNil: [
		self fillMenu: aMenu fromSpecs: #(('Remove dependency...' remove))].
	^aMenu

]

{
	#category : #description,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>description [
	self selectedDependency ifNotNil: [:dep | ^ ('Package: ', dep package name, String cr,
		dep versionInfo summary) asText].
	self selectedRepository ifNotNil: [:repo | ^repo creationTemplate
		ifNotNil: [repo creationTemplate asText]
		ifNil: [repo asCreationTemplate asText addAttribute: TextColor red]].
	^ ''

]

{
	#category : #description,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>description: aText [

	self selectedRepository ifNotNil: [:repo | 
		| new | 
		new := MCRepository readFrom: aText asString.
		(new class = repo class 
			and: [new description = repo description])
				ifTrue: [
					repo creationTemplate: aText asString.
					self changed: #description]
				ifFalse: [
					self inform: 'This does not match the previous definition!'
				]
	].


]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>down [
	self canMoveDown
		ifFalse: [ ^ self ].
	self list swap: self index with: self index + 1.
	self index: self index + 1.
	self changedList
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>includesPackage: aPackage [
	^self dependencies anySatisfy: [:each | each package = aPackage]
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>index [
	^self dependencyIndex max: self repositoryIndex
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>index: anInteger [
	self dependencyIndex > 0 ifTrue: [^self dependencyIndex: anInteger].
	self repositoryIndex > 0 ifTrue: [^self repositoryIndex: anInteger].
	anInteger > 0 ifTrue: [self error: 'cannot select']
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>initialExtent [
	^ 350@500
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>installMenu [

	| menu |
	menu := UIManager default newMenuIn: self for: self.
	menu add: 'load packages' selector: #load.
	menu add: 'merge packages' selector: #merge.
	menu add: 'upgrade packages' selector: #upgrade.
	menu popUpInWorld.
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>list [
	self dependencyIndex > 0 ifTrue: [^self dependencies].
	self repositoryIndex > 0 ifTrue: [^self repositories].
	^#()
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>load [
	self configuration load.
	self changed: #dependencyList; changed: #description

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>loadMenu [

	| menu |
	menu := UIManager default newMenuIn: self for: self.
	menu add: 'update from image' selector: #updateFromImage.
	menu add: 'update from repositories' selector: #updateFromRepositories.
	menu popUpInWorld.

]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>maxIndex [
	^ self list size
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>merge [
	self configuration merge.
	self changed: #dependencyList; changed: #description

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>migrate [
	"copy all packageversions in this cofiguration to a repository"
	| versions |
	versions := OrderedCollection new.

	configuration depsSatisfying: [:dep | dep isFulfilledByAncestors not]
		versionDo: [:ver | versions add: ver]
		displayingProgress: 'finding packages'.

	self pickRepository ifNotNil: [:aRepository |
		versions do: [:eachVersion |
			Transcript cr; show: '',aRepository,' storeVersion: ', eachVersion.
			aRepository storeVersion: eachVersion
		]
	]

]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>pickConfig [
	self pickRepository ifNotNil: [:repo |
		| configs index |
		configs := Cursor wait showWhile: [
			repo allFileNames
				select: [:ea | MCMcmReader canReadFileNamed: ea]
				thenCollect: [:ea | ea copyUpToLast: $.]].
		configs isEmpty ifTrue: [^self inform: 'no configs found in ', repo description].
		configs := configs asSortedCollection: [:a :b |
			(a copyAfterLast: $.) asNumber > (b copyAfterLast: $.) asNumber].
		index := UIManager default chooseFrom: configs title: 'config:' translated.
		index = 0 ifFalse: [^Cursor wait showWhile: [
			repo versionFromFileNamed: (configs at: index), '.', MCMcmReader extension]]].
	^nil
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>pickName [
	| name |
	name := UIManager default
		request: ('Name' translated, ' (.', self configuration writerClass extension, ' will be appended' translated, '):')
		initialAnswer: (self configuration name ifNil: ['']).
	^ name isEmptyOrNil ifFalse: [name]
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>pickRepository [
	^self pickRepositorySatisfying: [:ea | true]

]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>pickRepositorySatisfying: aBlock [
	| index list |
	list := MCRepositoryGroup default repositories select: aBlock.
	index := (UIManager default chooseFrom: (list collect: [:ea | ea description]) title: 'Repository:' translated).
	^ index = 0 ifFalse: [list at: index]
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>pickWorkingCopiesSatisfying: aBlock  [
	| copies item |
	copies := (self allManagers select: aBlock)
				asSortedCollection: [:a :b | a packageName <= b packageName].
	item := UIManager default
				chooseFrom: ({'match ...' translated} , (copies
						collect: [:ea | ea packageName]))
				lines: #(1 )
				title: 'Package:' translated. 
	item = 1
		ifTrue: [| pattern | 
			pattern := UIManager default request: 'Packages matching:' translated initialAnswer: '*'.
			^ pattern isEmptyOrNil
				ifTrue: [#()]
				ifFalse: [(pattern includes: $*)
						ifFalse: [pattern := '*' , pattern , '*'].
					copies
						select: [:ea | pattern match: ea packageName]]].
	^ item = 0
		ifTrue: [#()]
		ifFalse: [{copies at: item - 1}]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>remove [
	self canRemove
		ifFalse: [ ^ self ].
	self list removeAt: self index.
	self changedList.
	self updateIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>repositories [
	^ self configuration repositories
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>repositories: aCollection [
	^self configuration repositories: aCollection

]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>repositoryIndex [
	^repositoryIndex ifNil: [0]
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>repositoryIndex: anInteger [
	repositoryIndex := anInteger.
	repositoryIndex > 0
		ifTrue: [self dependencyIndex: 0].
	self changed: #repositoryIndex; changed: #description.
	self changedButtons.
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>repositoryList [
	^self repositories collect: [:ea | ea description]

]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>repositoryMenu: aMenu [
	^self fillMenu: aMenu fromSpecs: #(
		('Add repository...' addRepository)
	)
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>selectDependency: aDependency [
	self dependencyIndex: (self dependencies indexOf: aDependency)
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>selectRepository: aRepository [
	self repositoryIndex: (self repositories indexOf: aRepository)
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>selectedDependency [
	^ self dependencies at: self dependencyIndex ifAbsent: []
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>selectedPackage [
	^ self selectedDependency ifNotNil: [:dep | dep package]
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>selectedRepository [
	^ self repositories at: self repositoryIndex ifAbsent: []
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>showChangeLog [
	self pickConfig ifNotNil: [:oldConfig |
		Transcript dependents isEmpty
			ifTrue: [Transcript open]
			ifFalse: [Transcript dependents do: [:ea | 
				ea isSystemWindow ifTrue: [ea activate]]].
		Cursor wait showWhile: [
			MCConfiguration whatChangedFrom: oldConfig to: configuration on: Transcript.
			Transcript flush]]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>store [
	(self checkRepositories and: [self checkDependencies]) ifFalse: [^self].
	self pickName ifNotNil: [:name |
		self configuration name: name.
		self pickRepository ifNotNil: [:repo |
			repo storeVersion: self configuration]].
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>up [
	self canMoveUp
		ifFalse: [ ^ self ].
	self list swap: self index with: self index - 1.
	self index: self index - 1.
	self changedList
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>updateFromImage [
	self configuration updateFromImage.
	self changed: #dependencyList; changed: #description

]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>updateFromRepositories [
	self configuration updateFromRepositories.
	self changed: #dependencyList; changed: #description

]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>updateIndex [
	self index > 0 ifTrue: [self index: (self index min: self maxIndex)]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>updateMenu [

	| menu |
	menu := UIManager default
				 newMenuIn: self for: self.
	menu add: 'update from image' selector: #updateFromImage.
	menu add: 'update from repositories' selector: #updateFromRepositories.
	menu popUpInWorld.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>upgrade [
	self configuration upgrade.
	self changed: #dependencyList; changed: #description

]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfigurationBrowser>>widgetSpecs [
	^ #(
		((buttonRow) (0 0 1 0) (0 0 0 30))
		((listMorph:selection:menu: dependencyList dependencyIndex dependencyMenu:) (0 0 1 1) (0 30 0 -180))
		((listMorph:selection:menu: repositoryList repositoryIndex repositoryMenu:) (0 1 1 1) (0 -180 0 -120))
		((textMorph: description) (0 1 1 1) (0 -120 0 0))
	 	)
]
