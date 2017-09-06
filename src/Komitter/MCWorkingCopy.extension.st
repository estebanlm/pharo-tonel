Extension {
	#name : #MCWorkingCopy
}

{
	#category : #'*Komitter',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCWorkingCopy>>baseSnapshot [

	^ self ancestors
		ifEmpty: [ nil ]
		ifNotEmpty: [ :ancestors | self findSnapshotWithVersionInfo: ancestors first ]
]

{
	#category : #'*Komitter',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCWorkingCopy>>collectSliceDependenciesWithMessage: messageString in: aRepository [
	
	^ self requiredPackages collect: [:aPackage | 
			MCVersionDependency
				package: aPackage
				info:  aPackage version info ]
	
]

{
	#category : #'*Komitter',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCWorkingCopy>>remotes [

	^ self repositoryGroup remotes
]

{
	#category : #'*Komitter',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCWorkingCopy>>silentUniqueVersionNameIn: aRepository [
	|versionName|

	counter := nil.
	[
		versionName := self nextVersionName.
		aRepository includesVersionNamed: versionName
	] whileTrue.

	^ versionName
]

{
	#category : #'*Komitter',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCWorkingCopy>>silentlyNewSliceVersionWithName: nameString message: messageString in: aRepository [
	| info deps |
	
	info := ancestry infoWithName: nameString message: messageString.
	ancestry := MCWorkingAncestry new addAncestor: info.
	self 
		modified: true;
		modified: false.
	
	deps := self collectSliceDependenciesWithMessage: messageString in: aRepository.
	
	(self repositoryGroup includes: aRepository) 
		ifFalse: [ self repositoryGroup addRepository: aRepository ].

	^ MCVersion
		silentlyPackage: package
		info: info
		snapshot: package snapshot
		dependencies: deps
]

{
	#category : #'*Komitter',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCWorkingCopy>>silentlyNewVersionWithName: nameString message: messageString in: aRepository [
	
	| info deps |
	info := ancestry infoWithName: nameString message: messageString.
	ancestry := MCWorkingAncestry new addAncestor: info.
	self modified: true.
	
	deps := self collectDependenciesWithMessage: messageString in: aRepository.
	
	(self repositoryGroup includes: aRepository) 
		ifFalse: [ self repositoryGroup addRepository: aRepository ].

	^ MCVersion
		silentlyPackage: package
		info: info
		snapshot: package snapshot
		dependencies: deps
]
