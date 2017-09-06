"
It holds one page of code. It is the model behind the Playground.

It also knows how to store itself on disk, and every time its content changes, it updates the corresponding file.
"
Class {
	#name : #GTPlayPage,
	#superclass : #Object,
	#instVars : [
		'title',
		'content',
		'creationTime',
		'modificationTime',
		'publishedUrl',
		'persistenceStrategies'
	],
	#category : #GT-Playground,
	#timestamp : 'TudorGirba 10/22/2014 07:52'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage class>>basicLoadFromPublishUrl: aString [
	^ GTPlayPage new 
		saveContent: (GTUrlProvider new get: aString)
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage class>>creationTimeFrom: aFileReference [
	^ [ self creationTimeFromString: aFileReference basenameWithoutExtension ] 
		on: Error 
		do: [ aFileReference creationTime ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage class>>creationTimeFromString: aString [
	" this is really ugly, but hopefully only a temporary solution untill we come up with somthing more reliable and more beautiful "
	| subexpressions |
	subexpressions := OrderedCollection new.
	'(\d+)-(\d+)-(\d+)T(\d+)-(\d+)-(\d+)(-(\d+))?([-+]\d+)-(\d+)(-(\d+))?' asRegex 
		matchesIn: aString
		subexpressionsDo: [ :expression :expressionFragments | 
			subexpressions addAll: (expressionFragments collect: [ :each | 
				[ each squeezeOutNumber ] on: Error do: [ 0 ] ]) ].
	^ DateAndTime 
		year: subexpressions first 
		month: subexpressions second 
		day: subexpressions third 
		hour: subexpressions fourth 
		minute: subexpressions fifth 
		second: subexpressions sixth 
		nanoSecond: subexpressions eighth * 100000 " 7 == full match "
		offset: (Duration 
						days: 0 
						hours: subexpressions ninth 
						minutes: (subexpressions at: 10) 
						seconds: (subexpressions at: 12)) " 11 == full match "
]

{
	#category : #accessing-dynamic,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage class>>fileExtension [
	^ 'ph'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage class>>fromFileReference: aFileReference [
	^ self new
		content: (aFileReference readStreamDo: #contents); 
		creationTime: (self creationTimeFrom: aFileReference);
		yourself
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage class>>gtExampleEmpty [
	<gtExample>
	<label: 'Empty'>
	
	^ self new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage class>>loadFromPublishUrl: aString [
	^ [ self basicLoadFromPublishUrl: aString ] 
		on: Error 
		do: [ nil ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage class>>loadFromPublishUrl: aString thenDo: aBlock [
	| page |
	page := self loadFromPublishUrl: aString.
	page ifNotNil: [ aBlock value: page ].
	^ page
]

{
	#category : #compatibility-tools,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>acceptContents: aStringOrtext [

	self flag: #TODO. "Need support for what lies in the comment down here"
	"self fileName ifNotNil: [ self saveString: aStringOrtext toFile: self fileName ].

	acceptAction ifNotNil:[acceptAction value: aStringOrtext]."
	self saveContent: aStringOrtext.
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>content [
	^ content
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>content: aString [
	content := aString asString
]

{
	#category : #accessing-dynamic,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>contentString [
	" strange, sometimes #content is aText not aString ! "
	^ self content asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>creationTime [
	^ creationTime
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>creationTime: anObject [
	creationTime := anObject
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>creationTimeForFileName [
	^ (self creationTime asString copyReplaceAll: ':' with: '-') copyReplaceAll: '.' with: '-'
]

{
	#category : #accessing-dynamic,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>ensureStashPersistency [
	(self persistenceStrategies noneSatisfy: [ :each | each isStash ])
		ifTrue: [ self persistenceStrategies add: (GTPlayPageStashPersistence new page: self) ]
]

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>gtDisplayOn: stream [
	stream nextPutAll: (self contentString copyReplaceAll: String cr with: String space)
]

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>gtInspectorContentIn: composite [
	<gtInspectorPresentationOrder: 0>
	composite pharoScript 
		title: 'Content';
		display: #content;
		installDefaultSelectionActions
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>initialize [
	super initialize.
	self content: ''.
	self creationTime: DateAndTime now.
	title := nil.
	persistenceStrategies := OrderedCollection with: (GTPlayPageCachePersistence new page: self)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>isInteresting [
	^ self contentString trimBoth isEmpty not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>persistenceStrategies [
	^ persistenceStrategies
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>persistenceStrategies: anObject [
	persistenceStrategies := anObject
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>publish [
	(self confirm: 'Publish playground content to the cloud?')
        ifFalse: [ ^ self ].
    self content ifEmpty: [ 
        self inform: 'Nothing was published because the playground is empty'.
        ^ self ].
    Clipboard clipboardText: (publishedUrl := (GTUrlProvider new post: self contentString) asString).
    self inform: publishedUrl , ' was published and the url was copied to clipboard'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>save [
	persistenceStrategies do: [ :each | each save ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>saveContent: aStringOrText [
	self content: aStringOrText.
	self save.
]

{
	#category : #accessing-dynamic,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>setTitleAndEnsureInStash: aString [
	self title: aString.
	self ensureStashPersistency.
	self save
]

{
	#category : #accessing-dynamic,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>title [
	^ title ifNil: [ 'Page' ]
]

{
	#category : #accessing-dynamic,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPage>>title: aString [
	title := aString
]
