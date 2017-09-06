"
I am an abstract class used to gather all the announcements related to class modifications.
"
Class {
	#name : #ClassAnnouncement,
	#superclass : #SystemAnnouncement,
	#category : #System-Announcements-System-Classes,
	#timestamp : 'BenjaminVanRyseghem 1/23/2014 11:53'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassAnnouncement>>classAffected [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassAnnouncement>>classTagAffected [
	^self packageAffected toTagName: self classAffected category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassAnnouncement>>packageAffected [
	^self classAffected package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassAnnouncement>>packagesAffected [
	^{self packageAffected}
]
