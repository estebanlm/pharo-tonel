"

"
Class {
	#name : #MetacelloVersionDoesNotExistError,
	#superclass : #Error,
	#instVars : [
		'project',
		'versionString'
	],
	#category : #Metacello-Core-Exceptions-Errors,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDoesNotExistError class>>project: aMetacelloProject versionString: aVersionString [

	^(self new)
		project: aMetacelloProject;
		versionString: aVersionString;
		yourself
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDoesNotExistError>>description [
    "Return a textual description of the exception."

    ^ 'Version ' , self versionString printString , ' is not defined in ' , self project label
        , '. Possible versions include: ' , self possibleVersions printString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDoesNotExistError>>possibleVersions [
    ^ self project symbolicVersionSymbols , (self project versions collect: [ :each | each versionString ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDoesNotExistError>>project [
	^ project
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDoesNotExistError>>project: anObject [
	project := anObject
]

{
	#category : #Signaling,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDoesNotExistError>>signal [
  "GemStone needs this to print exception correctly"

  self messageText: self description.
  ^ super signal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDoesNotExistError>>versionString [
	^ versionString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDoesNotExistError>>versionString: anObject [
	versionString := anObject
]
