"

"
Class {
	#name : #MetacelloProjectRegistry,
	#superclass : #Object,
	#instVars : [
		'baselineRegistry',
		'configurationRegistry'
	],
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>baselineProjectSpecs [
    "MetacelloProjectRegistration baselineProjectSpecs"

    | projectSpecs |
    projectSpecs := OrderedCollection new.
    self baselineRegistry
        keysAndValuesDo: [ :className :registration | projectSpecs add: (self projectSpecForClassNamed: className ifAbsent: [ self error: 'not expected' ]) ].
    ^ projectSpecs asArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>baselineRegistry [
    baselineRegistry ifNil: [ baselineRegistry := Dictionary new ].
    ^ baselineRegistry
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>configurationProjectSpecs [
    "MetacelloProjectRegistration configurationProjectSpecs"

    | projectSpecs |
    projectSpecs := OrderedCollection new.
    self configurationRegistry
        keysAndValuesDo: [ :className :registration | projectSpecs add: (self projectSpecForClassNamed: className ifAbsent: [ self error: 'not expected' ]) ].
    ^ projectSpecs asArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>configurationRegistry [
    configurationRegistry ifNil: [ configurationRegistry := Dictionary new ].
    ^ configurationRegistry
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>isEmpty [
  ^ self configurationProjectSpecs isEmpty
    and: [ self baselineProjectSpecs isEmpty ]
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>postCopy [
    super postCopy.
    baselineRegistry := self baselineRegistry copy.
    configurationRegistry := self configurationRegistry copy
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>primeRegisterLoadedProjectSpec: projectSpec [
  MetacelloProjectRegistration
    registrationForProjectSpec: projectSpec
    ifAbsent: [ :new | 
      new
        loadedInImage: true;
        registerProject ]
    ifPresent: [ :existing :new | 
      existing
        copyOnWrite: [ :existingCopy | 
          existingCopy loadedInImage: true.
          existing locked
            ifFalse: [ 
              "lock takes precedence when priming from image"
              existingCopy merge: new ] ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>primeRegistryCurrentVersionFor: cl [
  ^ [ cl project currentVersion ]
    on: Error
    do: [ :ex | 
      Warning
        signal:
          'Error finding current version of ' , cl name asString
            , '. Probably an invalid specification.'.
      nil ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>primeRegistryFromImage [
  "MetacelloProjectRegistration primeRegistryFromImage"

  self primeRegistryFromImage: false
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>primeRegistryFromImage: prioritizeConfiguration [
  "MetacelloProjectRegistration primeRegistryFromImage"

  self
    primeRegistryFromImage: MetacelloProjectRegistration configurationClasses
    baselineClasses: MetacelloProjectRegistration baselineClasses
    prioritizeConfiguration: prioritizeConfiguration
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>primeRegistryFromImage: configurationClasses baselineClasses: baselineClasses [
  "MetacelloProjectRegistration primeRegistryFromImage"

  self
    primeRegistryFromImage: configurationClasses
    baselineClasses: baselineClasses
    prioritizeConfiguration: false
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>primeRegistryFromImage: configurationClasses baselineClasses: baselineClasses prioritizeConfiguration: prioritizeConfiguration [
  "MetacelloProjectRegistration primeRegistryFromImage"

  baselineClasses
    do: [ :cl | 
      (self baselineRegistry includesKey: cl name asString)
        ifFalse: [ 
          "not registered"
          (self primeRegistryCurrentVersionFor: cl)
            ifNotNil: [ :version | 
              | projectSpec |
              projectSpec := (version project projectSpec
                name: (MetacelloScriptEngine baseNameOf: cl name asString);
                repositories: version project projectPackage repositories copy;
                yourself) asBaselineProjectSpec.
              self primeRegisterLoadedProjectSpec: projectSpec ] ] ].
  configurationClasses
    do: [ :cl | 
      (self configurationRegistry includesKey: cl name asString)
        ifFalse: [ 
          "not registered"
          (self primeRegistryCurrentVersionFor: cl)
            ifNotNil: [ :version | 
              | projectSpec repos projectPackage project |
              project := version project.
              projectPackage := project projectPackage.
              repos := nil.
              projectPackage ~~ nil
                ifTrue: [ repos := projectPackage repositories copy ].
              projectSpec := (version project projectSpec
                name: (MetacelloScriptEngine baseNameOf: cl name asString);
                className: cl name asString;
                versionString: version versionString;
                repositories: repos;
                yourself) asConfigurationProjectSpec.
              (prioritizeConfiguration
                or: [ (self primeRegistryProjectSpecRegistered: projectSpec) not ])
                ifTrue: [ 
                  "Configuration override existing registrations or nothing registered yet"
                  self primeRegisterLoadedProjectSpec: projectSpec ] ] ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>primeRegistryProjectSpecRegistered: projectSpec [
  MetacelloProjectRegistration
    registrationForProjectSpec: projectSpec
    ifAbsent: [ :new | ^ false ]
    ifPresent: [ :existing :new | ^ true ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>projectSpecForClassNamed: aClassName ifAbsent: absentBlock [
    ^ (self configurationRegistry
        at: aClassName
        ifAbsent: [ ^ (self baselineRegistry at: aClassName ifAbsent: [^absentBlock value]) baselineProjectSpec ])
        configurationProjectSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>projectSpecs [
    "MetacelloProjectRegistration projectSpecs"

    ^ self configurationProjectSpecs , self baselineProjectSpecs
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>registerProjectRegistration: aMetacelloProjectRegistration [
  "unconditionally register <newRegistration> ... use with care"

  aMetacelloProjectRegistration configurationProjectSpec copy
    ifNotNil: [ :spec | 
      self configurationRegistry
        at: spec className
        ifPresent: [ :existing | 
          (existing configurationProjectSpec registrationsCompareEqual: spec)
            ifFalse: [ 
              Transcript
                cr;
                show:
                    'REGISTRATION OF INCOMPATABLE PROJECTS: ' , existing printString
                        , ' REPLACED BY '
                        , aMetacelloProjectRegistration printString ] ].
      spec versionOrNil
        ifNotNil: [ :version | 
          "resolve symbolic versions for loaded projects"
          spec versionString: version versionString ].
      aMetacelloProjectRegistration configurationProjectSpec: spec.
      (aMetacelloProjectRegistration respondsTo: #'versionInfo')
        ifTrue: [ aMetacelloProjectRegistration versionInfo setVersionString: spec versionString ].
      spec immutable.
      self configurationRegistry
        at: spec className
        put: aMetacelloProjectRegistration ].
  aMetacelloProjectRegistration baselineProjectSpec
    ifNotNil: [ :spec | 
      self baselineRegistry
        at: spec className
        ifPresent: [ :existing | 
          (existing baselineProjectSpec registrationsCompareEqual: spec)
            ifFalse: [ 
              Transcript
                cr;
                show:
                    'REGISTRATION OF INCOMPATABLE PROJECTS: ' , existing printString
                        , ' REPLACED BY '
                        , aMetacelloProjectRegistration printString ] ].
      (aMetacelloProjectRegistration respondsTo: #'versionInfo')
        ifTrue: [ 
          aMetacelloProjectRegistration versionInfo
            setVersionString: spec repositoryVersionString ].
      spec immutable.
      self baselineRegistry
        at: spec className
        put: aMetacelloProjectRegistration ].
  aMetacelloProjectRegistration immutable
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>registrationFor: aMetacelloProjectRegistration ifPresent: presentBlock ifAbsent: absentBlock [
    | baseName |
    baseName := aMetacelloProjectRegistration baseName.
    aMetacelloProjectRegistration configurationProjectSpec
        ifNotNil: [ :spec | self configurationRegistry at: spec className ifPresent: [ :existing | ^ presentBlock value: existing ] ].
    aMetacelloProjectRegistration baselineProjectSpec
        ifNotNil: [ :spec | self baselineRegistry at: spec className ifPresent: [ :existing | ^ presentBlock value: existing ] ].
    self configurationRegistry
        at: 'ConfigurationOf' , baseName
        ifPresent: [ :existing | ^ presentBlock value: existing ].
    self baselineRegistry at: 'BaselineOf' , baseName ifPresent: [ :existing | ^ presentBlock value: existing ].
    ^ absentBlock value
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>registrationForClassNamed: aClassName ifAbsent: absentBlock [
  ^ self
    registrationForExactClassNamed: aClassName
    ifAbsent: [ 
      | baseName |
      baseName := MetacelloScriptEngine baseNameOf: aClassName.
      self configurationRegistry
        at: 'ConfigurationOf' , baseName
        ifPresent: [ :registration | ^ registration ].
      self baselineRegistry
        at: 'BaselineOf' , baseName
        ifPresent: [ :registration | ^ registration ].
      absentBlock value ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>registrationForExactClassNamed: aClassName ifAbsent: absentBlock [
  self configurationRegistry
    at: aClassName
    ifPresent: [ :registration | ^ registration ].
  self baselineRegistry
    at: aClassName
    ifPresent: [ :registration | ^ registration ].
  ^ absentBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>registrations [
  ^ self baselineRegistry values , self configurationRegistry values
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectRegistry>>unregisterProjectRegistration: aMetacelloProjectRegistration [
    aMetacelloProjectRegistration configurationProjectSpec
        ifNotNil: [ :spec | 
            self configurationRegistry
                removeKey: spec className
                ifAbsent: [ self error: 'unexpectedly missing project registration' ] ].
    aMetacelloProjectRegistration baselineProjectSpec
        ifNotNil: [ :spec | self baselineRegistry removeKey: spec className ifAbsent: [ self error: 'unexpectedly missing project registration' ] ]
]
