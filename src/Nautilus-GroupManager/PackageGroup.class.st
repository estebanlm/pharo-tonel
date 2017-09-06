"
A group containing packages
"
Class {
	#name : #PackageGroup,
	#superclass : #Group,
	#instVars : [
		'packages',
		'browsedEnvironment'
	],
	#category : #Nautilus-GroupManager,
	#timestamp : 'FranckWarlouzet 7/7/2015 09:21'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageGroup class>>named: aString packages: aCollectionOfPackages [
	^ self new
		name: aString;
		packages: aCollectionOfPackages;
		yourself
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageGroup>>addPackages: aCollection [
	aCollection do: [ :each | packages addIfNotPresent: each ].
	GroupAnnouncer uniqueInstance announce: (AGroupContentHasBeenModified group: self)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageGroup>>browsedEnvironment [
	^ browsedEnvironment ifNil: [ browsedEnvironment := RBBrowserEnvironment new ]
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageGroup>>classes [
	| classes |
	classes := OrderedCollection new.
	packages do: [ :package | package classes do: [ :class | classes addIfNotPresent: class ] ].
	^ classes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageGroup>>elements [
	^ packages sorted
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageGroup>>hasClassNamed: aClassName [
	^ packages anySatisfy: [ :package | package classes anySatisfy: [ :class | class name = aClassName ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageGroup>>initialize [
	super initialize.
	packages := OrderedCollection new. 
	self browsedEnvironment packageOrganizer announcer weak when: RPackageUnregistered send: #packageRemoved: to: self
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageGroup>>packageRemoved: anAnnouncement [
	packages remove: anAnnouncement package ifAbsent: [  ].
	GroupAnnouncer uniqueInstance announce: (AGroupContentHasBeenModified group: self)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageGroup>>packages: aCollection [
	packages := aCollection
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageGroup>>removeAllPackages [
	packages removeAll.
	GroupAnnouncer uniqueInstance announce: (AGroupContentHasBeenModified group: self)
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageGroup>>removePackages: aCollection [
	packages removeAll: aCollection.
	GroupAnnouncer uniqueInstance announce: (AGroupContentHasBeenModified group: self)
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageGroup>>renameTo: aNewName [
	(aNewName isNil or: [aNewName isEmpty]) ifTrue: [^ self].
	self name: aNewName
]
