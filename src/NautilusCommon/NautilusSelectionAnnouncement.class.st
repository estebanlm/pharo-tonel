"
I am a common superclass for package, class, protocol and method selection. I contain all the state and functionality, my subclasses are there only to allow the distinction between announcements
"
Class {
	#name : #NautilusSelectionAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'package',
		'class',
		'protocol',
		'method'
	],
	#category : #NautilusCommon-Announcements,
	#timestamp : 'YuriyTymchuk 9/13/2015 18:56'
}

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusSelectionAnnouncement>>category [

	^ self selectedProtocol
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusSelectionAnnouncement>>itemClass [

	^ self selectedClass 
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusSelectionAnnouncement>>method [

	^ self selectedMethod 
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusSelectionAnnouncement>>package [

	^ self selectedPackage 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusSelectionAnnouncement>>selectedClass [
	^ class
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusSelectionAnnouncement>>selectedClass: anObject [
	class := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusSelectionAnnouncement>>selectedMethod [
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusSelectionAnnouncement>>selectedMethod: anObject [
	method := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusSelectionAnnouncement>>selectedPackage [
	^ package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusSelectionAnnouncement>>selectedPackage: anObject [
	package := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusSelectionAnnouncement>>selectedProtocol [
	^ protocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusSelectionAnnouncement>>selectedProtocol: anObject [
	protocol := anObject
]
