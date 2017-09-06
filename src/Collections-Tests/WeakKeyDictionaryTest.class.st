"
SUnit tests for weak key dictionaries
"
Class {
	#name : #WeakKeyDictionaryTest,
	#superclass : #DictionaryTest,
	#instVars : [
		'keys',
		'dict'
	],
	#category : #Collections-Tests-Weak,
	#timestamp : 'TorstenBergmann 2/20/2014 15:22'
}

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakKeyDictionaryTest class>>shouldInheritSelectors [

^true
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakKeyDictionaryTest class>>timingLarge [
	| dict keys size loops |
	
	size := 100000.
	loops := 10.
	
	keys := (1 to: size) collect:[:n| 'foo',n asString].
	Smalltalk garbageCollect.
	dict := WeakKeyDictionary new.
	keys do:[:k| dict at: k put: k].
	Smalltalk garbageCollect.
	^Time millisecondsToRun: [
		loops timesRepeat:[
			dict at: 'bar','0' put: 100.
			Smalltalk garbageCollectMost.
			dict finalizeValues.
		]].

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakKeyDictionaryTest class>>timingMany [
	| dicts keys size loops count |
	
	size := 10.
	count := 10000.
	loops := 10.
	
	keys := (1 to: size) collect:[:n| 'foo',n asString].
	
	dicts := OrderedCollection new.
	count timesRepeat:[ | dict |
		dict := WeakKeyDictionary new.
		keys do:[:k| dict at: k put: k].
		dicts add: dict.
	].
	Smalltalk garbageCollect.
	^Time millisecondsToRun: [
			loops timesRepeat:[
				dicts do: [:d| d finalizeValues].
			]].

]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakKeyDictionaryTest>>classToBeTested [
	^ WeakKeyDictionary
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakKeyDictionaryTest>>setUp [
	keys := (1 to: 1000) collect:[:n| 'key', n asString].
	dict := WeakKeyDictionary new.
	keys do:[:n| dict at: n put: n,n].
	super setUp.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakKeyDictionaryTest>>size [
	"Answer the number of keys that should be used in testing."
	^1000
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakKeyDictionaryTest>>supportsNilKey [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakKeyDictionaryTest>>testClearing [
	keys := nil.
	dict at: self put: nil.
	self assert: dict size = (self size + 1).

	Smalltalk garbageCollect.

	"Keys are gone but not yet finalized."
	self assert: dict size = (self size + 1).
	self assert: dict keys size = 1.
	
	dict finalizeValues.
	
	"Now the size should be adjusted."
	self assert: dict size = 1.
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakKeyDictionaryTest>>testGrow [
	keys := nil.
	dict at: self put: nil.
	Smalltalk garbageCollect.

	"Keys are gone but not yet finalized."
	dict grow.
]
