"
An MCPackageModified is raised when a MCPackage is modified
"
Class {
	#name : #MCPackageModified,
	#superclass : #Announcement,
	#instVars : [
		'package'
	],
	#category : #Monticello-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageModified class>>package: aMCPackage [

	^ self new package: aMCPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageModified>>package [

		^ package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageModified>>package: anObject [
	
		package := anObject
]
