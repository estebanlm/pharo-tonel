Extension {
	#name : #VSCommitPackageAction
}

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>browseOn: aBrowser [
	aBrowser browsePackage: self
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>currentString [
	| workingCopy |
	
	workingCopy := self package workingCopy.
	^ [ workingCopy ancestry ancestorStringWithout: workingCopy packageName ]
		on: Error do: [ :e | '' ]
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>displayString  [
	^ self package name
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>icon [
	^ Smalltalk ui icons iconNamed: #packageIcon
]
