"
MetacelloScriptEngine runs the execution of the script for one projectSpec
"
Class {
	#name : #MetacelloScriptEngine,
	#superclass : #Object,
	#instVars : [
		'root',
		'projectSpec',
		'options'
	],
	#classVars : [
		'DefaultRepositoryDescription',
		'DefaultVersionString'
	],
	#category : #Metacello-Core-Scripts,
	#timestamp : 'dkh 7/12/2012 14:48'
}

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine class>>baseNameOf: className [
  ^ (className beginsWith: 'BaselineOf')
    ifTrue: [ className copyFrom: 'BaselineOf' size + 1 to: className size ]
    ifFalse: [ 
      (className beginsWith: 'ConfigurationOf')
        ifTrue: [ className copyFrom: 'ConfigurationOf' size + 1 to: className size ]
        ifFalse: [ className ] ]
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine class>>baselineNameFrom: baseName [
    "Return the fully-qualified configuration class name."

    ^ (baseName indexOfSubCollection: 'BaselineOf') > 0
        ifTrue: [ baseName ]
        ifFalse: [ 'BaselineOf' , baseName ]
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine class>>configurationNameFrom: baseName [
    "Return the fully-qualified configuration class name."

    ^ (baseName indexOfSubCollection: 'ConfigurationOf') > 0
        ifTrue: [ baseName ]
        ifFalse: [ 'ConfigurationOf' , baseName ]
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine class>>defaultRepositoryDescription [
    DefaultRepositoryDescription
        ifNil: [ DefaultRepositoryDescription := MetacelloPlatform current defaultRepositoryDescription ].
    ^ DefaultRepositoryDescription
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine class>>defaultRepositoryDescription: descriptionOrNil [
  DefaultRepositoryDescription := descriptionOrNil
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine class>>defaultVersionString [
    DefaultVersionString ifNil: [ DefaultVersionString := #'stable' ].
    ^ DefaultVersionString
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>cacheRepository [
    ^ (MetacelloMCProject new repositorySpec description: (self options at: #'cacheRepository' ifAbsent: [ ^ nil ]))
        createRepository
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>defaultRepositoryDescription [
    ^ self class defaultRepositoryDescription
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>defaultVersionString [
    ^ self class defaultVersionString
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>fetch: required [
    self
        fetchRecord: [ :version | 
            required isEmpty
                ifTrue: [ version fetch ]
                ifFalse: [ version fetch: required ] ]
        required: required
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>fetchRecord: fetchRecordBlock required: required [
  MetacelloProjectRegistration
    copyRegistryWhile: [ 
      self
        handleNotificationsForAction: [ 
          | version loadedSpec |
          self setDefaultsAndValidateProjectSpec.
          [ loadedSpec := self lookupProjectSpecFor: self projectSpec ]
            on: MetacelloAllowProjectDowngrade , MetacelloAllowProjectUpgrade
            do: [ :notification | 
              notification
                handleOnDownGrade: [ :ex :existing :new | ex allowEvenIfLocked ]
                onUpgrade: [ :ex :existing :new | ex allowEvenIfLocked ] ].
          version := loadedSpec versionForScriptEngine: self.
          self root: (fetchRecordBlock value: version) loadDirective ] ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>get [
  " load a fresh copy from repo"

  | spec projectPackage |
  MetacelloProjectRegistration
    copyRegistryRestoreOnErrorWhile: [ 
      self setDefaultsAndValidateProjectSpec.
      spec := self projectSpec.
      projectPackage := spec projectPackage.
      projectPackage repositorySpecs
        do: [ :repoSpec | repoSpec createRepository flushForScriptGet ].
      self cacheRepository
        ifNotNil: [ :cacheRepository | projectPackage loader loaderPolicy cacheRepository: cacheRepository ].
      projectPackage load.
      self root: (Smalltalk at: spec className asSymbol) project.
      MetacelloProjectRegistration
        registrationForProjectSpec: spec
        ifAbsent: [ :new | new registerProject ]
        ifPresent: [ :existing :new | 
          existing
            copyOnWrite: [ :existingCopy | 
              spec
                copyForRegistration: existingCopy
                onWrite: [ :specCopy | 
                  specCopy
                    ifNil: [ existingCopy merge: new ]
                    ifNotNil: [ specCopy mergeScriptRepository: spec ] ] ] ] ]
]

{
	#category : #'project lookup',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>getBaselineProjectUnconditionalLoad: unconditionalLoad [
    | project |
    project := (self getBaselineUnconditionalLoad: unconditionalLoad) project.
    project version spec repositories: self repositories copy.
    ^ project
]

{
	#category : #'project lookup',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>getBaselineUnconditionalLoad: unconditionalLoad [
  | spec |
  spec := self projectSpec.
  Smalltalk
    at: spec className asSymbol
    ifPresent: [ :cl | 
      unconditionalLoad
        ifFalse: [ ^ cl ] ].
  spec := self lookupProjectSpecFor: spec.
  [ spec projectPackage load ]
    on: MetacelloIgnorePackageLoaded
    do: [ :ex | 
      "see https://github.com/dalehenrich/metacello-work/issues/244 ... uncoditionally load
        baseline"
      ex resume: true ].
  ^ Smalltalk at: spec className asSymbol
]

{
	#category : #'project lookup',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>getConfigurationProjectUnconditionalLoad: unconditionalLoad [
    ^ (self getConfigurationUnconditionalLoad: unconditionalLoad) project
]

{
	#category : #'project lookup',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>getConfigurationUnconditionalLoad: unconditionalLoad [
    | spec |
    spec := self projectSpec.
    Smalltalk
        at: spec className asSymbol
        ifPresent: [ :cl | 
            unconditionalLoad
                ifFalse: [ ^ cl ] ].
    (spec := self lookupProjectSpecFor: spec) projectPackage load.
    ^ Smalltalk at: spec className asSymbol
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>handleConflict: exception [
    ^ (self options at: #'onConflict' ifAbsent: [ ^ exception pass ])
        cull: exception
        cull: exception existingProjectRegistration
        cull: exception newProjectRegistration
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>handleDowngrade: exception [
    ^ (self options at: #'onDowngrade' ifAbsent: [ ^ exception pass ])
        cull: exception
        cull: exception existingProjectRegistration
        cull: exception newProjectRegistration
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>handleEnsureProjectLoadedForDevelopment: exception [
    "if useCurrentVersion resume with true, else resume with false"

    ^ exception resume: self useCurrentVersion
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>handleLock: exception [
  ^ (self options at: #'onLock' ifAbsent: [ ^ exception pass ])
    cull: exception
    cull: exception existingProjectRegistration
    cull: exception newProjectRegistration
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>handleLookupBaselineSpecForEnsureLoad: exception [
  "if requested and registered don't compare equal, then ensure the new baseline is loaded"

  | requested registered |
  requested := exception projectSpec.
  registered := self lookupProjectSpecFor: exception projectSpec.
  ^ exception resume: (registered compareEqual: requested) not
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>handleLookupProjectSpec: exception [
    ^ exception
        resume:
            ((self lookupProjectSpecFor: exception projectSpec) ifNil: [ ^ exception resume: exception projectSpec ])
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>handleLookupProjectSpecForLoad: exception [
  "if overrideProjectSpec is nil, use currentVersion in image, ignoreImage is false"

  | requested override |
  requested := exception projectSpec.
  override := self useCurrentVersion
    ifTrue: [ 
      "don't do lookup in registry if we expect to use the #currentVersion calculation"
      nil ]
    ifFalse: [ 
      | registered |
      registered := self lookupProjectSpecFor: exception projectSpec.
      (registered compareEqual: requested)
        ifFalse: [ 
          "counts as override, only if they differ in some aspect"
          override := registered ] ].
  ^ exception
    resume:
      (MetacelloProjectSpecForLoad new
        projectSpec: requested;
        useDetermineVersionForLoad: self useCurrentVersion;
        overrideProjectSpec: override;
        yourself)
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>handleNotificationsForAction: actionBlock [
  [ 
  [ 
  [ 
  actionBlock
    on:
      MetacelloLookupProjectSpec , MetacelloLookupProjectSpecForLoad
        , MetacelloProjectSpecLoadedNotification
        , MetacelloScriptEnsureProjectLoadedForDevelopment
        , MetacelloLookupBaselineSpecForEnsureLoad
    do: [ :ex | 
      "lookup and registration handlers need to be innermost set of handlers ...they may throw option notifications"
      ex handleResolutionFor: self ] ]
    on:
      MetacelloAllowProjectDowngrade , MetacelloAllowProjectUpgrade
        , MetacelloAllowConflictingProjectUpgrade
    do: [ :ex | 
      "option handlers need to be outermost set of handlers ... last line of defense before users are involved"
      ex handleResolutionFor: self ] ]
    on: MetacelloAllowLockedProjectChange
    do: [ :ex | 
      "MetacelloAllowLockedProjectChange need to be outermost handler ... since it is signaled from second line of handlers"
      ex handleResolutionFor: self ] ]
    on: Warning
    do: [ :ex | 
      "Warning is absolute outermost handler"
      self handleWarning: ex ]
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>handleProjectSpecLoaded: exception [
    MetacelloProjectRegistration
        registrationForProjectSpec: exception projectSpec
        ifAbsent: [ :new | 
            new
                loadedInImage: true;
                registerProject ]
        ifPresent: [ :existing :new | 
            "unconditionally merge new with existing (updates registration)"
            existing
                copyOnWrite: [ :existingCopy | 
                    existingCopy
                        loadedInImage: true;
                        merge: new ] ].
    exception resume
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>handleUpgrade: exception [
    ^ (self options at: #'onUpgrade' ifAbsent: [ ^ exception pass ])
        cull: exception
        cull: exception existingProjectRegistration
        cull: exception newProjectRegistration
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>handleWarning: exception [
  ^ (self options at: #'onWarning' ifAbsent: [ ^ exception pass ])
    cull: exception
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>ignoreImage [
    ^ self options at: #'ignoreImage' ifAbsent: [ false ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>list [
  self setDefaultsAndValidateProjectSpec.
  self root: self projectSpec
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>load: required [
    self
        load: required
        onProjectDownGrade: [ :ex :existing :new | ex allowEvenIfLocked ]
        onProjectUpgrade: [ :ex :existing :new | ex allowEvenIfLocked ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>load: required onProjectDownGrade: onDownGradeBlock onProjectUpgrade: onUpgradeBlock [
  MetacelloProjectRegistration
    copyRegistryRestoreOnErrorWhile: [ 
      self
        handleNotificationsForAction: [ 
          | version loadedSpec |
          self setDefaultsAndValidateProjectSpec.
          [ loadedSpec := (self lookupProjectSpecFor: self projectSpec) copy ]
            on: MetacelloAllowProjectDowngrade , MetacelloAllowProjectUpgrade
            do: [ :ex | ex handleOnDownGrade: onDownGradeBlock onUpgrade: onUpgradeBlock ].
          version := loadedSpec versionForScriptEngine: self.
          self
            root:
              (required isEmpty
                ifTrue: [ version load ]
                ifFalse: [ version load: required ]) loadDirective.
          loadedSpec loads: required.
          MetacelloProjectRegistration
            registrationForProjectSpec: loadedSpec
            ifAbsent: [ :new | 
              new
                loadedInImage: true;
                registerProject ]
            ifPresent: [ :existing :new | 
              existing
                copyOnWrite: [ :existingCopy | 
                  existingCopy
                    loadedInImage: true;
                    merge: new ] ] ] ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>lock [
  | spec |
  MetacelloProjectRegistration
    copyRegistryRestoreOnErrorWhile: [ 
      self setDefaultsAndValidate: self projectSpec copy.	"don't add defaults"
      spec := self projectSpec.
      MetacelloProjectRegistration
        registrationForProjectSpec: spec
        ifAbsent: [ :new | 
          new
            locked: true;
            registerProject ]
        ifPresent: [ :existing :new | 
          existing
            copyOnWrite: [ :existingCopy | 
              existingCopy locked: true.
              spec
                copyForRegistration: existingCopy
                onWrite: [ :specCopy | 
                  specCopy
                    ifNil: [ existingCopy merge: new ]
                    ifNotNil: [ 
                      specCopy mergeScriptRepository: spec.
                      spec := specCopy ] ] ] ].
      self root: spec ]
]

{
	#category : #'project lookup',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>lookupProjectSpecFor: aProjectSpec [
  "if there is no conflict, choose new spec"

  | registration loadedSpec |
  registration := MetacelloProjectRegistration
    registrationForProjectSpec: aProjectSpec
    ifAbsent: [ :new | new ]
    ifPresent: [ :existing :new | 
      (existing hasLoadConflicts: new)
        ifTrue: [ 
          ((existing canUpgradeTo: new)
            ifTrue: [ MetacelloAllowProjectUpgrade new ]
            ifFalse: [ 
              (existing canDowngradeTo: new)
                ifTrue: [ MetacelloAllowProjectDowngrade new ]
                ifFalse: [ MetacelloAllowConflictingProjectUpgrade new ] ])
            existingProjectRegistration: existing;
            newProjectRegistration: new;
            signal ]
        ifFalse: [ new ] ].
  ^ registration projectSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>options [
    options ifNil: [ options := Dictionary new ].
    ^ options
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>options: aDictionary [
    options := aDictionary
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>projectName [
    ^ self projectSpec name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>projectSpec [
    ^ projectSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>projectSpec: aProjectSpec [
    projectSpec := aProjectSpec
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>record: required [
    self
        fetchRecord: [ :version | 
            required isEmpty
                ifTrue: [ version record ]
                ifFalse: [ version record: required ] ]
        required: required
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>register [
  | spec |
  self setDefaultsAndValidate: self projectSpec copy.	"don't add defaults"
  spec := self projectSpec.
  MetacelloProjectRegistration
    registrationForProjectSpec: spec
    ifAbsent: [ :new | new registerProject ]
    ifPresent: [ :existing :new | existing copyOnWrite: [ :existingCopy | existingCopy merge: new ] ].
  self root: spec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>repositories [
    ^ self projectSpec repositories
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>repositoryOverrides [
    ^ (self options at: #'repositoryOverrides' ifAbsent: [ ^ nil ])
        collect: [ :description | (MetacelloMCProject new repositorySpec description: description) createRepository ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>root [
	^ root
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>root: anObject [
	root := anObject
]

{
	#category : #'project lookup',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>setDefaultsAndValidate: aProjectSpec [
  "NOTE: aProjectSpec has defaults assigned if versionString or repository missing"

  | issues |
  issues := aProjectSpec
    validateForScriptLoad: self
    withDefaultVersionString: self defaultVersionString
    withDefaultRepositoryDecription: self defaultRepositoryDescription.
  issues isEmpty
    ifTrue: [ ^ self ].
  (MetacelloValidationFailure
    issues: issues
    message: 'Project spec validation failure') signal
]

{
	#category : #'project lookup',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>setDefaultsAndValidateProjectSpec [
  "NOTE: projectSpec has defaults assigned if versionString or repository missing"

  self setDefaultsAndValidate: self projectSpec
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>silently [
    ^ self options at: #'silently' ifAbsent: [ false ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>unlock [
  | spec |
  MetacelloProjectRegistration
    copyRegistryRestoreOnErrorWhile: [ 
      self setDefaultsAndValidate: self projectSpec copy.	"don't add defaults"
      spec := self projectSpec.
      MetacelloProjectRegistration
        registrationForProjectSpec: spec
        ifAbsent: [ :ignored |  ]
        ifPresent: [ :existing :new | existing copyOnWrite: [ :existingCopy | existingCopy locked: false ] ].
      self root: spec ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>unregister [
  | spec |
  self setDefaultsAndValidate: self projectSpec copy.	"don't add defaults"
  spec := self projectSpec.
  MetacelloProjectRegistration
    registrationForProjectSpec: spec
    ifAbsent: [ :ignored |  ]
    ifPresent: [ :existing :new | existing unregisterProject ].
  self root: spec
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptEngine>>useCurrentVersion [
    "private option used to implement the classic mode"

    ^ self options at: #'useCurrentVersion' ifAbsent: [ false ]
]
