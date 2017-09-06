"
A GroupAreadyExists is an exception raised when a group with the provided name already exists
"
Class {
	#name : #GroupAlreadyExists,
	#superclass : #Error,
	#instVars : [
		'groupName'
	],
	#category : #Nautilus-GroupManager,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupAlreadyExists class>>groupName: groupName [

	^ self new
		groupName: groupName;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupAlreadyExists>>groupName [
	^ groupName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupAlreadyExists>>groupName: anObject [
	groupName := anObject
]
