Extension {
	#name : #MTProject
}

{
	#category : #'*Versionner-Commit',
	#timestamp : ' 8/31/2017 05:26:39'
}
MTProject>>asCommitAction [
	^ VSCommitProjectAction project: self
]

{
	#category : #'*Versionner-Commit',
	#timestamp : ' 8/31/2017 05:26:39'
}
MTProject>>stableVersion [
	^ self configurationClass project version: #stable
]

{
	#category : #'*Versionner-Commit',
	#timestamp : ' 8/31/2017 05:26:39'
}
MTProject>>workingCopy [
	| packageName |
	packageName := self configurationClass package name.
	^ MCWorkingCopy allManagers detect: [ :each | each packageName = packageName ]
]
