"

"
Class {
	#name : #MetacelloProjectRegistrationVersionInfo,
	#superclass : #Object,
	#instVars : [
		'versionString',
		'projectVersion'
	],
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistrationVersionInfo>>projectVersion [
  ^ projectVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistrationVersionInfo>>projectVersion: anObject [
  projectVersion := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistrationVersionInfo>>setVersionString: anObject [
  "set versionString, only if it does not already have avalue"

  versionString ifNil: [ self versionString: anObject ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistrationVersionInfo>>versionString [

   ^versionString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistrationVersionInfo>>versionString: anObject [
  versionString := anObject.
  projectVersion := nil
]
