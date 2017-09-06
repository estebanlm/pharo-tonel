"
This announcement will be emitted when a class or a trait is added, using:
	=> Trait >> named: (the notification is done in Trait >> named:uses:category:env:)
	=> Class >> subclass:
	
"
Class {
	#name : #ClassAdded,
	#superclass : #ClassAnnouncement,
	#instVars : [
		'classAdded',
		'classCategory'
	],
	#category : #System-Announcements-System-Classes,
	#timestamp : 'cyrilledelaunay 1/18/2011 11:56'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassAdded class>>class: aClass category: aClassCategoryName [
	^self new
			classAdded: aClass;
			classCategory: aClassCategoryName;
			yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassAdded>>classAdded [
	^classAdded
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassAdded>>classAdded: aClass [
	classAdded := aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassAdded>>classAffected [
	^self classAdded
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassAdded>>classCategory [
	^classCategory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassAdded>>classCategory: aClassCategoryName [
	classCategory := aClassCategoryName
]
