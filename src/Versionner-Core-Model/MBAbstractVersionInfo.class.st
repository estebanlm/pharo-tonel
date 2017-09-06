"
Abstract info for a version in Versionner
"
Class {
	#name : #MBAbstractVersionInfo,
	#superclass : #MBAbstractInfoList,
	#instVars : [
		'configurationInfo',
		'version'
	],
	#category : #Versionner-Core-Model,
	#timestamp : 'TorstenBergmann 2/20/2014 14:12'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo class>>new [
	self error: 'Please use version:browser: or version: instead'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo class>>version: aMetacelloVersion [

	^ super new 
		version: aMetacelloVersion;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>calculateInfoList [
	| answer list cvs cv |
	answer := OrderedCollection new.
	cvs := ''.
	(cv := self versionForInfoList) 
		ifNil:  [cvs := cv versionString, ' '].
	(list := self projects) 
		ifNotEmpty: [ 
			answer add: (MBLabelInfo new name: ' -- ', cvs, 'projects --').
			answer addAll: list.
			answer add: (MBLabelInfo new name: '') ].
	(list := self packages)
		ifNotEmpty: [ 
			answer add: (MBLabelInfo new name: ' -- ', cvs, 'packages --').
			answer addAll: list.
			answer add: (MBLabelInfo new name: '') ].
	(list := self groups)
	 		ifNotEmpty: [
			answer add: (MBLabelInfo new name: ' -- ', cvs, 'groups --').
			answer addAll: list ].
	^ answer
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>cmdBrowse [
	<command>
	^ VSBrowseVersionCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>cmdLoad [
	<command>
	^ VSLoadCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>cmdMakeDevelopment [
	<command>
	^ VSMakeDevelopmentCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>cmdMakeStable [
	<command>
	^ VSMakeStableCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>cmdRemove [
	<command>
	^ VSRemoveCommand
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>configurationBasename [
	^ self configurationClass name configurationBaseName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>configurationClass [
	^ self configurationInfo configurationClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>configurationInfo [
	^ configurationInfo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>configurationInfo: anObject [
	configurationInfo := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>currentVersion [

	^self configurationInfo currentVersion
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>hasValidationIssues [
	validationResult == nil ifTrue: [ ^false ].
	^validationResult notEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>isBaseline [
	^ self version blessing == #baseline
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>isBleedingEdge [
	^  (self project hasVersion: #bleedingEdge) and: [
		(self project version: #bleedingEdge) = self version ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>isCurrentVersion [
	|cv|
	(cv := self currentVersion) ~~ nil
		ifTrue: [ 
			cv = self version
				ifTrue: [^ true]].
	^false.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>isDevelopment [
	^  (self project hasVersion: #development) and: [
		(self project version: #development) = self version ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>isStable [
	^ (self project hasVersion: #stable) and: [ 
		(self project version: #stable) = self version ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>printOn: aStream [
	| cv |
	(cv := self currentVersion) ~~ nil
		ifTrue: [ 
			cv = self version
				ifTrue: [ aStream nextPutAll: ' @ ' ] ].
	super printOn: aStream.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>project [
	"Answer the MetacelloProject associated with the receiver."
	
	^self version project
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>validate [
	validationResult == nil
		ifTrue: [ 
			validationIcon := nil.
			validationResult := MetacelloToolBox validateProject: self project version: self version versionString ].
	^ validationResult
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>version [
	^ version
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>version: aMetacelloVersion [

	version := aMetacelloVersion.
	self name: aMetacelloVersion versionString.
	

]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>versionForInfoList [

	^self version 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfo>>versionString [
	^ self version versionString
]
