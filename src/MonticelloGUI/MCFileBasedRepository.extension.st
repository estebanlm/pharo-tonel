Extension {
	#name : #MCFileBasedRepository
}

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCFileBasedRepository>>morphicOpen: aWorkingCopy [
	(MCFileRepositoryInspector repository: self workingCopy: aWorkingCopy)
		show
]
