"
I announce when a method is selected, and also contain an information about selected package, class and protocol
"
Class {
	#name : #NautilusMethodSelected,
	#superclass : #NautilusSelectionAnnouncement,
	#category : #NautilusCommon-Announcements,
	#timestamp : 'YuriyTymchuk 9/4/2015 11:43'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusMethodSelected class>>package: aPackage class: aClass protocol: aProtocol method: aMethod [

	^ self new
		selectedPackage: aPackage;
		selectedClass: aClass;
		selectedProtocol: aProtocol;
		selectedMethod: aMethod;
		yourself
]
