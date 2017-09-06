"

"
Class {
	#name : #MetacelloSymbolicVersionDoesNotExistError,
	#superclass : #MetacelloVersionDoesNotExistError,
	#category : #Metacello-Core-Exceptions-Errors,
	#timestamp : ''
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSymbolicVersionDoesNotExistError>>description [
    "Return a textual description of the exception."

    ^ 'The symbolic version ' , self versionString printString , ' is not defined in ' , self project label
        , ' for the current platform. Possible symbolic version values include: ' , self possibleVersions printString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSymbolicVersionDoesNotExistError>>possibleVersions [
    ^ self project symbolicVersionSymbols
]
