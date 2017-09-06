"
the annoucement will be emitted when renaming a class or a trait using:  
	=> RenameClassRefactoring >> rename:to:
	=> class>>rename:
The corresponding event is raised in: SystemDictionary>>renameClass:from:to:
"
Class {
	#name : #ClassRenamed,
	#superclass : #ClassAnnouncement,
	#instVars : [
		'category',
		'classRenamed',
		'newName',
		'oldName'
	],
	#category : #System-Announcements-System-Classes,
	#timestamp : 'cyrilledelaunay 1/18/2011 11:44'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRenamed class>>class: aClass category: aCategoryName oldName: anOldClassName newName: aNewClassName [
	^self new
			classRenamed: aClass;
			category: aCategoryName;
			oldName: anOldClassName;
			newName: aNewClassName;
			yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRenamed>>category [
	
	^ category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRenamed>>category: anObject [
	
	category := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRenamed>>classAffected [
	^self classRenamed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRenamed>>classRenamed [
	
	^ classRenamed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRenamed>>classRenamed: anObject [
	
	classRenamed := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRenamed>>newName [
	^newName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRenamed>>newName: anObject [
	
	newName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRenamed>>oldName [
	^oldName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRenamed>>oldName: anObject [
	
	oldName := anObject
]
