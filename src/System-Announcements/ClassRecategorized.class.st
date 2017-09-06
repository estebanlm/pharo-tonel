"
This announcement will be raised when:
- we set a category to a class (see 'Class >>category:')
- we set a category to a Trait (see Trait>>category:)

It corresponds to the RecategorizedEvent
"
Class {
	#name : #ClassRecategorized,
	#superclass : #ClassAnnouncement,
	#instVars : [
		'newCategory',
		'oldCategory',
		'classRecategorized'
	],
	#category : #System-Announcements-System-Classes,
	#timestamp : 'cyrilledelaunay 1/18/2011 10:42'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRecategorized class>>class: aClass recategorizedFrom: oldCategory to: newCategory [
	^self new
			classRecategorized: aClass;
			oldCategory: oldCategory;
			newCategory: newCategory;
			yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRecategorized>>classAffected [
	^self classRecategorized
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRecategorized>>classRecategorized [
	^classRecategorized
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRecategorized>>classRecategorized: aClass [
	classRecategorized := aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRecategorized>>newCategory  [
	^newCategory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRecategorized>>newCategory: aNewCategory [
	newCategory := aNewCategory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRecategorized>>oldCategory [
	^oldCategory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRecategorized>>oldCategory: anOldCategory [
	oldCategory := anOldCategory
]
