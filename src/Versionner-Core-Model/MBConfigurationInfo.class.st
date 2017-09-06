"
A MBConfigurationInfo holds information on a specific configuration, i.e. on the ConfigurationOf class of a project.

Instance Variables
	baselines:		list of baselines (MBBaseLineInfo instances) of this configuration.
	branch:			??
	configurationClass:	the configuration class (ConfigurationOf instance).
	configurationRoot:		a link to the root object with all configurations.
	currentVersion:		??
	trimVersionLists:		true if ??
	versions:			list of versions (MBVersionInfo instances) of this configuration.
	workingCopy:	the Metacello working copy

"
Class {
	#name : #MBConfigurationInfo,
	#superclass : #MBAbstractInfoList,
	#instVars : [
		'configurationRoot',
		'branch',
		'configurationClass',
		'currentVersion',
		'baselines',
		'versions',
		'workingCopy',
		'trimVersionLists'
	],
	#category : #Versionner-Core-Model,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo class>>configurationClass: aConfiguration [
	^ super new 
		configurationClass: aConfiguration;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo class>>helpLabel [

	^'Configuration'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo class>>new [
	self error: 'Please, use #configuration: to instantiate ', self name printString
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>baselines  [
	baselines ifNotNil: [ ^baselines ].
	baselines := self baselinesFor: self project.
	^baselines 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>baselinesFor: aMetacelloProject [
	"Return the list of  BaselineInfo for the configuration class passed as parameter"

	"The returned collection is ordered. Labeled baselines are first, numbered baselines are last"

	| existingBaselines numberedBaselines labeledBaselines |
	existingBaselines := aMetacelloProject versions select: [ :vrsn | vrsn blessing == #baseline ].
	existingBaselines := existingBaselines
		collect: [ :vrsn | 
			(MBBaselineInfo version: vrsn)
				configurationInfo: self;
				yourself ].
	numberedBaselines := existingBaselines select: [ :bInfo | ($0 to: $9) includes: bInfo name first ].
	labeledBaselines := existingBaselines copyWithoutAll: numberedBaselines.
	^ labeledBaselines asArray , numberedBaselines asArray reversed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>branch [

	branch ifNil: [ branch := self extractBranchFrom: self workingCopy ].
	^branch
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>buildStringOrText [
	| string cv specVersion attributes wc |
	attributes := OrderedCollection new.
	[ string := super buildStringOrText ]
		on: Error
		do: [ :ex | 
			attributes add: TextEmphasis struckOut.
			^ Text string: self name asString attributes: attributes ].
	((wc := self workingCopy) notNil and: [ wc needsSaving ])
		ifTrue: [ attributes add: TextEmphasis underlined ].
	self currentVersion. "prime the pump"
	currentVersion == #notLoaded
		ifTrue: [ 
			attributes notEmpty
				ifTrue: [ ^ Text string: string attributes: attributes ].
			^ string ].
	super isDirty | self currentVersionMismatch
		ifTrue: [ attributes add: TextEmphasis bold ].
	self currentVersion versionStatus == #somethingLoaded
		ifTrue: [ attributes add: TextColor red ].
	attributes notEmpty
		ifTrue: [ ^ Text string: string attributes: attributes ].
	^ string
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>calculateInfoList [
	| answer list cvs cv |
	answer := OrderedCollection new.
	[self project ifNil: [ ^answer ]] on: Error do: [:ex | ^answer ].
	answer add: (MBLabelInfo new name: ' -- baselines --').
	answer addAll: (self trimVersionInfos: self baselines).
	answer add: (MBLabelInfo new name: '').
	answer add: (MBLabelInfo new name: ' -- versions --').
	answer addAll: (self trimVersionInfos: self versions).
	answer add: (MBLabelInfo new name: '').
	cvs := ''.
	(cv := self currentVersion) ~~ nil
		ifTrue:  [cvs := cv versionString, ' '].
	(list := self projects) notEmpty
		ifTrue: [ 
			answer add: (MBLabelInfo new name: ' -- ', cvs, 'projects --').
			answer addAll: list.
			answer add: (MBLabelInfo new name: '') ].
	(list := self packages) notEmpty
		ifTrue: [ 
			answer add: (MBLabelInfo new name: ' -- ', cvs, 'packages --').
			answer addAll: list.
			answer add: (MBLabelInfo new name: '') ].
	(list := self groups) notEmpty
		ifTrue: [ 
			answer add: (MBLabelInfo new name: ' -- ', cvs, 'groups --').
			answer addAll: list].
	^ answer
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>cmdBrowseConfiguration [
	<command>
	^ VSBrowseConfigurationCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>cmdCatalogAdder [
	<command>
	^ VSCatalogAdderCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>cmdCommitMajorVersion [
	<command>
	^ VSCommitMajorCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>cmdCommitMinorVersion [
	<command>
	^ VSCommitMinorCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>cmdCommitPatchVersion [
	<command>
	^ VSCommitPatchCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>cmdOpenRepository [
	<command>
	^ VSOpenRepositoryCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>cmdSaveConfiguration [
	<command>
	^ MBSaveConfigurationCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>cmdUnloadConfiguration [
	<command>
	^ VSUnloadConfigurationCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>cmdUpdateFromItsRepository [
	<command>
	^ VSUpdateFromItsRepositoryCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>cmdValidateConfiguration [
	<command>
	^ VSValidateConfigurationCommand
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>configurationClass [
	"Returns the class configurationOfXXX associted to the configuration info (wrapper for the UI)"

	^ configurationClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>configurationClass: aConfigurationClass [
	configurationClass := aConfigurationClass.
	self name: configurationClass name asString
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>configurationClassModified [

	self fullRecalculate 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>configurationInfo [

	^self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>configurationRoot [
	^ configurationRoot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>configurationRoot: anObject [
	configurationRoot := anObject
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>currentVersion [
	"Return the currentVersion of the configuration ... nil if not loaded."

	currentVersion == #notLoaded
		ifTrue: [ ^ nil ].
	(currentVersion notNil and: [ currentVersion ~~ #recalculate])
		ifTrue: [ ^ currentVersion ].
	packages := projects := groups := text := nil.
	self configurationRoot ifNil: [  ^ currentVersion ].
	(currentVersion := self project currentVersion)
		ifNil: [ 
			currentVersion := #notLoaded.
			self configurationRoot announcer announce: (MBConfigurationInfoChanged changed: self).
			^ nil ].
	self configurationRoot announcer announce: (MBConfigurationInfoChanged changed: self).
	^ currentVersion
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>currentVersion: aVersion [

	currentVersion  := aVersion.
	branch := baselines := versions := infoList := packages := projects := groups := text := nil.
	self configurationRoot announcer announce: (MBConfigurationInfoChanged changed: self).
	self announcer announce: (MBInfoListChanged changed: self).

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>currentVersionMismatch [
	^ (self projects anySatisfy: [ :each | each currentVersionMismatch ])
		or: [ self packages anySatisfy: [ :each | each currentVersionMismatch ] ]
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>extractBranchFrom: aWorkingCopy [
	| ref |
	(aWorkingCopy isNil or: [ aWorkingCopy ancestors isEmpty ])
		ifTrue: [ ^ '' ].
	ref := GoferVersionReference name: aWorkingCopy ancestors first name.
	^ ref branch
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>fullRecalculate [

	super fullRecalculate.
	(currentVersion == #recalculate or: [ currentVersion isNil ]) ifTrue: [^self ].
	currentVersion := #recalculate.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>hasVersion: aVersionString [
 	[ self project version: aVersionString ]
		on: MetacelloSymbolicVersionDoesNotExistError
		do:  [ ^ false ].
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>isDirty [
	| wc |
	^ [super isDirty or: [ (wc := self workingCopy) notNil and: [ wc needsSaving ]]] on:Error do:[false].
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>printOn: aStream [
	| cv nameString wc refString branchString |
	[self name
		ifNil: [ 
			aStream nextPutAll: ''.
			^ self ].
	nameString := self name configurationBaseName.
	(refString := self extractPackageSignatureFrom: (wc := self workingCopy)) notEmpty
		ifTrue: [ refString := '(' , refString , ')' ].
	(branchString := self branch) notEmpty
		ifTrue: [ nameString := nameString, '.', branchString ].
	self isDirty
		ifTrue: [ aStream nextPutAll: '* ' ].
	aStream nextPutAll: nameString.
	(cv := self currentVersion) notNil
		ifTrue: [ aStream nextPutAll: ' ' , cv versionString ].
	aStream nextPutAll: refString.] on:Error do:[].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>project [
	"Answer the MetacelloProject associated with the receiver."

	^ self configurationClass project
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>recalculate [
	branch := workingCopy := baselines := versions := nil.
	super recalculate.
	self configurationRoot announcer announce: (MBConfigurationInfoChanged changed: self).

]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>recalculateIfInterestedInConfigurationInfo: configInfo for: operation [

	projects ifNil: [ ^self ].
	self projects detect: [ :info | info interestedInConfigurationInfo: configInfo ] ifNone: [ ^self ].
	infoList := text := projects := nil.
	self configurationRoot announcer announce: (MBConfigurationInfoChanged changed: self)
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>recalculateIfInterestedInPackageNamed: packageName for: operation [
	| recalculate |
	recalculate := super recalculateIfInterestedInPackageNamed: packageName for: operation.
	(recalculate not and: [ baselines notNil ])
		ifTrue: [ 
			(self baselines detect: [ :info | info recalculateIfInterestedInPackageNamed: packageName for: operation ] ifNone: [  ])
				ifNotNil: [ recalculate := true ] ].
	(recalculate not and: [ versions notNil ])
		ifTrue: [ 
			(self versions detect: [ :info | info recalculateIfInterestedInPackageNamed: packageName for: operation ] ifNone: [  ])
				ifNotNil: [ recalculate := true ] ].
	(recalculate and: [ operation ~~ #modified ])
		ifTrue: [ 
			currentVersion == #notLoaded
				ifTrue: [ currentVersion := nil ].
			self fullRecalculate ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>recalculateSilently [
	branch := workingCopy := baselines := versions := nil.
	super recalculate.

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>release [

	baselines := versions := nil.
	super release.	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>repositories [
	"Return the repositories associated with the configuration."
	| mcPackage |
	
	(mcPackage := self project projectPackage)
		ifNil: [ ^nil ].
	^ mcPackage workingCopy
		ifNil: [ nil ]
		ifNotNil: [ :wc | wc repositoryGroup repositories ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>trimVersionInfos: versionInfos [

	| trimmed count marker cv |
	self trimVersionLists ifFalse: [ ^versionInfos ].
	versionInfos size <= 10 ifTrue: [ ^versionInfos ].
	trimmed := (versionInfos copyFrom: 1 to: 5) asOrderedCollection.
	marker := count := 0.
	cv := self currentVersion.
	 6 to: versionInfos size do: [:index | | info |
		info := versionInfos at: index.
		info isStable | info isBleedingEdge | info isDevelopment | info hasValidationIssues | (cv = info version)
			ifTrue: [ 
				count - 1 >= marker ifTrue: [ trimmed add:( MBLabelInfo new name: '..') ].
				trimmed add: info.
				marker := count. ].
		count := count + 1 ].
	count - 1 >= marker ifTrue: [ trimmed add:( MBLabelInfo new name: '..') ].
	^trimmed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>trimVersionLists [

	trimVersionLists == nil ifTrue: [ trimVersionLists := true ].
	^trimVersionLists
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>trimVersionLists: aBool [

	trimVersionLists := aBool
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>validate [
	validationResult == nil
		ifTrue: [ 
			validationIcon := nil.
			validationResult := MetacelloToolBox validateConfiguration: self configurationClass ].
	^ validationResult
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>validateFull [

	infoList := baselines := versions := nil.
	(self baselines, self versions) do: [:version | version validateFull ].
	^super validateFull.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>version [

	^self currentVersion
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>versionForInfoList [

	^self currentVersion 
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>versions [
	"Return the versions of the configuration"
	| versionList devVersionString |
	
	versions ifNotNil: [ versions ifNotEmpty: [ ^ versions ] ].
	versionList := self project map values.
	devVersionString := self project symbolicVersionMap at: #development ifAbsent: [ '' ].
	versionList reject: [ :vrsn | (vrsn blessing == #baseline and: [(vrsn name == devVersionString) not]) or: [ vrsn blessing == #broken ] ].
	
	versions := (versionList asArray sort: [:a :b | a > b ])
		collect: [ :vrsn | 
			(MBVersionInfo version: vrsn)
				configurationInfo: self;
				yourself ].
	^ versions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfo>>workingCopy [
	| pkg |
	workingCopy ~~ nil ifTrue: [ ^workingCopy ].
	pkg := MCPackage named: self configurationClass category asString.
	pkg  hasWorkingCopy ifFalse: [ ^nil ].
	^workingCopy := pkg workingCopy
]
