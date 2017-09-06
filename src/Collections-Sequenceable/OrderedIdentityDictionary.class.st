"
An IdentityDictionary version that uses == instead of = for key comparing.

For more information about my usage, check OrderedDictionary and Dictionary comments.

Examples
------------------

	object := Object new.
	otherObject := Object new.
	dict := OrderedIdentityDictionary new.
	dict
		at: object put: 1;
		at: otherObject put: 2.
	dict.		""returns: an OrderedIdentityDictionary(an Object->1 an Object->2)""
	dict at: object put: 3.
	dict 		""returns: an OrderedIdentityDictionary(an Object->3 an Object->2)""
"
Class {
	#name : #OrderedIdentityDictionary,
	#superclass : #OrderedDictionary,
	#category : #Collections-Sequenceable,
	#timestamp : 'VincentBlondeau 4/1/2016 22:41'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedIdentityDictionary>>dictionaryClass [
	^ IdentityDictionary
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedIdentityDictionary>>indexOfKey: aKey ifAbsent: aBlock [
	^ self identityIndexOfKey: aKey ifAbsent: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedIdentityDictionary>>orderedKeysIndexOf: aKey [
	^ orderedKeys identityIndexOf: aKey
]
