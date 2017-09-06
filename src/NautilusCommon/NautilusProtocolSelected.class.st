"
I announce when a protocol is selected, and also contain an information about selected package and class
"
Class {
	#name : #NautilusProtocolSelected,
	#superclass : #NautilusSelectionAnnouncement,
	#category : #NautilusCommon-Announcements,
	#timestamp : 'YuriyTymchuk 9/4/2015 11:43'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusProtocolSelected class>>package: aPackage class: aClass protocol: aProtocol [

	^ self new
		selectedPackage: aPackage;
		selectedClass: aClass;
		selectedProtocol: aProtocol;
		yourself
]
