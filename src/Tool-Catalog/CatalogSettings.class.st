"
Settings for catalog
"
Class {
	#name : #CatalogSettings,
	#superclass : #Object,
	#classVars : [
		'CatalogSourceURL',
		'DisplayCatalogProjectsInSpotter'
	],
	#category : #Tool-Catalog-Settings,
	#timestamp : 'TorstenBergmann 11/12/2015 00:54'
}

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogSettings class>>catalogSettingsOn: aBuilder   [
	<systemsettings>  
	(aBuilder group: #catalog)
		label: 'Catalog';
		parent: #tools;
		description: 'All Catalog and CatalogBrowser settings';
		with: [ 
			(aBuilder setting: #displayCatalogProjectsInSpotter)
						target: self;
						label: 'Display catalog projects in Spotter';
						default: true.
			(aBuilder setting: #catalogSourceURL)
				target: self;
				label: 'Source URL' ;
				ghostHelp: 'http://pathTo.url/json';
				description: 'Enter the source URL used to retrieve catalog information'			
		]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogSettings class>>catalogSourceURL [
	"Return the source URL for retrieving catalog infos"
	
	CatalogSourceURL ifNil: [ CatalogSourceURL := self defaultCatalogSourceURL ].
	^CatalogSourceURL
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogSettings class>>catalogSourceURL: aString [
	"Set the source URL for retrieving catalog infos"
	
	CatalogSourceURL := aString
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogSettings class>>defaultCatalogSourceURL [

	^'http://catalog.pharo.org/catalog/json'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogSettings class>>displayCatalogProjectsInSpotter [
	"Return true if the catalog projects should be displayed in spotter, false otherwise"
	
	DisplayCatalogProjectsInSpotter ifNil: [ DisplayCatalogProjectsInSpotter := true ].
	^DisplayCatalogProjectsInSpotter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogSettings class>>displayCatalogProjectsInSpotter: aBoolean [
	"Define if the catalog projects should be displayed in Spotter"
	
	DisplayCatalogProjectsInSpotter := aBoolean 
]
