"
This announcement will be emited when removing a category using:
=> SystemOrganizer >> removeCategory:
"
Class {
	#name : #CategoryRemoved,
	#superclass : #SystemAnnouncement,
	#instVars : [
		'categoryName'
	],
	#category : #System-Announcements-System-Categories,
	#timestamp : 'cyrilledelaunay 1/18/2011 12:28'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
CategoryRemoved class>>categoryName: aCategoryName [
	^self new
			categoryName: aCategoryName;
			yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
CategoryRemoved>>categoryName [
	^categoryName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
CategoryRemoved>>categoryName: aCategoryName [
	categoryName := aCategoryName
]
