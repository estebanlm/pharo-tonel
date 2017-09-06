"
A ValueAdded is an announcement raised when an item (or a collection of items) was added to CollectionValueHolder.
"
Class {
	#name : #ValueAdded,
	#superclass : #Announcement,
	#instVars : [
		'newValue'
	],
	#category : #NewValueHolder,
	#timestamp : 'PeterUhnak 3/5/2016 11:41'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueAdded class>>newValue: newValue [
	^ self new
		newValue: newValue;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueAdded>>newValue [
	^ newValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueAdded>>newValue: anObject [
	newValue := anObject
]
