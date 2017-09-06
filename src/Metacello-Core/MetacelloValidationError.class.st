"
MetacelloValidationError indicates that errors are to be expected if an attempt to use the configuration/version is made
"
Class {
	#name : #MetacelloValidationError,
	#superclass : #MetacelloValidationIssue,
	#category : #Metacello-Core-Validation,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationError>>isError [

	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationError>>label [

	^'Error'
]
