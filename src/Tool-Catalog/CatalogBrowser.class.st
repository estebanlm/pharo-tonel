"
I'm a browser to show project catalog from pharo official repositories. 
I'm a replacement for the old Metacello Configuration Browser.

I interact with a ==CatalogProvider== and manipulate ==CatalogProject== instances.

Pharo catalog can be found at:  *http://catalog.pharo.org*

[[[
CatalogBrowser new open			
]]]
"
Class {
	#name : #CatalogBrowser,
	#superclass : #Model,
	#instVars : [
		'provider'
	],
	#category : #Tool-Catalog-UI,
	#timestamp : 'StephaneDucasse 8/16/2015 11:18'
}

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser class>>iconFor: project [
	^ (Smalltalk globals includesKey: project packageName asSymbol)
		ifTrue: [ self iconNamed: #configLoaded ]
		ifFalse: [ self iconNamed: #config ]
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser class>>menuCommandOn: aBuilder [
	"Add a custom menu item to the world menu"

	<worldMenu>
	(aBuilder item: #'Catalog Browser')
		order: 0.19;
		iconName: #catalogIcon;
		parent: #Tools;
		action: [ self open ]
]

{
	#category : #showing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser class>>open [
	<script>

	^self new open
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser class>>title [
	^ 'Pharo Project Catalog'
]

{
	#category : #'private - utilities',
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>availableRepositoryURLStrings [

	^ CatalogProject availableRepositoryURLStrings
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>buildBrowser [
	| browser |
	browser := GLMTabulator new
		title: self class title;
		row: #projects;
		row: #detail;
		yourself.
	browser transmit
		to: #projects;
		andShow:
				[ :a | 
			a list
				title: 'Available';
				in: [ :this | 
					self buildMenuOn: this.
					self buildContextMenuOn: this ];
				display: [ :thisProvider | thisProvider projects ];
				format: [ :project | project name ];
				icon: [ :project | self iconFor: project ];
				filterOn: [ :text :each | each matches: text ];
				tags: [ :project | 
					project keywords isNil
						ifTrue: [ #() ]
						ifFalse: [ project allKeywords sorted ] ] ].
	browser transmit
		from: #projects;
		to: #detail;
		andShow: [ :a | 
			a text
				title: 'Description';
				display: [ :project | project fullDescription ] ].
	^ browser
]

{
	#category : #'private - utilities',
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>buildContextMenuOn: aList [
	| col |
	col := (PragmaCollector new
		filter:
			[ :prg | prg keyword = #contextMenu and: [ prg methodClass = self class ] ])
		reset.
	"the pragma menu builder is probably doing a better job than this code but it was unclear"
	(col collected
		sorted: [ :p1 :p2 | p2 methodSelector > p1 methodSelector ])
		do: [ :each | self perform: each methodSelector with: aList ]
]

{
	#category : #'private - utilities',
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>buildMenuOn: aList [
	| col |
	col := (PragmaCollector filter: [ :prg | prg keyword = #menuOrder: and: [ prg methodClass = self class ] ]) reset.
	col collected sort: [ :a :b | (a argumentAt: 1) <= (b argumentAt: 1) ].
	col do: [ :each | self perform: each methodSelector with: aList ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>defineAllRepositoriesInMCBrowser [
	"Define all the repositories as a repository browsable from within the MC Browser. This is is simpler to copy a configuration to the meta repositories."
	self availableRepositoryURLStrings do: [ :each | 
		MCRepositoryGroup default 
			addRepository: (self repositoryObjectFromURLString: each)] 
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>defineAllRepositoriesInMCBrowserButton: aList [

	<menuOrder: 9>
	aList
		act: [ :presenter | self defineAllRepositoriesInMCBrowser ]
		iconName: #monticelloPackageIcon
		entitled: 'Define all distribution catalog MC repositories'
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>defineCurrentVersionRepositoryButton: aList [

	<menuOrder: 7>
	aList
		act: [ :presenter | self defineCurrentVersionRepositoryInMCBrowser ]
		iconName: #komitterIcon
		entitled: 'Define current distribution catalog MC repository'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>defineCurrentVersionRepositoryInMCBrowser [
	MCRepositoryGroup default addRepository: (self repositoryObjectFromURLString: CatalogProject pharoDistributionRepository)
]

{
	#category : #'private - utilities',
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>iconFor: project [

	^self class iconFor: project
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>installStableVersion: aProject onSuccess: aBlock [
	aProject ifNil: [ ^self ].
	aProject isAvailableForCurrentPharo 
		ifFalse: [  
			(UIManager default confirm: ('{1} has not been marked as tested for {2}! 
Do you want to continue (installation could fail)?' format: { aProject name. Smalltalk version }))
			ifFalse: [ ^ self ] ].
	[ 
		aProject installStableVersion.
		aBlock value ]
	on: Error do: [ :e | 
		e logCr.
		self inform: 'There was an error while trying to install ', aProject name, '. Installation was cancelled.' ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>installStableVersionButton: aList [
	<menuOrder: 2>
	aList
		act: [ :presenter | self onInstallFrom: presenter ]
		iconName: #glamorousAccept
		entitled: 'Install stable version'
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>installStableVersionMenuItem: aList [
	<contextMenu>
	aList 
		selectionAct: [ :presenter | self onInstallFrom: presenter ] 
		iconName: #glamorousAccept
		entitled: 'Install stable version'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>loadConfiguration: aProject onSuccess: aBlock [
	[ 
		aProject loadConfiguration.
		aBlock value ] 
	on: Error do: [ :e | 
		e logCr.
		self inform: 'There was an error while trying to load ', aProject name, '. Loading was cancelled.' ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>loadConfigurationButton: aList [
	<menuOrder: 4>
	aList
		act: [ :presenter | self onLoadFrom: presenter ]
		iconName: #configIcon
		entitled: 'Load configuration (do not install project)'
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>loadConfigurationMenuItem: aList [
	<contextMenu>
	aList 
		selectionAct: [ :presenter | self onLoadFrom: presenter ] 
		iconName: #configIcon
		entitled: 'Load configuration (do not install project)'
]

{
	#category : #'private - events',
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>onInstallFrom: presenter [

	self installStableVersion: presenter selection
		  onSuccess: [ presenter update ]
]

{
	#category : #'private - events',
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>onLoadFrom: presenter [
	presenter selection ifNil: [ ^self ].
	self loadConfiguration: presenter selection
		  onSuccess: [ presenter update ]
]

{
	#category : #'private - events',
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>onRefreshFrom: presenter [

	self refresh.
	presenter pane browser update
]

{
	#category : #showing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>open [
	^ self buildBrowser openOn: self provider
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>provider  [
	^ provider ifNil: [ provider := CatalogProvider default ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>refresh [
	[ UIManager default 
		informUser: 'Refreshing catalog (invalidating cache)...'
		during: [ self provider reset ] ]
	on: Error do: [ :e |
		e crLog.
		self inform: 'I cannot refresh catalog list. Please review your internet connection and try again!' ]
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>refreshButton: aList [
	<menuOrder: 10>
	aList
		act: [ :presenter | self onRefreshFrom: presenter ]
		iconName: #glamorousRefresh
		entitled: 'Refresh'
]

{
	#category : #'private - utilities',
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogBrowser>>repositoryObjectFromURLString: aString [
	"self new repositoryObjectFromURLString: 'blabla'"

	^ MCHttpRepository location: aString user: Author fullName password: ''
]
