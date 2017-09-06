"
I'm a commit action to perform a package commit. 
"
Class {
	#name : #VSCommitPackageAction,
	#superclass : #VSCommitAction,
	#instVars : [
		'package'
	],
	#category : #Versionner-Commit,
	#timestamp : 'EstebanLorenzano 4/23/2015 15:48'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction class>>new [
	self error: 'Use #package:'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction class>>package: aPackage [
	^ self basicNew 
		initializePackage: aPackage;
		yourself
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>browseOn: aBrowser [
	aBrowser browsePackage: self
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>currentString [
	| workingCopy |
	
	workingCopy := self package workingCopy.
	^ [ workingCopy ancestry ancestorStringWithout: workingCopy packageName ]
		on: Error do: [ :e | '' ]
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>displayString  [
	^ self package name
]

{
	#category : #executing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>executeOn: aUnit [
	self 
		commitPackage: self packageName
		comment: aUnit comment
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>icon [
	^ Smalltalk ui icons iconNamed: #packageIcon
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>initializePackage: aPackage [
	package := aPackage.
	self initialize
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>isPackage  [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>package [
	^ package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>packageName [
	^ self package name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>removeOn: aUnit [
	aUnit removePackageAction: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>repository [
	^ self package repository
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPackageAction>>workingCopy  [
	^ self package workingCopy
]
