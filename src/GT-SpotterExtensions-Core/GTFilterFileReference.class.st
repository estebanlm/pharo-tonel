"

"
Class {
	#name : #GTFilterFileReference,
	#superclass : #GTFilterSubstring,
	#category : #GT-SpotterExtensions-Core,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterFileReference>>indexForItemName: aString andQuery: aQueryString [
	^ aQueryString isEmpty
		ifTrue: [ 1 ] " if the modified query is empty, take all items -> index = 1 "
		ifFalse: [ super indexForItemName: aString andQuery: aQueryString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterFileReference>>queryForItem: each [
	self flag: 'this is an ugly hack for #queryForFileReference. The iterator will manipulate the query being used for each item'.
	^ self context cacheAt: #queryForFileReference ifAbsent: [ query ] " performance optimization "
]
