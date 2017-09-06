"
I announce when a package is selected
"
Class {
	#name : #NautilusPackageSelected,
	#superclass : #NautilusSelectionAnnouncement,
	#category : #NautilusCommon-Announcements,
	#timestamp : 'YuriyTymchuk 9/4/2015 11:42'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPackageSelected class>>package: aPackage [

	^ self new
		selectedPackage: aPackage;
		yourself
]
