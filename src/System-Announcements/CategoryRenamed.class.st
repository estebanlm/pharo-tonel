"
This announcement will be emited when renaming a category using:
=> SystemOrganizer >> renameCategory:toBe:
"
Class {
	#name : #CategoryRenamed,
	#superclass : #SystemAnnouncement,
	#instVars : [
		'from',
		'to',
		'newCategoryName',
		'oldCategoryName'
	],
	#category : #System-Announcements-System-Categories,
	#timestamp : 'cyrilledelaunay 1/18/2011 12:26'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
CategoryRenamed class>>classCategoryRenamedFrom: anOldCategoryName to: aNewCategoryName [
	^self new
			newCategoryName: aNewCategoryName;
			oldCategoryName: anOldCategoryName;
			yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
CategoryRenamed>>newCategoryName [
	^newCategoryName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
CategoryRenamed>>newCategoryName: aCategoryName [
	newCategoryName := aCategoryName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
CategoryRenamed>>oldCategoryName [
	^oldCategoryName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
CategoryRenamed>>oldCategoryName: aCategoryName [
	oldCategoryName := aCategoryName
]
