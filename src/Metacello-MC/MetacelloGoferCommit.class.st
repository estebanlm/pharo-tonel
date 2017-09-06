"

"
Class {
	#name : #MetacelloGoferCommit,
	#superclass : #GoferCommit,
	#category : #Metacello-MC-Gofer,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloGoferCommit>>execute: aWorkingCopy [
	| version |
	version := MetacelloPlatform current newVersionForWorkingCopy: aWorkingCopy.
	self gofer repositories
		do: [ :repository | repository storeVersion: version ]
]
