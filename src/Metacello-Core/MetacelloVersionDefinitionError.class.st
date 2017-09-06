"

"
Class {
	#name : #MetacelloVersionDefinitionError,
	#superclass : #MetacelloVersionDoesNotExistError,
	#instVars : [
		'exception'
	],
	#category : #Metacello-Core-Exceptions-Errors,
	#timestamp : ''
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDefinitionError>>description [
    "Return a textual description of the exception."

    ^ 'The version ' , self versionString printString , ' is not defined in ' , self project label
        , ' for the current platform, because an exception occurred while creating the version:. '
        , self exception description , '. Evaluate the following to see the error: ''['
        , self project configuration class name asString
        ,
            ' project ] 
	on: MetacelloErrorInProjectConstructionNotification 
	do: [:ex | ex resume: true ].'''
        ,
            '
Possible versions include: ' , self possibleVersions printString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDefinitionError>>exception [
	^ exception
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDefinitionError>>exception: anObject [
	exception := anObject
]
