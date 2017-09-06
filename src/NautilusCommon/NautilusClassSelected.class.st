"
I announce when a class is selected, and also contain an information about selected package
"
Class {
	#name : #NautilusClassSelected,
	#superclass : #NautilusSelectionAnnouncement,
	#category : #NautilusCommon-Announcements,
	#timestamp : 'YuriyTymchuk 9/4/2015 11:43'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusClassSelected class>>package: aPackage class: aClass [

	^ self new
		selectedPackage: aPackage;
		selectedClass: aClass;
		yourself
]
