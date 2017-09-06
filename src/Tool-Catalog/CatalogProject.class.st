"
I'm a project from an official pharo repository. 

I can load 
	- stable versions
	- just configurations.

My class side provides some helper to access distribution repositories.

[[[
self pharoDistributionRepository			
]]]
			
[[[
self availableRepositoryURLStrings		 
]]]
"
Class {
	#name : #CatalogProject,
	#superclass : #Object,
	#instVars : [
		'name',
		'packageName',
		'repositoryUrl',
		'description',
		'keywords',
		'contactInfo'
	],
	#classInstVars : [
		'repositoryURLToNameMappings'
	],
	#category : #Tool-Catalog-Base,
	#timestamp : 'StephaneDucasse 8/16/2015 11:17'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject class>>availableRepositoryURLStrings [
	^ self repositoryURLToNameMappings keys
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject class>>createRepositoryURLtoNameMappings [
	"Return a mapping between repositories URLs and their user names"

	^ Dictionary new
		at: self pharoDistributionRepository put: self pharoCurrentDottedName;
		at: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main' put: 'Pharo5.0';
		at: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main' put: 'Pharo4.0';
		at: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main' put: 'Pharo3.0';
		at: 'http://www.squeaksource.com/MetacelloRepository' put: 'Unsorted';
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject class>>fromDictionary: aDictionary [
	^ self new 
		fromDictionary: aDictionary;
		yourself
]

{
	#category : #GT-InspectorExtensions-Core,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject class>>gtBasicExample [
	<gtExample>
	^ self new fromDictionary: 
		(Dictionary new
			add: ('packageName'->'ConfigurationOfGTInspector'); 
			add: ('name'->'GTInspector'); 
			add: ('repositoryUrl'->'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main'); 
			yourself)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject class>>pharoCurrentDottedName [
	^ 'Pharo' , SystemVersion current major asString , '.', SystemVersion current minor asString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject class>>pharoCurrentMajorName [
    
    ^ 'Pharo', SystemVersion current major asString, '0'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject class>>pharoDistributionRepository [
	"Returns the correct pharo distribution url"

	^ 'http://smalltalkhub.com/mc/Pharo/MetaRepoFor' , self pharoCurrentMajorName , '/main'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject class>>repositoryURLToNameMappings [
	^ repositoryURLToNameMappings ifNil: [ repositoryURLToNameMappings := self createRepositoryURLtoNameMappings ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject class>>unknownRepository [
	^ 'Unknown'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>allKeywords [
	^ self keywords copyWithFirst: self repositoryName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>contactInfo [
	^ contactInfo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>description [
	^ description
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>fromDictionary: aDictionary  [
	name := aDictionary at: #name.
	packageName := aDictionary at: #packageName.
	repositoryUrl := aDictionary at: #repositoryUrl.
	description := aDictionary at: #description ifAbsent: [ nil ].
	contactInfo := aDictionary at: #contactInfo ifAbsent: [ nil ].
	keywords := ((aDictionary 
		at: #keywords  
		ifAbsent: [ #() ])
		ifNil: [ #() ])
		collect: #asLowercase.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>fullDescription [
	^ String streamContents: [ :stream | 
		self description
		   ifNil: [ stream << '<No Description Provided>' ]
			ifNotNil: [ stream << self description  ].
		self contactInfo 
			ifNotNil: [ 
				stream cr; cr.
				stream << self contactInfo ] ]
]

{
	#category : #gt-inspector-extension,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>gtInspectorDetailsIn: composite [
	<gtInspectorPresentationOrder: 30>
	^ composite table
		title: 'Project';
		display: [ {
			'name' -> self name.
			'package name' -> self packageName.
			'repository url' -> self repositoryUrl.
			'description' -> (self description ifNil: [ '' ]).
			'contact info' -> (self contactInfo ifNil: [ '' ]).
			'keywords' -> (Character space join: self keywords) } ];
		column: 'Key' evaluated: #key;
		column: 'Value' evaluated: #value;
		send: #value
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>installStableVersion  [
	  Metacello new
		repository: self repositoryUrl, '/',self name;
		configuration: self name;
		version: #'stable';
		load
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>installVersion: aStringOrSymbol  [
	[ Gofer it 
			url: self repositoryUrl;
			configurationOf: self name;
			loadVersion: aStringOrSymbol ]
	on: Warning do: [ :w | w resume: true ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>isAvailableForCurrentPharo [
	^ self repositoryName = Smalltalk version
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>keywords [
	^ keywords
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>loadConfiguration  [
	Gofer it 
		url: self repositoryUrl;
		configurationOf: self name;
		load
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>matches: aString  [
	^ (self matches: self name with: aString)
		or: [ self keywords anySatisfy: [ :each | self matches: each with: aString ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>matches: aString with: subString [
	^ aString
		includesSubstring: subString 
		caseSensitive: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>packageName [
	^ packageName
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>printOn: stream  [
	stream << 'Project(' << self name << ')'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>repositoryName [
	^ self class repositoryURLToNameMappings 
		at: self repositoryUrl
		ifAbsent: [ self class unknownRepository ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>repositoryUrl [
	^ repositoryUrl
]

{
	#category : #gt-spotter-extension,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogProject>>spotterPreviewIn: aComposite [
	<spotterPreview: 10>
	^ aComposite table
		title: 'Catalog Project';
		display: [ {
			'name' -> self name.
			'package name' -> self packageName.
			'repository url' -> self repositoryUrl.
			'description' -> (self description ifNil: [ '' ]).
			'contact info' -> (self contactInfo ifNil: [ '' ]).
			'keywords' -> (Character space join: self keywords) } ];
		column: 'Key' evaluated: #key;
		column: 'Value' evaluated: #value;
		entity: self
]
