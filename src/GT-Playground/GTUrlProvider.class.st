"
This class was inspired from the Zinc SharedWorkspace project.

Its job is to work with a UrlProvider that can provide (via get) and store (via post) strings.
"
Class {
	#name : #GTUrlProvider,
	#superclass : #Object,
	#instVars : [
		'urlProvider'
	],
	#classInstVars : [
		'urlProvider'
	],
	#category : #GT-Playground,
	#timestamp : 'TudorGirba 10/22/2014 07:50'
}

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTUrlProvider class>>settingsOn: aBuilder  [
	<systemsettings>
	
	(aBuilder setting: #stringUrlProvider)
		parent: #gt;
		target: self;
		description: 'The url for the script sharing service like the one from http://ws.stfx.eu';
		label: 'The url for the script sharing service'

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTUrlProvider class>>stringUrlProvider [
	^ self urlProvider asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTUrlProvider class>>stringUrlProvider: aString [
	self urlProvider: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTUrlProvider class>>urlProvider [
	^ urlProvider ifNil: [ urlProvider := 'http://ws.stfx.eu' asZnUrl ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTUrlProvider class>>urlProvider: aUrlObject [
	urlProvider := aUrlObject ifNotNil: [ aUrlObject asZnUrl ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTUrlProvider>>get: url	 [
	| contents |
	contents := self httpClient get: url.
	^ String new: contents size streamContents: [ :stream |
		contents linesDo: [ :each | stream nextPutAll: each; cr ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTUrlProvider>>httpClient [
	^ ZnClient new
		systemPolicy;
		beOneShot;
		accept: ZnMimeType textPlain;
		url: self urlProvider;
		yourself
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTUrlProvider>>post: string [
	| entity client url |
	entity := ZnEntity text: string asString.
	(client := self httpClient)
		entity: entity; 
		post.
	url := client response location.
	^ url asZnUrl inContextOf: self urlProvider 
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTUrlProvider>>urlProvider [
	^ urlProvider ifNil: [ urlProvider := self class urlProvider ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTUrlProvider>>urlProvider: anUrlObject [
	urlProvider := anUrlObject asZnUrl 
]
