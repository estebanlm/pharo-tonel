"

"
Class {
	#name : #MetacelloProjectRegistration,
	#superclass : #Object,
	#instVars : [
		'projectName',
		'configurationProjectSpec',
		'baselineProjectSpec',
		'loadedInImage',
		'locked',
		'mutable',
		'versionInfo'
	],
	#classVars : [
		'Registry'
	],
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>baselineClasses [
    "Return a set of the Metacello baseline classes that have been loaded into the image."

    "self baselineClasses"

    ^ BaselineOf allSubclasses
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>baselineProjectSpecs [
    "MetacelloProjectRegistration baselineProjectSpecs"

    ^ self registry baselineProjectSpecs
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>classRemoved: aClassRemovalAnnouncement [
  "aRemovalAnnouncement is platform-specific ... responds to #itemClass to 
   answer the class that was removed."

  | aClass registration |
  aClass := aClassRemovalAnnouncement itemClass.
  registration := self registry
    registrationForExactClassNamed: aClass name asString
    ifAbsent: [ ^ self ].
  registration unregisterProject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>configurationClasses [
    "Return a set of the Metacello configuration classes that have been loaded into the image."

    "self configurationClasses"

    | answer |
    answer := IdentitySet new.
    ConfigurationOf allSubclasses
        do: [ :cl | 
            (cl == BaselineOf or: [ cl inheritsFrom: BaselineOf ])
                ifFalse: [ answer add: cl ] ].
    Object allSubclasses
        do: [ :cl | 
            (answer includes: cl)
                ifFalse: [ 
                    (([ cl isMetacelloConfig ]
                        on: Error
                        do: [ :ex | ex return: false ]) and: [ cl name asString beginsWith: 'ConfigurationOf' ])
                        ifTrue: [ answer add: cl ] ] ].
    ^ answer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>configurationProjectSpecs [
    "MetacelloProjectRegistration configurationProjectSpecs"

    ^ self registry configurationProjectSpecs
]

{
	#category : #mutability,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>copyRegistryRestoreOnErrorWhile: aBlock [
  "install copy of registry for duration of <aBlock> execution."

  "registrations will be copied on write during <aBlock> execution."

  "if <aBlock> does not return control to this context, revert to the original
	version of the registry. Otherwise leave the new copy installed."

  | oldRegistry newRegistry |
  oldRegistry := self registry.
  newRegistry := self registry copy.
  self registry: newRegistry.
  aBlock
    ensure: [ 
      "install old version of registry"
      newRegistry := self registry.	"see https://github.com/dalehenrich/metacello-work/issues/210"
      self registry: oldRegistry ].
  self registry: newRegistry	"if control returned, install newRegistry"
]

{
	#category : #mutability,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>copyRegistryWhile: aBlock [
    "install copy of registry for duration of <aBlock> execution."

    "registrations will be copied on write during <aBlock> execution."

    "Unconditionally revert to the original
	version of the registry. Otherwise leave the new copy installed."

    | oldRegistry newRegistry |
    oldRegistry := self registry.
    newRegistry := self registry copy.
    self registry: newRegistry.
    aBlock
        ensure: [ 
            "install old version of registry"
            self registry: oldRegistry ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>fromMCBaselineProjectSpec: aProjectSpec [
    ^ self new
        projectName: aProjectSpec name;
        baselineProjectSpec: aProjectSpec;
        yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>fromMCConfigurationProjectSpec: aProjectSpec [
    ^ self new
        projectName: aProjectSpec name;
        configurationProjectSpec: aProjectSpec;
        yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>primeRegistryFromImage [
    "MetacelloProjectRegistration primeRegistryFromImage"

    self registry primeRegistryFromImage
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>projectSpecForClassNamed: aClassName ifAbsent: absentBlock [
    ^ self registry projectSpecForClassNamed: aClassName ifAbsent: absentBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>projectSpecs [
    "MetacelloProjectRegistration projectSpecs"

    ^ self configurationProjectSpecs , self baselineProjectSpecs
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>registerProjectSpec: aProjectSpec ifPresent: presentBlock [
    | newRegistration |
    newRegistration := aProjectSpec asProjectRegistration.
    ^ self registry
        registrationFor: newRegistration
        ifPresent: [ :existing | presentBlock value: existing value: newRegistration ]
        ifAbsent: [ newRegistration registerProject ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>registrationForClassNamed: aClassName ifAbsent: absentBlock [
    ^ self registry registrationForClassNamed: aClassName ifAbsent: absentBlock
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>registrationForProjectSpec: aProjectSpec ifAbsent: absentBlock ifPresent: presentBlock [
    | newRegistration |
    newRegistration := aProjectSpec asProjectRegistration.
    self registry
        registrationFor: newRegistration
        ifPresent: [ :existing | ^ presentBlock value: existing value: newRegistration ]
        ifAbsent: [ ^ absentBlock value: newRegistration ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>registry [
    Registry ifNil: [ Registry := MetacelloProjectRegistry new ].
    ^ Registry
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>registry: aMetacelloProjectRegistry [
    Registry := aMetacelloProjectRegistry
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration class>>resetRegistry [
    Registry := nil
]

{
	#category : #comparision,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>= aRegistration [
    aRegistration class == self class
        ifFalse: [ ^ false ].
    ^ (configurationProjectSpec registrationsCompareEqual: aRegistration configurationProjectSpec)
        and: [ baselineProjectSpec registrationsCompareEqual: aRegistration baselineProjectSpec ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>baseName [
	^ self projectSpec baseName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>baselineProjectSpec [
  "only one of baselineProjectSpec or configurationProjectSpec should ever be set"

  ^ baselineProjectSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>baselineProjectSpec: anObject [
  "force the registration to be consistent -- difficult for Metacello to 
   repair registrations during load -- I've tried. "

  "https://github.com/dalehenrich/metacello-work/issues/212"

  self shouldBeMutable.
  configurationProjectSpec := nil.
  self assert: anObject isBaselineOfProjectSpec.
  baselineProjectSpec := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>baselineProjectSpecIfAbsent: absentBlock [
  ^ baselineProjectSpec ifNil: absentBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>baselineProjectSpecIfPresent: presentBlock ifAbsent: absentBlock [
     ^ baselineProjectSpec ifNotNil: [ presentBlock cull: baselineProjectSpec ]  ifNil: absentBlock
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>canDowngradeTo: aProjectRegistration [
    "true if there are no load conflicts
        OR
       if the load conflicts involved two cofigurations ONLY and a downgrade is allowed"

    (self hasLoadConflicts: aProjectRegistration)
        ifFalse: [ ^ true ].
    configurationProjectSpec
        ifNotNil: [ 
            aProjectRegistration configurationProjectSpec
                ifNotNil: [ 
                    configurationProjectSpec ensureProjectLoaded.
                    ^ configurationProjectSpec canDowngradeTo: aProjectRegistration configurationProjectSpec ] ].
    ^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>canUpgradeTo: aProjectRegistration [
  "true if there are no load conflicts
        OR
       if the load conflicts involved two cofigurations ONLY and an upgrade is allowed"

  (self hasLoadConflicts: aProjectRegistration)
    ifFalse: [ ^ true ].
  configurationProjectSpec
    ifNotNil: [ 
      aProjectRegistration configurationProjectSpec
        ifNotNil: [ 
          configurationProjectSpec copy ensureProjectLoaded.
          ^ configurationProjectSpec
            canUpgradeTo: aProjectRegistration configurationProjectSpec ] ].
  baselineProjectSpec
    ifNotNil: [ 
      aProjectRegistration baselineProjectSpec
        ifNotNil: [ 
          baselineProjectSpec copy ensureProjectLoaded.
          ^ baselineProjectSpec
            canUpgradeTo: aProjectRegistration baselineProjectSpec ] ].
  ^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>configurationProjectSpec [
  "only one of baselineProjectSpec or configurationProjectSpec should ever be set"

  ^ configurationProjectSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>configurationProjectSpec: anObject [
  "force the registration to be consistent -- difficult for Metacello to 
   repair registrations during load -- I've tried. "

  "https://github.com/dalehenrich/metacello-work/issues/212"

  self shouldBeMutable.
  baselineProjectSpec := nil.
  self assert: anObject isConfigurationOfProjectSpec.
  configurationProjectSpec := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>configurationProjectSpecIfAbsent: absentBlock [
    ^ configurationProjectSpec ifNil: absentBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>configurationProjectSpecIfPresent: presentBlock ifAbsent: absentBlock [
    ^ configurationProjectSpec ifNotNil: [ presentBlock cull: configurationProjectSpec ]  ifNil: absentBlock
]

{
	#category : #mutability,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>copyOnWrite: aBlock [
    "assume that only registered projects are immutable ... otherwise you'll get an error"

    | copy |
    self class registry
        registrationFor: self
        ifPresent: [ :existing |  ]
        ifAbsent: [ 
            aBlock value: self.
            ^ self ].
    self unregisterProject.
    copy := self copy.
    aBlock value: copy.
    copy registerProject.
    ^ copy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>currentBranchName [
  ^ self configurationProjectSpec
    ifNotNil: [ 
      configurationProjectSpec versionOrNil
        ifNil: [ '' ]
        ifNotNil: [ :vrsn | vrsn blessing asString ] ]
    ifNil: [ baselineProjectSpec repositoryBranchName ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>currentVersionString [
  ^ self configurationProjectSpec
    ifNotNil: [ :aSpec | aSpec versionString ]
    ifNil: [ baselineProjectSpec repositoryVersionString ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>currentlyLoadedClassesInProject [
	^ self projectSpec currentlyLoadedClassesInVersion asSet
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>hasLoadConflicts: aProjectRegistration [
	"5 combinations of loads with no load conflicts:
        No configs and baselines =
        configs = and no baselines
        configs = and baselines =
        configs = and no baseline loaded (self) with a baseline to load (aProjectRegistration)
        config loaded (self), no config to load (aProjectRegistration) and no baseline loaded(self) with a baseline to load (aProjectRegistration) "

	aProjectRegistration validate.
	self isValid
		ifFalse: [ ^ false ].
	^ self projectSpec hasConflictWithProjectSpec: aProjectRegistration projectSpec
]

{
	#category : #comparision,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>hash [
    ^ ((String stringHash: projectName initialHash: 0) bitXor: configurationProjectSpec metacelloRegistrationHash)
        bitXor: baselineProjectSpec metacelloRegistrationHash
]

{
	#category : #mutability,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>immutable [
    mutable := false
]

{
	#category : #mutability,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>isMutable [
    mutable ifNil: [ ^ true ].
    ^ mutable
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>isValid [
  " has a name and one or the other of the projectSpecs is non-nil, but not both ... this is CRITICAL"

  projectName ifNil: [ ^ false ].
  configurationProjectSpec isNil
    ifTrue: [ ^ baselineProjectSpec notNil ].
  ^ baselineProjectSpec isNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>loadedInImage [
    loadedInImage ifNil: [ loadedInImage := false ].
    ^ loadedInImage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>loadedInImage: anObject [
    self shouldBeMutable.
    loadedInImage := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>locked [
    locked ifNil: [ locked := false ].
    ^ locked
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>locked: anObject [
    self shouldBeMutable.
    locked := anObject
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>lookupBaselineSpec [
  baselineProjectSpec ifNotNil: [ :spec | ^ spec ].
  ^ configurationProjectSpec
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>lookupConfigurationSpec [
  configurationProjectSpec ifNotNil: [ :spec | ^ spec ].
  ^ baselineProjectSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>merge: aProjectRegistration [
  " ... merge is done when a spec has been loaded into the image"

  self shouldBeMutable.
  aProjectRegistration validate.
  aProjectRegistration configurationProjectSpec
    ifNotNil: [ :aSpec | 
      configurationProjectSpec := aSpec copy.
      configurationProjectSpec versionOrNil
        ifNotNil: [ :version | 
          "resolve symbolic versions for loaded projects"
          configurationProjectSpec versionString: version versionString ].
      baselineProjectSpec := nil.
      self versionInfo versionString: configurationProjectSpec versionString ]
    ifNil: [ 
      baselineProjectSpec := aProjectRegistration baselineProjectSpec.
      configurationProjectSpec := nil.
      self versionInfo
        versionString: baselineProjectSpec repositoryVersionString ]
]

{
	#category : #mutability,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>mutable [
    mutable := true
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>postCopy [
    super postCopy.
    mutable := nil
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>printOn: aStream [
  | label versionString descriptions |
  self
    configurationProjectSpecIfPresent: [ :spec | 
      label := spec className.
      versionString := spec versionString ]
    ifAbsent: [ 
      "baseline"
      label := self baselineProjectSpec className.
      versionString := '[baseline]' ].
  aStream nextPutAll: label.
  versionString
    ifNil: [ aStream nextPutAll: ' --no version specified--' ]
    ifNotNil: [ 
      aStream
        space;
        nextPutAll: versionString ].
  (descriptions := self repositoryDescriptions) isEmpty
    ifTrue: [ ^ self ].
  aStream nextPutAll: ' from '.
  descriptions size = 1
    ifTrue: [ aStream nextPutAll: descriptions first ]
    ifFalse: [ 
      aStream nextPut: ${.
      descriptions do: [ :description | aStream nextPutAll: description ].
      aStream nextPut: $} ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>projectName [
	^ projectName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>projectName: anObject [
    self shouldBeMutable.
    projectName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>projectSpec [
	^ baselineProjectSpec
		ifNil: [ 
			self assert: configurationProjectSpec notNil.
			configurationProjectSpec ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>projectVersion [
  | pv |
  pv := self versionInfo projectVersion.
  pv
    ifNil: [ 
      pv := self projectSpec versionOrNil.
      self versionInfo projectVersion: pv ].
  ^ pv
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>registerProject [
    "unconditionally register <newRegistration> ... use with care"

    self class registry registerProjectRegistration: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>repositoryDescriptions [
    ^ (self configurationProjectSpecIfAbsent: [ self baselineProjectSpec ]) repositoryDescriptions
]

{
	#category : #mutability,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>shouldBeMutable [
    self isMutable
        ifTrue: [ ^ self ].
    self error: 'Not allowed to modify an immutable object'
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>unregisterProject [
    self class registry unregisterProjectRegistration: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>validate [
	self isValid
		ifFalse: [ self error: 'Invalid project registration' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>version [
    ^ (self configurationProjectSpecIfAbsent: [ ^ MetacelloMCBaselineProject singletonVersionName ]) versionString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>versionInfo [
  versionInfo
    ifNil: [ 
      versionInfo := MetacelloProjectRegistrationVersionInfo new.
      self
        configurationProjectSpecIfPresent: [ versionInfo versionString: self version ]
        ifAbsent: [ 
          "do not set versionString for freshly minted baseline ... 
           see https://github.com/dalehenrich/metacello-work/issues/328"
           ] ].
  ^ versionInfo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistration>>versionInfo: aMetacelloProjectRegistrationVersionInfo [
  versionInfo := aMetacelloProjectRegistrationVersionInfo
]
