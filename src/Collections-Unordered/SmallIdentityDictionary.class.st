"
I'm a SmallDictionary (this means faster than default one when dealing with limited number of items)
but I check my key based on identity.
"
Class {
	#name : #SmallIdentityDictionary,
	#superclass : #SmallDictionary,
	#category : #Collections-Unordered,
	#timestamp : 'sd 7/21/2009 10:12'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:00'
}
SmallIdentityDictionary>>findIndexForKey: aKey  [
	^ keys identityIndexOf: aKey
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:00'
}
SmallIdentityDictionary>>setClass [
	^ IdentitySet
]
