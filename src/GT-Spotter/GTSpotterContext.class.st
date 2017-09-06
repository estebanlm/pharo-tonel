"

"
Class {
	#name : #GTSpotterContext,
	#superclass : #Object,
	#instVars : [
		'step',
		'stream',
		'search',
		'text',
		'textTrimmed',
		'textLowercase',
		'processor',
		'filter',
		'streamed',
		'cache',
		'continuing'
	],
	#category : #GT-Spotter-Model,
	#timestamp : ''
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>addItem: anObject [
	self stream addObject: anObject inProcessor: self processor
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>addItems: aCollection [

	self stream addObjects: aCollection inProcessor: self processor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>cache [
	^ cache
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>cache: anObject [
	cache := anObject
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>cacheAt: aSymbol [
	^ self cacheAt: aSymbol ifAbsent: [ nil ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>cacheAt: aSymbol ifAbsent: aBlock [
	^ self cache at: aSymbol ifAbsent: aBlock
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>cacheAt: aSymbol ifAbsentPut: aBlock [
	^ self cache at: aSymbol ifAbsentPut: aBlock
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>cacheAt: aSymbol put: anObject [
	^ self cache at: aSymbol put: anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>canContinue [
	 " divein / really ugly, spotter-step does not really know why it was created or where it comes from :( "
	" another hack: diveIncategory must never continue because it just streams all items from the previous step. continuing in diveInCategory would duplicate all items! " 
	^ self step event == #diveIn
		or: [ self step event isNil ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>continueFilter [
	| processors nonEmptyProcessors |
	processors := self cache at: #processorsAndFilters ifAbsent: [ ^ self ].
	nonEmptyProcessors := processors associations select: [ :assoc | assoc key hasFilteredCandidates ].
	nonEmptyProcessors size = 1 ifFalse: [ ^ self ].
	self canContinue ifFalse: [ ^ self ].
	
	self withContinue: true do: [ 
		nonEmptyProcessors do: [ :assoc | 
			assoc key continueFilterInContext: self ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>continuing [
	^ continuing
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>continuing: anObject [
	continuing := anObject
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>defaultCache [
	^ IdentityDictionary new 
		at: #processorsAndFilters put: (IdentityDictionary new: 100); " not a limitation, just a reasonable start size "
		at: #processorsAndStreamed put: (IdentityDictionary new: 100); " not a limitation, just a reasonable start size "
		yourself
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>defaultContinuing [
	^ false
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>defaultText [
	^ ''
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>defaultTextLowercase [
	^ self textTrimmed asLowercase
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>defaultTextTrimmed [
	^ self text trimBoth
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>doContinueFilterForProcessor: aGTProcessor [
	self processor: aGTProcessor.
	self filter: ((self cache at: #processorsAndFilters) at: aGTProcessor).
	self streamed: ((self cache at: #processorsAndStreamed) at: aGTProcessor).

	^ aGTProcessor withItemsLimit: aGTProcessor continueItemsLimit do: [ filter value: self ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>doFilter: aGTFilter forProcessor: aGTProcessor [
	self processor: aGTProcessor.
	self filter: aGTFilter.
	self streamed: (OrderedCollection new: 100). " not a limitation, just a reasonable start size "
	(self cache at: #processorsAndFilters) at: aGTProcessor put: aGTFilter.
	(self cache at: #processorsAndStreamed) at: aGTProcessor put: streamed.
	^ aGTFilter value: self
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>equals: aContext [
	aContext ifNil: [ ^ false ].
   ^ self matches: aContext search
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>exceptionHandler [
	self flag: 'Bloc -> overrides doesNotUnderstand discarding the current exception context'.
	^ GTCurrentSpotterExceptionHandler value ifNil: [ self step exceptionHandler ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>filter [
	^ filter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>filter: anObject [
	filter := anObject
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>initialize [
	super initialize.
	
	cache := self defaultCache.
	text := self defaultText.
	continuing := self defaultContinuing.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>isContinuing [
	^ self continuing 
		and: [ self streamed isEmptyOrNil not 
			and: [ self canContinue ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>isEmpty [
	^ self text isNil
		or: [ self textTrimmed isEmpty ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>itemsLimit [
	^ self processor itemsLimit
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>matches: aString [
	^ self isEmpty not
		and: [ self search = aString ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>notEmpty [
	^ self isEmpty not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>processor [
	^ processor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>processor: anObject [
	processor := anObject
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>removeCacheAt: aSymbol [
	^ self cache removeKey: aSymbol ifAbsent: [ nil ]
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>search [
	^ search
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>search: anObject [
	" search stores the fully entered text (including categories) "
	search := anObject
]

{
	#category : #accessing-dynamic,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>spotter [
	^ self step spotter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>step [
	^ step
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>step: anObject [
	step := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>stream [
	^ stream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>stream: anObject [
	stream := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>streamed [
	^ streamed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>streamed: anObject [
	streamed := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>text [
	^ text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>text: anObject [
	text := anObject ifNil: [ self defaultText ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>textLowercase [
	^ textLowercase ifNil: [ textLowercase := self defaultTextLowercase ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>textTrimmed [
	^ textTrimmed ifNil: [ textTrimmed := self defaultTextTrimmed ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContext>>withContinue: aBoolean do: aBlock [
	| previousContinuing |
	previousContinuing := continuing.
	^ [ continuing := aBoolean. aBlock value ]
		ensure: [ continuing := previousContinuing ]
]
