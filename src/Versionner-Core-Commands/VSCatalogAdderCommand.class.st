"
A VSCatalogAdderCommand adds methods to ConfigurationOf class to declare catalog metadata.


"
Class {
	#name : #VSCatalogAdderCommand,
	#superclass : #VSConfigurationCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'ChristopheDemarey 2/14/2014 17:53'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>configurationMetaclass [
	^ self configurationClass class
]

{
	#category : #'metadata methods defintion',
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>defineCatalogDescriptionTemplate [
	self configurationMetaclass
		compile: 'catalogDescription
	"Returns a paragraph describing the project"
	^ ''MyProject is an amazing project that will change your life.'''
		classified: 'catalog'
]

{
	#category : #'metadata methods defintion',
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>defineChangeLogTemplate [

	self configurationMetaclass 
		compile: 'catalogChangeLog
	"Returns a paragraph describing the most important changes in the configuration class."
	^ ''- Version number - Date - topics
[[[
	ConfigurationOfXXX project version: ''''xx'''' ) load					
]]]
or simply
- Version number - Date - topics
- Version number - Date - topics
- Version number - Date - topics.'''
		classified: 'catalog'
]

{
	#category : #'metadata methods defintion',
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>defineContactInfoTemplate [

	self configurationMetaclass 
		compile: 'catalogContactInfo
	"Returns a paragraph describing contact information such as email, mailing lists and website."
	^ ''MyProject is an amazing project . You can get in contact with our great MyProject programmer at myProject@gmail.com'''
		classified: 'catalog'
]

{
	#category : #'metadata methods defintion',
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>defineKeyClassesTemplate [

	self configurationMetaclass 
		compile: 'catalogKeyClassesAndExample
	"Returns a paragraph or more describing the key classes of your project. You can use Pillar/Pier syntax to layout out the text i.e., ==Code== and - for bullet."
	^ ''MyProject is composed of one cool key class named ==MyProject==. There is also ==MyKeyHelper==
- ==MyProject== is the responsible for many cool aspects.
- ==MyKeyHelper== is helping ==MyProject=='''
		classified: 'catalog'
]

{
	#category : #'metadata methods defintion',
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>defineKeywordsTemplate [

	self configurationMetaclass 
		compile: 'catalogKeywords
	"Returns an array of symbols"
	^ #(web fun) ' 
		classified: 'catalog'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>ensureCatalogDescription [

	^ self hasCatalogDescription 
		ifFalse: [ self defineCatalogDescriptionTemplate ]
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>ensureChangeLog [
	^ self hasChangeLog 
		ifFalse: [ self defineChangeLogTemplate ]
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>ensureContactInfo [

	^ self hasContactInfo 
		ifFalse: [ self defineContactInfoTemplate ]
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>ensureKeyClasses [

	^ self hasKeyClasses
		ifFalse: [ self defineKeyClassesTemplate ]
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>ensureKeywords [

	^ self hasKeywords 
		ifFalse: [ self defineKeywordsTemplate ]
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>execute [
	self 
		ensureChangeLog;
		ensureCatalogDescription ;
		ensureContactInfo ;
		ensureKeyClasses ;
		ensureKeywords 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>hasCatalogDescription [

	^ (self configurationClass includesSelector: #catalogDescription) 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>hasChangeLog [

	^ (self configurationClass includesSelector: #catalogChangeLog) 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>hasContactInfo [

	^ (self configurationClass includesSelector: #catalogContactInfo) 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>hasKeyClasses [

	^ (self configurationClass includesSelector: #catalogKeyClassesAndExample) 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>hasKeywords [

	^ (self configurationClass includesSelector: #catalogKeywords) 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCatalogAdderCommand>>title [
	^ 'add catalog methods'
]
