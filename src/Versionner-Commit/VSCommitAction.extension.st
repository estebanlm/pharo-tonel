Extension {
	#name : #VSCommitAction
}

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>browseOn: aBrowser [
	self subclassResponsibility
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>currentString [
	^ self subclassResponsibility
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>displayString [
	^ self subclassResponsibility

]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>icon [
	^ self subclassResponsibility
]
