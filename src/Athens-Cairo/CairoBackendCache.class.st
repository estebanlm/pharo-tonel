"
I providing a simple [weak]key->value storage used to cache various objects used by Athens for Cairo backend, like fonts/forms etc.

The cache is global (there's only a single instance of me used at a time) and
cache is visible globally by all entities of Cairo backend.

The cached objects is held weakly.
The cache is flushed for a new image session.
"
Class {
	#name : #CairoBackendCache,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#pools : [
		'AthensCairoDefs'
	],
	#classInstVars : [
		'soleInstance',
		'session'
	],
	#category : #Athens-Cairo,
	#timestamp : '<historical>'
}

{
	#category : #'session management',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoBackendCache class>>checkSession [
	session == Smalltalk session ifFalse: [ 
		soleInstance := nil.
		session := Smalltalk session ]
]

{
	#category : #flushing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoBackendCache class>>flush [
	self soleInstance flush
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoBackendCache class>>new  [
	self error: 'Use #soleInstance'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoBackendCache class>>soleInstance [
	self checkSession.
	^ soleInstance ifNil: [ soleInstance := super new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoBackendCache>>at: anObject  [

	^ cache at: anObject  ifAbsent: nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoBackendCache>>at: anObject ifAbsentPut: aBlock [

	^ cache at: anObject  ifAbsentPut: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoBackendCache>>flush [

	cache := WeakIdentityKeyDictionary new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoBackendCache>>for: anObject at: key ifAbsentPut: aBlock [

	| subCache |
	subCache := cache 
		at: anObject
		ifAbsentPut: [ WeakIdentityKeyDictionary new ].

	^ subCache at: key ifAbsentPut: aBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoBackendCache>>initialize [

	self flush
]

{
	#category : #removeMe,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoBackendCache>>nbSessionChanged [

	self initialize.
	
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoBackendCache>>removeAt: anObject [

	^ cache removeKey: anObject  ifAbsent: nil
]
