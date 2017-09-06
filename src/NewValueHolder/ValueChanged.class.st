"
A ValueChanged is an announcement raised when a value of a NewValueHolder is changed
"
Class {
	#name : #ValueChanged,
	#superclass : #Announcement,
	#instVars : [
		'newValue',
		'oldValue'
	],
	#category : #NewValueHolder,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueChanged class>>newValue: newContents [

	^ self new
		newValue: newContents;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueChanged class>>oldValue: oldContent newValue: newValue [

	^ self new
		newValue: newValue;
		oldValue: oldContent;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueChanged>>newValue [

	^ newValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueChanged>>newValue: anObject [
	
	newValue := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueChanged>>oldValue [

	^ oldValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ValueChanged>>oldValue: anObject [
	
	oldValue := anObject
]
