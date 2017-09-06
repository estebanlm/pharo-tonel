"
This announcement will be emited when adding a category using:
=> SystemOrganizer >> addCategory:
"
Class {
	#name : #CategoryAdded,
	#superclass : #SystemAnnouncement,
	#instVars : [
		'categoryName'
	],
	#category : #System-Announcements-System-Categories,
	#timestamp : 'cyrilledelaunay 1/18/2011 12:29'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
CategoryAdded class>>categoryName: aCategoryName [
	^self new
			categoryName: aCategoryName;
			yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
CategoryAdded>>categoryName [

	^ categoryName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
CategoryAdded>>categoryName: aCategoryName [
	categoryName := aCategoryName
]
