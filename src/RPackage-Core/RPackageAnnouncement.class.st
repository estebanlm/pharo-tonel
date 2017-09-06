"
Common superclass for package related announcements
"
Class {
	#name : #RPackageAnnouncement,
	#superclass : #SystemAnnouncement,
	#instVars : [
		'package'
	],
	#category : #RPackage-Core,
	#timestamp : 'TorstenBergmann 2/12/2014 22:55'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageAnnouncement class>>to: aPackage [

	^ self new package: aPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageAnnouncement>>package [

	^ package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageAnnouncement>>package: anObject [

	package := anObject
]
