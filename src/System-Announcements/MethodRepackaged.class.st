"
Notify about repackaging of a method
"
Class {
	#name : #MethodRepackaged,
	#superclass : #MethodAnnouncement,
	#instVars : [
		'newPackage',
		'oldPackage'
	],
	#category : #System-Announcements-System-Packages,
	#timestamp : 'TorstenBergmann 2/12/2014 22:57'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRepackaged class>>methodRepackaged: aMethod oldPackage: oldPackage newPackage: newPackage [
	^self new
			method: aMethod;
			oldPackage: oldPackage;
			newPackage: newPackage;
			yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRepackaged>>methodRepackaged [
	
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRepackaged>>newPackage [
	
	^ newPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRepackaged>>newPackage: anObject [
	
	newPackage := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRepackaged>>oldPackage [
	
	^ oldPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRepackaged>>oldPackage: anObject [
	
	oldPackage := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRepackaged>>packagesAffected [
	^{oldPackage. newPackage}
]
