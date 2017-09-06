"
Common superclass for RPackage related tests
"
Class {
	#name : #RPackageTestCase,
	#superclass : #TestCase,
	#instVars : [
		'announcerForTest',
		'oldSystemAnnouncer',
		'createdClasses',
		'createdPackages',
		'createdCategories'
	],
	#category : #RPackage-Tests,
	#timestamp : 'TorstenBergmann 2/12/2014 22:58'
}

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>allManagers [

	^ MCWorkingCopy allManagers
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>createNewClassNamed: aName [
	^ self createNewClassNamed: aName inCategory: 'RPackageTest'
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>createNewClassNamed: aName inCategory: cat [
	
	| cls |
	cls := Object subclass: aName
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: cat.
	createdClasses add: cls.
	createdCategories add: cat.
	^ cls
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>createNewClassNamed: aName inPackage: p [
	
	| cls |
	cls := self createNewClassNamed: aName.
	p addClassDefinition: cls.
	^ cls
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>createNewPackageNamed: aName [

	| pack |
	self removePackage: aName.
	pack := self packageClass named: aName.
	createdPackages add: pack.
	^ pack
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>createNewTraitNamed: aName [
	^ self createNewTraitNamed: aName inCategory: 'RPackageTest'
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>createNewTraitNamed: aName inCategory: cat [
	
	| cls |
	cls := Trait named: aName
			uses: {}
			category: cat.
	createdClasses add: cls.
	createdCategories add: cat.
	^ cls
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>createNewTraitNamed: aName inPackage: p [
	
	| cls |
	cls := self createNewTraitNamed: aName.
	p addClassDefinition: cls.
	^ cls
]

{
	#category : #'announcer handling',
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>initializeAnnouncers [
	oldSystemAnnouncer := SystemAnnouncer uniqueInstance.

	SystemAnnouncer announcer: (announcerForTest := SystemAnnouncer new).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>organizer [
	"This method will access the organizer that will temporarily swapped using the withOrganizer:do: method"
	^ self packageClass organizer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>packageClass  [
	"returns the system class that represents Packages"
	^ RPackage 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>packageOrganizerClass  [
	"returns the package organizer class"
	^ RPackageOrganizer
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>removePackage: aName [
	self packageClass organizer basicUnregisterPackageNamed: aName.
	
]

{
	#category : #'announcer handling',
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>restoreAnnouncers [
	SystemAnnouncer announcer: oldSystemAnnouncer.

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>runCase [
	[
	self initializeAnnouncers.
	
	^ self packageClass 
		withOrganizer: self setupOrganizer
		do: [ 
			self resources do: [:each | each availableFor: self].
			self setUp.
			self performTest
			]
	] ensure: [ 
		self tearDown.
		self restoreAnnouncers.
		self cleanUpInstanceVariables
	]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>setUp [
	
	createdClasses := OrderedCollection new.
	createdPackages := OrderedCollection new.
	createdCategories := Set new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageTestCase>>setupOrganizer [
	^ self packageOrganizerClass basicNew initialize; debuggingName: 'Organizer for RPackageTest'; yourself
]
