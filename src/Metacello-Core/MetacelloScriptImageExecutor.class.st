"

"
Class {
	#name : #MetacelloScriptImageExecutor,
	#superclass : #MetacelloScriptExecutor,
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #'execution callback',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptImageExecutor>>projectSpecSelectBlock [
    ^ [ :projectSpec | 
    projectSpec
        ifNil: [ false ]
        ifNotNil: [ 
            MetacelloProjectRegistration
                registrationForProjectSpec: projectSpec
                ifAbsent: [ false ]
                ifPresent: [ :existingRegistration :newRegistration | existingRegistration loadedInImage ] ] ]
]
