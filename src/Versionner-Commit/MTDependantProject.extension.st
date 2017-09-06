Extension {
	#name : #MTDependantProject
}

{
	#category : #'*Versionner-Commit',
	#timestamp : ' 8/31/2017 05:26:39'
}
MTDependantProject>>isPresent [
	^ self configurationClass notNil
]
