"
I'm a project action who makes a new configuration for a project and commits it to repository.
"
Class {
	#name : #VSCommitProjectAction,
	#superclass : #VSCommitAction,
	#instVars : [
		'project',
		'commitVersion',
		'nextVersion'
	],
	#category : #Versionner-Commit,
	#timestamp : 'EstebanLorenzano 4/23/2015 15:50'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction class>>project: aMTProject  [
	^ self basicNew
		initializeProject: aMTProject;
		yourself
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>browseOn: aBrowser [
	aBrowser browseProject: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>configurationClass [
	^ self project configurationClass
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>currentString [
	^ [ self project stableVersion ifNotNil: [  :version | version versionString  ] ]
	on: Error 
	do: [ :e | '' ]
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>displayString [
	^ self project name
]

{
	#category : #executing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>executeOn: aUnit [
	| version |
	version := self nextVersionOn: aUnit.
	self project devWorkflow 
		releaseFixedDevelopment: version
		description: aUnit comment.
	self 
		commitPackage: self packageName 
		comment: aUnit comment
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>icon [
	^ Smalltalk ui icons iconNamed: #config
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>initializeProject: aMTProject  [
	project := aMTProject.
	self initialize
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>isProject [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>nextVersion: anObject [
	^ nextVersion := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>nextVersionOn: aUnit  [
	^ nextVersion ifNil: [ aUnit commitVersion nextVersionOf: self project ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>packageName [
	^ self project configurationClass package name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>project [
	^ project
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>removeOn: aUnit [
	aUnit removeProjectAction: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>repository [
	^ self project repository
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>validate [
	(VSCommitProjectValidator project: self project) validate
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitProjectAction>>workingCopy  [
	^ self project workingCopy
]
