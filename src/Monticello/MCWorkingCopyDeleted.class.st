"
A MCWorkingCopyDeleted class is an announcement raised when a MCWorkingCopy is removed
"
Class {
	#name : #MCWorkingCopyDeleted,
	#superclass : #Announcement,
	#instVars : [
		'package',
		'workingCopy'
	],
	#category : #Monticello-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingCopyDeleted class>>workingCopy: workingCopy [

	^ self new
		workingCopy: workingCopy;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingCopyDeleted class>>workingCopy: aWC package: package [

	^ self new
		workingCopy: aWC;
		package: package;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingCopyDeleted>>package [
	^ package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingCopyDeleted>>package: anObject [
	package := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingCopyDeleted>>workingCopy [
	^ workingCopy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingCopyDeleted>>workingCopy: anObject [
	workingCopy := anObject
]
