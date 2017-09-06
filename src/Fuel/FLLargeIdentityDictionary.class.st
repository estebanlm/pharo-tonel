"
I am an IdentityDictionary optimized for including a large number of elements.
"
Class {
	#name : #FLLargeIdentityDictionary,
	#superclass : #FLLargeIdentityHashedCollection,
	#instVars : [
		'keys',
		'values'
	],
	#category : #Fuel-Collections,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>at: key [

	| hash |
	(keys at: (hash := key largeIdentityHash \\ 4096 + 1)) ifNotNil: [ :keyList | 
		1 to: (tallies at: hash) do: [ :index |
			(keyList at: index) == key ifTrue: [
				^(values at: hash) at: index ] ] ].
	self errorKeyNotFound: key
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>at: key ifAbsent: aBlock [

	| hash |
	(keys at: (hash := key largeIdentityHash \\ 4096 + 1)) ifNotNil: [ :keyList | 
		1 to: (tallies at: hash) do: [ :index |
			(keyList at: index) == key ifTrue: [
				^(values at: hash) at: index ] ] ].
	^aBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>at: key ifAbsentPut: aBlock  [
	"Return the value at the given key. 
	If key is not included in the receiver store the result 
	of evaluating aBlock as new value."

	^ self at: key ifAbsent: [self at: key put: aBlock value]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>at: key ifPresent: presentBlock ifAbsent: absentBlock [

	| hash |
	(keys at: (hash := key largeIdentityHash + 1)) ifNotNil: [ :keyList | 
		1 to: (tallies at: hash) do: [ :index |
			(keyList at: index) == key ifTrue: [
				^ presentBlock cull: ((values at: hash) at: index) ] ] ].
	^absentBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>at: key put: value [

	| hash |
	(keys at: (hash := key largeIdentityHash \\ 4096 + 1))
		ifNil: [ 
			keys at: hash put: (Array with: key).
			values at: hash put: (Array with: value).
			tallies at: hash put: 1.
			tally := tally + 1 ]
		ifNotNil: [ :keyList | 
			| newIndex |
			1 to: (tallies at: hash) do: [ :index |
				(keyList at: index) == key ifTrue: [
					^(values at: hash) at: index put: value ] ].
			tally := tally + 1.
			keyList size < (newIndex := (tallies at: hash) + 1)
				ifFalse: [ 
					keyList at: newIndex put: key.
					(values at: hash) at: newIndex put: value ]
				ifTrue: [
					| newList |
					(newList := Array new: keyList size * 2)
						replaceFrom: 1 
						to: keyList size
						with: keyList
						startingAt: 1;
						at: newIndex put: key.
					keys at: hash put: newList.
					(newList := Array new: keyList size * 2)
						replaceFrom: 1 
						to: keyList size
						with: (values at: hash)
						startingAt: 1;
						at: newIndex put: value.
					values at: hash put: newList ].
			tallies at: hash put: newIndex ].
	^value
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>do: aBlock [

	^self valuesDo: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>errorKeyNotFound: aKey [

	KeyNotFound signalFor: aKey
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>includesKey: key [

	| hash |
	^(keys at: (hash := key largeIdentityHash \\ 4096 + 1))
		ifNil: [ false ]
		ifNotNil: [ :keyList | 
			key 
				ifNotNil: [ keyList fuelPointsTo: key ]
				ifNil: [
					1 to: (tallies at: hash) do: [ :index |
						(keyList at: index) == key ifTrue: [ ^true ] ].
					false ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>initialize [

	super initialize.
	keys := Array new: 4096.
	values := Array new: 4096
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>keys [

	^Array new: tally streamContents: [ :stream |
		self keysDo: [ :key | stream nextPut: key ] ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>keysAndValuesDo: aBlock [

	tally = 0 ifTrue: [ ^self ].
	1 to: 4096 do: [ :arrayIndex |
		| keyArray valueArray |
		keyArray := keys at: arrayIndex.
		valueArray := values at: arrayIndex.
		1 to: (tallies at: arrayIndex) do: [ :index |
			aBlock
				value: (keyArray at: index)
				value: (valueArray at: index) ] ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>keysDo: aBlock [

	tally = 0 ifTrue: [ ^self ].
	1 to: 4096 do: [ :arrayIndex |
		| keyArray |
		keyArray := keys at: arrayIndex.
		1 to: (tallies at: arrayIndex) do: [ :index |
			aBlock value: (keyArray at: index) ] ]
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>postCopy [

	super postCopy.
	keys := keys copy.
	values := values copy.
	1 to: 4096 do: [ :index |
		(keys at: index) ifNotNil: [ :list |
			keys at: index put: list copy.
			values at: index put: (values at: index) copy ] ]
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>removeKey: key ifAbsent: aBlock [

	| hash |
	(keys at: (hash := key largeIdentityHash \\ 4096 + 1)) ifNotNil: [ :keyList |
		| size |
		1 to: (size := tallies at: hash) do: [ :index |
			(keyList at: index) == key ifTrue: [
				| valueList |
				keyList
					at: index put: (keyList at: size);
					at: size put: nil.
				(valueList := values at: hash)
					at: index put: (valueList at: size);
					at: size put: nil.
				(size := size - 1) < (keyList size // 4) ifTrue: [
					| newList |
					newList := Array new: size * 2.
					newList
						replaceFrom: 1
						to: size
						with: keyList
						startingAt: 1.
					keys at: hash put: newList.
					newList := Array new: size * 2.
					newList
						replaceFrom: 1
						to: size
						with: valueList
						startingAt: 1.
					values at: hash put: newList ].
				tallies at: hash put: size.
				tally := tally - 1.
				^key ] ] ].
	^aBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>values [

	^Array new: tally streamContents: [ :stream |
		self valuesDo: [ :value | stream nextPut: value ] ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLargeIdentityDictionary>>valuesDo: aBlock [

	tally = 0 ifTrue: [ ^self ].
	1 to: 4096 do: [ :arrayIndex |
		| valueArray |
		valueArray := values at: arrayIndex.
		1 to: (tallies at: arrayIndex) do: [ :index |
			aBlock value: (valueArray at: index) ] ]
]
