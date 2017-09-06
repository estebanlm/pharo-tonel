"
Notify about repackaging of a class
"
Class {
	#name : #ClassRepackaged,
	#superclass : #ClassAnnouncement,
	#instVars : [
		'classRepackaged',
		'newPackage',
		'oldPackage'
	],
	#category : #System-Announcements-System-Packages,
	#timestamp : 'TorstenBergmann 2/12/2014 22:56'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRepackaged class>>classRepackaged: aClass oldPackage: oldPackage newPackage: newPackage [
	^self new
			classRepackaged: aClass;
			oldPackage: oldPackage;
			newPackage: newPackage;
			yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRepackaged>>classAffected [
	
	^ classRepackaged
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRepackaged>>classRepackaged [
	
	^ classRepackaged
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRepackaged>>classRepackaged: anObject [
	
	classRepackaged := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRepackaged>>newPackage [
	
	^ newPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRepackaged>>newPackage: anObject [
	
	newPackage := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRepackaged>>oldPackage [
	
	^ oldPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRepackaged>>oldPackage: anObject [
	
	oldPackage := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassRepackaged>>packagesAffected [
	^{oldPackage. newPackage}
]
