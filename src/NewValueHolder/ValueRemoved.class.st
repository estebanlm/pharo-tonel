"
A ValueRemoved  is an announcement raised when an item (or a collection of items) was removed from CollectionValueHolder.
"
Class {
	#name : #ValueRemoved,
	#superclass : #Announcement,
	#instVars : [
		'oldValue'
	],
	#category : #NewValueHolder,
	#timestamp : 'PeterUhnak 3/5/2016 11:41'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueRemoved class>>oldValue: oldValue [
	^ self new
		oldValue: oldValue;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueRemoved>>oldValue [
	^ oldValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueRemoved>>oldValue: anObject [
	oldValue := anObject
]
