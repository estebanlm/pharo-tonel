"
An entry for the FreeTypeCache
"
Class {
	#name : #FreeTypeCacheEntry,
	#superclass : #Link,
	#instVars : [
		'font',
		'charCode',
		'type',
		'object',
		'previousLink'
	],
	#category : #FreeType-Cache,
	#timestamp : 'TorstenBergmann 2/4/2014 22:09'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeCacheEntry>>= aFreeTypeCacheEntry [
	"equailty based on font,charcode, type, object, but not nextLink"
	
	(aFreeTypeCacheEntry isKindOf: FreeTypeCacheEntry) 
		ifFalse:[^false].
	^font = aFreeTypeCacheEntry font and: [
		charCode = aFreeTypeCacheEntry charCode
			and: [type = aFreeTypeCacheEntry type
				and:[object = aFreeTypeCacheEntry object]]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeCacheEntry>>charCode [
	"Answer the value of charCode"

	^ charCode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeCacheEntry>>charCode: anObject [
	"Set the value of charCode"

	charCode := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeCacheEntry>>font [
	"Answer the value of font"

	^ font
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeCacheEntry>>font: anObject [
	"Set the value of font"

	font := anObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeCacheEntry>>hash [
	^charCode hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeCacheEntry>>object [
	"Answer the value of object"

	^ object
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeCacheEntry>>object: anObject [
	"Set the value of object"

	object := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeCacheEntry>>previousLink [
	"Answer the value of previousLink"

	^ previousLink
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeCacheEntry>>previousLink: anObject [
	"Set the value of previousLink"

	previousLink := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeCacheEntry>>type [
	"Answer the value of type"

	^ type
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeCacheEntry>>type: anObject [
	"Set the value of type"

	type := anObject
]
