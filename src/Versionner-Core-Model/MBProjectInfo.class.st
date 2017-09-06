"
Infos about a project
"
Class {
	#name : #MBProjectInfo,
	#superclass : #MBAbstractPackageInfo,
	#instVars : [
		'currentVersion'
	],
	#category : #Versionner-Core-Model,
	#timestamp : 'TorstenBergmann 2/20/2014 14:12'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBProjectInfo class>>helpLabel [

	^'Project'
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBProjectInfo>>buildStringOrText [
	| string cv projectClass info attributes specVersion |
	string := super buildStringOrText.
	attributes := OrderedCollection new.
	self isDirty
		ifTrue: [ attributes add: TextEmphasis underlined ].
	(((projectClass := self spec projectClass) isNil or: [ (cv := self currentVersion) isEmpty ])
		or: [ (specVersion := self spec versionOrNil) isNil ])
		ifTrue: [ 
			attributes notEmpty
				ifTrue: [ ^ Text string: string attributes: attributes ].
			^ string ].
	self currentVersionMismatch
		ifTrue: [ attributes add: TextEmphasis bold ].
	specVersion versionStatus == #somethingLoaded
		ifTrue: [ attributes add: TextColor red ].
	attributes notEmpty
		ifTrue: [ ^ Text string: string attributes: attributes ].
	^ string
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBProjectInfo>>classForBrowsing [

	^self spec projectClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBProjectInfo>>currentVersion [
	currentVersion == nil
		ifTrue: [ 
			| projectClass version info |
			(projectClass := self spec projectClass) == nil
				ifTrue: [ 
					currentVersion := ''.
					^ currentVersion ].
			(info := self configurationRoot configurationInfoFor: projectClass) == nil
				ifTrue: [ 
					currentVersion := ''.
					^ currentVersion ].
			(currentVersion := info currentVersion) == nil
				ifTrue: [ 
					currentVersion := ''.
					^ currentVersion ].
			currentVersion := currentVersion versionString ].
	^ currentVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBProjectInfo>>currentVersion: anObject [

	currentVersion := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBProjectInfo>>currentVersionMismatch [
	| cv specVersion |
	(cv := self currentVersion) notEmpty
		ifTrue: [ 
			(specVersion := self spec versionOrNil) ~~ nil
				ifTrue: [^ cv asMetacelloVersionNumber ~= specVersion versionNumber ]].
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBProjectInfo>>interestedInConfigurationInfo: configInfo [
	| projectClass |
	(projectClass := self spec projectClass) == nil
		ifTrue: [ ^ false ].
	^(self configurationRoot configurationInfoFor: projectClass) name = configInfo name

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBProjectInfo>>interestedInPackageNamed: aString [
	| projectClass version info |
	(projectClass := self spec projectClass) == nil
		ifTrue: [ ^ false ].
	(aString beginsWith: projectClass name asString)
		ifTrue: [ ^ true ].
	(info := self configurationRoot configurationInfoFor: projectClass) == nil
		ifTrue: [ ^ false ].
	^ info interestedInPackageNamed: aString
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBProjectInfo>>printOn: aStream [
	| cv specVersion |
	self isDirty
		ifTrue: [ aStream nextPutAll: '* ' ].
	super printOn: aStream.
	(cv := self currentVersion) isEmpty
		ifTrue: [ aStream nextPutAll: ' ---' ]
		ifFalse: [ 
			(specVersion := self spec versionOrNil) ~~ nil
				ifTrue: [ 
					aStream nextPutAll: ' ' , specVersion versionString.
					cv asMetacelloVersionNumber = specVersion versionNumber
						ifFalse: [ aStream nextPutAll: ' [' , cv , ']' ] ] ]
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBProjectInfo>>repositories [
	"Return the repositories associated with the configuration for the project."

	^self spec projectPackage workingCopy repositoryGroup repositories
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBProjectInfo>>typeLabel [

	^'project'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBProjectInfo>>validate [
	validationResult == nil
		ifTrue: [ 
			validationIcon := nil.
			validationResult := self validateIfAbsent: [ #() ] ].
	^ validationResult
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBProjectInfo>>validateIfAbsent: absentBlock [

	^MetacelloToolBox validateConfiguration: (Smalltalk 
		at: self packageName asSymbol 
		ifAbsent: absentBlock).

]
