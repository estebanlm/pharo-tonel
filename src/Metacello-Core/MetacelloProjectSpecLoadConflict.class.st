"

"
Class {
	#name : #MetacelloProjectSpecLoadConflict,
	#superclass : #MetacelloProjectSpecLoadError,
	#category : #Metacello-Core-Exceptions-Errors,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecLoadConflict>>isResumable [
	"Determine whether an exception is resumable."

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecLoadConflict>>possibleVersions [
    "not applicable to a Conflict error"

    self shouldNotImplement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecLoadConflict>>versionString [
    "not applicable to a Conflict error"

    self shouldNotImplement
]
