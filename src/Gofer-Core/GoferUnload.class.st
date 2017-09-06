"
Unload
"
Class {
	#name : #GoferUnload,
	#superclass : #GoferWorking,
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:36'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferUnload>>defaultModel [
	^ (Smalltalk globals at: #MCMultiPackageLoader ifAbsent: [ MCPackageLoader ]) new
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferUnload>>execute [
	self workingCopies 
		do: [ :copy | self unload: copy ].
	self model load.
	self gofer cleanup.
	self workingCopies 
		do: [ :copy | self unregister: copy ]
]

{
	#category : #unloading,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferUnload>>unload: aWorkingCopy [
	self unloadClasses: aWorkingCopy.
	self unloadPackage: aWorkingCopy

]

{
	#category : #unloading,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferUnload>>unloadClasses: aWorkingCopy [
	aWorkingCopy packageSet methods do: [ :each |
		(each classIsMeta and: [ each selector = #unload ])
			ifTrue: [ each actualClass theNonMetaClass unload ] ]
]

{
	#category : #unloading,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferUnload>>unloadPackage: aWorkingCopy [
	self model unloadPackage: aWorkingCopy package
]

{
	#category : #unregistering,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferUnload>>unregister: aWorkingCopy [
	self unregisterWorkingCopy: aWorkingCopy.
	self unregisterRepositories: aWorkingCopy.
	self unregisterPackageSet: aWorkingCopy.
	self unregisterPackageInfo: aWorkingCopy
]

{
	#category : #unregistering,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferUnload>>unregisterPackageInfo: aWorkingCopy [
	RPackageOrganizer default
		unregisterPackageNamed: aWorkingCopy packageName
]

{
	#category : #unregistering,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferUnload>>unregisterPackageSet: aWorkingCopy [
	aWorkingCopy packageSet unregister
]

{
	#category : #unregistering,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferUnload>>unregisterRepositories: aWorkingCopy [
	aWorkingCopy repositoryGroup repositories allButFirst do: [ :repository |
		MCWorkingCopy allManagers do: [ :copy |
			(copy repositoryGroup includes: repository)
				ifTrue: [ ^ self ] ].
		MCRepositoryGroup default
			removeRepository: repository ]
]

{
	#category : #unregistering,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferUnload>>unregisterWorkingCopy: aWorkingCopy [
	aWorkingCopy unregister
]
