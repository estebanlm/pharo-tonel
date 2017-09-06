"
Commit work
"
Class {
	#name : #GoferCommit,
	#superclass : #GoferWorking,
	#instVars : [
		'message'
	],
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:35'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferCommit>>execute [
	self workingCopies 
		do: [ :each | self execute: each ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferCommit>>execute: aWorkingCopy [
	| repositories version |
	repositories := self gofer repositories
		reject: [ :repository | (aWorkingCopy changesRelativeToRepository: repository) isEmpty ].
	repositories isEmpty
		ifTrue: [ ^ self ].
	version := [ aWorkingCopy newVersionIn: (MCRepositoryGroup withRepositories: repositories) ]
		on: MCVersionNameAndMessageRequest
		do: [ :notifcation |
			self message ifNil: [ message := notifcation outer last ].
			notifcation resume: (Array with: notifcation suggestedName with: self message) ].
	self gofer repositories
		do: [ :repository | repository storeVersion: version ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferCommit>>initializeOn: aGofer [
	super initializeOn: aGofer disablePackageCache
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferCommit>>message [
	^ message
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferCommit>>message: aString [
	message := aString
]
