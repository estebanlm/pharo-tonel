Extension {
	#name : #MTPackage
}

{
	#category : #'*Versionner-Commit',
	#timestamp : ' 8/31/2017 05:26:39'
}
MTPackage>>asCommitAction [
	^ VSCommitPackageAction package: self
]

{
	#category : #'*Versionner-Commit',
	#timestamp : ' 8/31/2017 05:26:39'
}
MTPackage>>isDirty [
	^ self workingCopy 
		ifNotNil: [ :wc | wc modified ]
		ifNil: [ false ]
]

{
	#category : #'*Versionner-Commit',
	#timestamp : ' 8/31/2017 05:26:39'
}
MTPackage>>repository [
	^ self project repository
]

{
	#category : #'*Versionner-Commit',
	#timestamp : ' 8/31/2017 05:26:39'
}
MTPackage>>workingCopy [
	^ MCWorkingCopy allManagers 
		detect: [ :each | each packageName = self name ]
		ifNone: [ nil ]
]
