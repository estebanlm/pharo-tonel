Extension {
	#name : #RPackageOrganizer
}

{
	#category : #'*Monticello-RPackage',
	#timestamp : ' 8/31/2017 07:17:01'
}
RPackageOrganizer class>>allManagers [

	^ MCWorkingCopy allManagers
]

{
	#category : #'*Monticello-RPackage',
	#timestamp : ' 8/31/2017 07:17:01'
}
RPackageOrganizer>>allManagers [

	^ self class allManagers 
]

{
	#category : #'*Monticello-RPackage',
	#timestamp : ' 8/31/2017 07:17:01'
}
RPackageOrganizer>>basicInitializeFromMC [

	self basicInitializeFromPackagesList: (self allManagers collect: [ :workingCopy | workingCopy packageName]).
]

{
	#category : #'*Monticello-RPackage',
	#timestamp : ' 8/31/2017 07:17:01'
}
RPackageOrganizer class>>initializeDefaultFromMC [

	"self initializeDefaultFromMC"
	self setDefault:  self new initializeFromMC.
]

{
	#category : #'*Monticello-RPackage',
	#timestamp : ' 8/31/2017 07:17:01'
}
RPackageOrganizer>>initializeFromMC [
 	RPackage 
		withOrganizer: self  
		do:  [  self basicInitializeFromMC ].

]

{
	#category : #'*Monticello-RPackage',
	#timestamp : ' 8/31/2017 07:17:01'
}
RPackageOrganizer>>isDefinedAsPackageOrSubPackageInMC: aSymbol [
	"a category has been added. "
	
	^ self allManagers anySatisfy: [ :each | 
		self 
			category: each packageName asSymbol 
			matches: aSymbol ]
]

{
	#category : #'*Monticello-RPackage',
	#timestamp : ' 8/31/2017 07:17:01'
}
RPackageOrganizer>>updateAfterNewMCPackageRegistred: anAnnouncement [
	"User create a new package, MCWorkingCopy propagates changes. We react accordingly."
	|  name |
	
	name := anAnnouncement package name.
	(self packageExactlyMatchingExtensionName: name) 
		ifNil: [ self ensureExistAndRegisterPackageNamed: name ]
]

{
	#category : #'*Monticello-RPackage',
	#timestamp : ' 8/31/2017 07:17:01'
}
RPackageOrganizer>>updateAfterNewMCPackageUnregistred: anAnnouncement [

]
