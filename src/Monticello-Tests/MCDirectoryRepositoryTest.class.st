"

"
Class {
	#name : #MCDirectoryRepositoryTest,
	#superclass : #MCRepositoryTest,
	#instVars : [
		'directory'
	],
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCDirectoryRepositoryTest>>addVersion: aVersion [
	| file |
	file := (directory / aVersion fileName) asFileReference writeStream.
	aVersion fileOutOn: file.
	file close.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCDirectoryRepositoryTest>>directory [
	directory ifNil:
		[directory := 'mctest' asFileReference.
		directory ensureCreateDirectory].
	^ directory
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCDirectoryRepositoryTest>>setUp [
	repository := MCDirectoryRepository new directory: self directory
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCDirectoryRepositoryTest>>tearDown [
	self directory deleteAll.
	
]
