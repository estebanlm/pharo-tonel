"
This announcement will be emitted when a class or a traits superclass is renamed.

The class definition and structure may be unaffected if just the name of the superclass changes. But tools
showing the class definition or package organizer depending on the changed class definition string/command and 
may need to be updated or track the changes.
"
Class {
	#name : #ClassParentRenamed,
	#superclass : #ClassAnnouncement,
	#instVars : [
		'classAffected',
		'parentOldName',
		'parentNewName'
	],
	#category : #System-Announcements-System-Classes,
	#timestamp : 'NicolaiHess 11/20/2015 20:47'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassParentRenamed class>>classParentOf: aClass renamedFrom: oldName to: newName [
	^ self new
		parentOldName: oldName;
		parentNewName: newName;
		classAffected: aClass;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassParentRenamed>>classAffected [
	^ classAffected
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassParentRenamed>>classAffected: anObject [
	classAffected := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassParentRenamed>>parentNewName [
	^ parentNewName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassParentRenamed>>parentNewName: anObject [
	parentNewName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassParentRenamed>>parentOldName [
	^ parentOldName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassParentRenamed>>parentOldName: anObject [
	parentOldName := anObject
]
