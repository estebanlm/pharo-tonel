"
ZnTooManyDictionaryEntries is signalled when too many entries are added to a limited ZnMultiValueDictionary.

This is a resumable exception

Part of Zinc HTTP Components. 
"
Class {
	#name : #ZnTooManyDictionaryEntries,
	#superclass : #Error,
	#instVars : [
		'limit'
	],
	#category : #Zinc-Resource-Meta-Core,
	#timestamp : 'SvenVanCaekenberghe 5/10/2017 16:44'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnTooManyDictionaryEntries class>>limit: limit [
	^ self new 
		limit: limit; 
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnTooManyDictionaryEntries>>isResumable [
	"Determine whether an exception is resumable."

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnTooManyDictionaryEntries>>limit [
	^ limit
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnTooManyDictionaryEntries>>limit: anObject [
	limit := anObject
]
