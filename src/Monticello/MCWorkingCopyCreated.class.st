"
A MCWorkingCopyCreated is a announcement raised when a new MCWorkingCopy is created
"
Class {
	#name : #MCWorkingCopyCreated,
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
MCWorkingCopyCreated class>>workingCopy: workingCopy [

	^ self new
		workingCopy: workingCopy;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingCopyCreated class>>workingCopy: aWC package: package [

	^ self new
		workingCopy: aWC;
		package: package;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingCopyCreated>>package [
	^ package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingCopyCreated>>package: anObject [
	package := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingCopyCreated>>workingCopy [
	^ workingCopy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWorkingCopyCreated>>workingCopy: anObject [
	workingCopy := anObject
]
