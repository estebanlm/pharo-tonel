"

"
Class {
	#name : #MetacelloProjectSpecLoadError,
	#superclass : #Error,
	#instVars : [
		'projectSpec',
		'versionDoesNotExistException'
	],
	#category : #Metacello-Core-Exceptions-Errors,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecLoadError class>>projectSpec: aMetacelloMCProjectSpec [

	^self new
		projectSpec: aMetacelloMCProjectSpec;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecLoadError>>isResumable [
	"Determine whether an exception is resumable."

	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecLoadError>>possibleVersions [
    ^ self versionDoesNotExistException possibleVersions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecLoadError>>projectSpec [

	^projectSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecLoadError>>projectSpec: aMetacelloMCProjectSpec [

	projectSpec := aMetacelloMCProjectSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecLoadError>>versionDoesNotExistException [
	^ versionDoesNotExistException
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecLoadError>>versionDoesNotExistException: anObject [
	versionDoesNotExistException := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecLoadError>>versionString [
    ^ self versionDoesNotExistException versionString
]
