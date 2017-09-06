"
I am a Gofer Operation that extracts a metacello configuration from the current repository and loads the given version.
"
Class {
	#name : #GoferMetacelloLoad,
	#superclass : #GoferLoad,
	#instVars : [
		'version'
	],
	#category : #Gofer-Core,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferMetacelloLoad>>configuration [
	^ self configurationReference project
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferMetacelloLoad>>configurationReference [
	^ gofer references
		detect: [ :ref | ref isConfigurationReference ]
		ifNone: [ 
			gofer configuration.
			^ self configurationReference ].
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferMetacelloLoad>>execute [
	super execute.
	self loadConfiguration.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferMetacelloLoad>>loadConfiguration [
	self metacelloVersion load
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferMetacelloLoad>>metacelloVersion [
	| configuration |
	
	configuration := self configuration project.
	self version 
		ifNil: [ ^ configuration stableVersion ].
		
	"Now let's wrap Metcaello's strange behaviors of distinguishing strings and symbols"
	[ 
		"First we try to load the latest version for a given version string"
		^ (configuration latestVersion: self version)
			ifNil: [ 
				"If that doesn't work we use the default version lookup to find a version with the given name"
				configuration version: self version ] 
	] on: MetacelloVersionDoesNotExistError do: [ :error |
			^ self version = 'last'
				ifTrue: [
					"manual fallback since there is no symbolic name for lastVersion"
					configuration lastVersion ]
				ifFalse: [ 
					"symbols and strings are not equal in Meteacello..."
					configuration version: self version asSymbol ]].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferMetacelloLoad>>version [
	^ version
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferMetacelloLoad>>version: aVersionStringOrSymbol  [
	"A version identifiery see MetacelloProject>>#version:"
	version := aVersionStringOrSymbol
]
