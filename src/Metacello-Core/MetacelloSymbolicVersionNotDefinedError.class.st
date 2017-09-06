"

"
Class {
	#name : #MetacelloSymbolicVersionNotDefinedError,
	#superclass : #MetacelloSymbolicVersionDoesNotExistError,
	#category : #Metacello-Core-Exceptions-Errors,
	#timestamp : ''
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSymbolicVersionNotDefinedError>>description [
    "Return a textual description of the exception."

    ^ 'The symbolic version ' , self versionString printString , ' is EXPLICITLY not defined in ' , self project label
        , ' for the current platform (i.e., symbolic version defined as #notDefined).'
]
