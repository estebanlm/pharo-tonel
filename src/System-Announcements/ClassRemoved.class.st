"
the annoucement will be emitted when removing a class or a trait using:  
	=> removeFromSystem
"
Class {
	#name : #ClassRemoved,
	#superclass : #ClassAnnouncement,
	#instVars : [
		'categoryName',
		'classRemoved',
		'ownerPackage'
	],
	#category : #System-Announcements-System-Classes,
	#timestamp : 'cyrilledelaunay 1/18/2011 11:43'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRemoved class>>class: aClass category: aCategoryName [
	^self new
			classRemoved: aClass;
			categoryName: aCategoryName;
			yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRemoved>>categoryName [
	
	^ categoryName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRemoved>>categoryName: anObject [
	
	categoryName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRemoved>>classAffected [
	^self classRemoved
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRemoved>>classRemoved [
	
	^ classRemoved
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRemoved>>classRemoved: aClass [
	
	classRemoved := aClass.
	ownerPackage := aClass package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRemoved>>classTagAffected [
	^ownerPackage toTagName: categoryName 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRemoved>>packageAffected [
	^ownerPackage
]
