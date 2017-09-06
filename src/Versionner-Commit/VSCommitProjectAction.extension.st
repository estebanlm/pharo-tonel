Extension {
	#name : #VSCommitProjectAction
}

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>browseOn: aBrowser [
	aBrowser browseProject: self
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>currentString [
	^ [ self project stableVersion ifNotNil: [  :version | version versionString  ] ]
	on: Error 
	do: [ :e | '' ]
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>displayString [
	^ self project name
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>icon [
	^ Smalltalk ui icons iconNamed: #config
]
