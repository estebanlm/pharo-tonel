"
I'm an error thrown whenever the project validation fails. 

I contain a project reference and a list of issues.
"
Class {
	#name : #VSCommitProjectValidationError,
	#superclass : #Error,
	#instVars : [
		'projectName',
		'issues'
	],
	#category : #Versionner-Commit,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectValidationError>>issues [
	^ issues
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectValidationError>>issues: anObject [
	issues := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectValidationError>>projectName [
	^ projectName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectValidationError>>projectName: anObject [
	projectName := anObject
]
