"
I represent a Monticello ""Save Version"" operation performed in the system.
"
Class {
	#name : #EpMonticelloVersionSave,
	#superclass : #EpEvent,
	#instVars : [
		'versionName',
		'repositoryDescription'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:52'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionSave class>>version: aMCVersion repository: aMCRepository  [
	^ self 
		versionName: aMCVersion info name 
		repositoryDescription: aMCRepository description
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionSave class>>versionName: aVersionName repositoryDescription: aRepositoryDescription  [
	^ self basicNew
		initializeWithVersionName: aVersionName
		repositoryDescription: aRepositoryDescription;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionSave>>= another [

	^ self class = another class
		and: [ self versionName = another versionName
		and: [ self repositoryDescription = another repositoryDescription ] ]
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionSave>>accept: aChangeVisitor  [
	^ aChangeVisitor visitMonticelloVersionSave: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionSave>>affectedPackageName [
	
	^ self packageName
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionSave>>hash [

	^ (self class hash
		bitXor: self versionName hash)
		bitXor: self repositoryDescription hash
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionSave>>initializeWithVersionName: aVersionName repositoryDescription: aRepositoryDescription  [
	self initialize.
	
	versionName := aVersionName.
	repositoryDescription := aRepositoryDescription.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionSave>>isMonticelloVersionSave [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionSave>>packageName [

	^ versionName copyUpToLast: $-
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionSave>>printOn: aStream [

	super printOn: aStream.
	
	aStream 
		nextPut: $(;
		nextPutAll: repositoryDescription;
		nextPut: $/;
		nextPutAll: versionName;
		nextPut: $).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionSave>>repositoryDescription [
	^ repositoryDescription
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionSave>>versionName [
	^ versionName
]
