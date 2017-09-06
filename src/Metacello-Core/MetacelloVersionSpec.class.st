"

"
Class {
	#name : #MetacelloVersionSpec,
	#superclass : #MetacelloSpec,
	#instVars : [
		'versionString',
		'blessing',
		'description',
		'author',
		'timestamp',
		'preLoadDoIt',
		'postLoadDoIt',
		'packageList',
		'importName',
		'importArray'
	],
	#category : #Metacello-Core-Specs,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>author [

	author == nil 
		ifTrue: [
			^self project valueHolderSpec
				value: '';
				yourself].
	^ author
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>author: anObject [

	anObject setAuthorInMetacelloVersion: self
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>author: aBlockOrString constructor: aVersionConstructor [
    aVersionConstructor authorForVersion: aBlockOrString
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>baseline: aString constructor: aVersionConstructor [
    aVersionConstructor baselineForVersion: aString
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>baseline: aString with: aBlockOrString constructor: aVersionConstructor [
    aVersionConstructor baselineForVersion: aString with: aBlockOrString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>blessing [

	blessing == nil 
		ifTrue: [
			^self project valueHolderSpec
				value: self project defaultBlessing;
				yourself].
	^ blessing
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>blessing: anObject [

	anObject setBlessingInMetacelloVersion: self
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>blessing: aBlockOrString constructor: aVersionConstructor [
    aVersionConstructor blessingForVersion: aBlockOrString
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>configMethodBasicOn: aStream last: last indent: indent [
    | values lastIndex lastBlock |
    last
        ifTrue: [ 
            "need to calculate last statement with a value"
            values := {(self getBlessing).
            (self getDescription).
            (self getPreLoadDoIt).
            (self getPostLoadDoIt).
            (self getAuthor).
            (self getTimestamp)}.
            1 to: values size do: [ :index | 
                (values at: index) ~~ nil
                    ifTrue: [ lastIndex := index ] ].
            lastBlock := [ :arg | arg = lastIndex ] ]
        ifFalse: [ lastBlock := [ :arg | false ] ].
    self
        configMethodValueOn: aStream
        for: self getBlessing
        selector: 'blessing:'
        last: (lastBlock value: 1)
        indent: indent.
    self
        configMethodValueOn: aStream
        for: self getDescription
        selector: 'description:'
        last: (lastBlock value: 2)
        indent: indent.
    self
        configMethodValueOn: aStream
        for: self getPreLoadDoIt
        selector: 'preLoadDoIt:'
        last: (lastBlock value: 3)
        indent: indent.
    self
        configMethodValueOn: aStream
        for: self getPostLoadDoIt
        selector: 'postLoadDoIt:'
        last: (lastBlock value: 4)
        indent: indent.
    self
        configMethodValueOn: aStream
        for: self getAuthor
        selector: 'author:'
        last: (lastBlock value: 5)
        indent: indent.
    self
        configMethodValueOn: aStream
        for: self getTimestamp
        selector: 'timestamp:'
        last: (lastBlock value: 6)
        indent: indent
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>configMethodOn: aStream for: spec selector: selector last: last indent: indent [
	spec == nil
		ifTrue: [ ^ self ].
	aStream
		tab: indent;
		nextPutAll: 'spec ' , selector , ' [';
		cr.
	spec configMethodOn: aStream indent: indent + 1.
	aStream nextPutAll: ' ].'.
	last
		ifFalse: [ aStream cr ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>configMethodOn: aStream indent: indent [

	self configMethodOn: aStream last: true indent: indent
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>configMethodOn: aStream last: last indent: indent [
    | spec hasPackageSpecs |
    hasPackageSpecs := false.
    self packagesSpec list
        do: [ :member | 
            member spec
                projectDo: [ :proj | 
                    member spec name ~~ nil
                        ifTrue: [ hasPackageSpecs := true ] ]
                packageDo: [ :package | 
                    member spec name ~~ nil
                        ifTrue: [ hasPackageSpecs := true ] ]
                groupDo: [ :group | 
                    member spec name ~~ nil
                        ifTrue: [ hasPackageSpecs := true ] ] ].
    self configMethodBasicOn: aStream last: hasPackageSpecs not indent: indent.
    self configPackagesSpecMethodOn: aStream indent: indent.
    last
        ifFalse: [ aStream cr ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>configMethodValueOn: aStream for: spec selector: selector last: last indent: indent [
	| valuePrintString |
	spec == nil
		ifTrue: [ ^ self ].
	valuePrintString := spec value isSymbol
		ifTrue: [ '#' , spec value asString printString ]
		ifFalse: [ spec value printString ].
	aStream
		tab: indent;
		nextPutAll: 'spec ' , selector , ' ' , valuePrintString , '.'.
	last
		ifFalse: [ aStream cr ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>configPackagesSpecMethodOn: aStream indent: indent [

	| projectSpecs packageSpecs groupSpecs |
	projectSpecs := OrderedCollection new.
	packageSpecs := OrderedCollection new.
	groupSpecs := OrderedCollection new.
	self packagesSpec list do: [:member |
		member spec 
			projectDo: [:proj | member spec name ~~ nil ifTrue: [ projectSpecs add: member ]]
			packageDo: [:package | member spec name ~~ nil ifTrue: [ packageSpecs add: member ]]
			groupDo: [:group | member spec name ~~ nil ifTrue: [ groupSpecs add: member ]]].
	projectSpecs isEmpty not
		ifTrue: [
			aStream tab: indent; nextPutAll: 'spec '.
			projectSpecs size > 1 ifTrue: [ aStream cr; tab: indent + 1 ].
			1 to: projectSpecs size  do: [:index | 
				(projectSpecs at: index) configMethodCascadeOn: aStream last: index == projectSpecs size indent: indent + 1.
				index ~= projectSpecs size ifTrue: [ aStream tab: indent + 1 ]]].
	packageSpecs isEmpty not
		ifTrue: [
			projectSpecs isEmpty not ifTrue: [ aStream cr ].
			aStream tab: indent; nextPutAll: 'spec '.
			packageSpecs size > 1 ifTrue: [ aStream cr; tab: indent + 1 ].
			1 to: packageSpecs size  do: [:index | 
				(packageSpecs at: index) configMethodCascadeOn: aStream last: index == packageSpecs size indent: indent + 1.
				index ~= packageSpecs size ifTrue: [ aStream tab: indent + 1 ]]].
	groupSpecs isEmpty not
		ifTrue: [
			projectSpecs isEmpty not | packageSpecs isEmpty not ifTrue: [ aStream cr ].
			aStream tab: indent; nextPutAll: 'spec '.
			groupSpecs size > 1 ifTrue: [ aStream cr; tab: indent + 1 ].
			1 to: groupSpecs size  do: [:index | 
				(groupSpecs at: index) configMethodCascadeOn: aStream last: index == groupSpecs size indent: indent + 1.
				index ~= groupSpecs size ifTrue: [ aStream tab: indent + 1 ]]].
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>configSpawnMethodOn: aStream indent: indent [

	self configMethodValueOn: aStream for: self getBlessing selector: 'blessing:' last: false indent: indent.
	self configMethodValueOn: aStream for: self getAuthor selector: 'author:' last: false indent: indent.
	self configMethodValueOn: aStream for: self getTimestamp selector: 'timestamp:' last: false indent: indent.
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>configuration: aString with: aBlockOrString constructor: aVersionConstructor [
    aVersionConstructor configurationForVersion: aString with: aBlockOrString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>createVersion [

	^self versionClass fromSpec: self
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>defaultPackageNames [
	"if there is a package named 'default' (a group) then it defines the default package names,
	 otherwise answer a list of all of the package names in this version"

	self packages packageNamed: 'default' ifAbsent: [ ^self packageNames ].
	^#('default')
]

{
	#category : #'toolbox support',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>deleteSpec: aSpec [
    "remove the spec from packages"

    self packages deleteSpec: aSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>description [

	description == nil 
		ifTrue: [
			^self project valueHolderSpec
				value: '';
				yourself].
	^ description
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>description: anObject [

	anObject setDescriptionInMetacelloVersion: self
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>description: aBlockOrString constructor: aVersionConstructor [
    aVersionConstructor descriptionForVersion: aBlockOrString
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>difference: otherVersionSpec [
    "Return a dictionary of additions, removals and modifications"

    | report myProjectSpecs otherProjectSpecs |
    report := MetacelloVersionDiffReport new.
    myProjectSpecs := Dictionary new.
    self
        projectDo: [ :projectSpec | myProjectSpecs at: projectSpec name put: projectSpec ]
        packageDo: [ :ignored |  ]
        groupDo: [ :ignored |  ].
    otherProjectSpecs := Dictionary new.
    otherVersionSpec
        projectDo: [ :projectSpec | otherProjectSpecs at: projectSpec name put: projectSpec ]
        packageDo: [ :ignored |  ]
        groupDo: [ :ignored |  ].
    myProjectSpecs
        valuesDo: [ :myProjectSpec | 
            | otherProjectSpec |
            otherProjectSpec := otherProjectSpecs at: myProjectSpec name ifAbsent: [  ].
            otherProjectSpec == nil
                ifTrue: [ 
                    report removals
                        at: myProjectSpec name
                        put:
                            {(myProjectSpec versionString).
                            ''} ]
                ifFalse: [ 
                    myProjectSpec versionString = otherProjectSpec versionString
                        ifFalse: [ 
                            report modifications
                                at: myProjectSpec name
                                put:
                                    {(myProjectSpec versionString).
                                    (otherProjectSpec versionString)} ] ] ].
    otherProjectSpecs
        valuesDo: [ :otherProjectSpec | 
            (myProjectSpecs at: otherProjectSpec name ifAbsent: [  ]) == nil
                ifTrue: [ 
                    report additions
                        at: otherProjectSpec name
                        put:
                            {''.
                            (otherProjectSpec versionString)} ] ].
    ^ report
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>expandToLoadableSpecNames: nameList [

	| cacheKey names |
	cacheKey := Array with: self label with: nameList.
	^MetacelloPlatform current
		stackCacheFor: #loadableSpecNames
		at: cacheKey
		doing: [ :cache | 
			names := (self resolveToLoadableSpecs: nameList) collect: [:spec | spec name ].
			cache at: cacheKey put: names ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>getAuthor [
	^author
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>getBlessing [
	^blessing
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>getDescription [
	^description
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>getPostLoadDoIt [
	^postLoadDoIt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>getPreLoadDoIt [
	^preLoadDoIt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>getTimestamp [
	^timestamp
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>group: aString overrides: aStringOrCollection constructor: aVersionConstructor [
    aVersionConstructor groupForVersion: aString overrides: aStringOrCollection
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>group: aString with: aStringOrCollection constructor: aVersionConstructor [
    aVersionConstructor groupForVersion: aString with: aStringOrCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>import [
    ^ importName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>import: aString [
  importName := aString
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>import: aString constructor: aVersionConstructor [
    aVersionConstructor importForVersion: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>import: aString provides: anArray [
  importArray := importArray
    ifNil: [ {(aString -> anArray)} ]
    ifNotNil: [ importArray , {(aString -> anArray)} ]
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>import: aString provides: anArray constructor: aVersionConstructor [
  aVersionConstructor importForVersion: aString provides: anArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>importArray [
  ^ importArray
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>isPartiallyCurrent: notLoadedMatters useEquality: useEquality [

	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>isPossibleBaseline [
    self subclassResponsibility
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>label [

	^self versionString, ' [', self projectLabel, ']'
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>mergeMap [
    | map |
    map := super mergeMap.
    map at: #'versionString' put: versionString.
    map at: #'blessing' put: blessing.
    map at: #'description' put: description.
    map at: #'author' put: author.
    map at: #'timestamp' put: timestamp.
    map at: #'preLoadDoIt' put: preLoadDoIt.
    map at: #'postLoadDoIt' put: postLoadDoIt.
    map at: #'packageList' put: self packages.
    ^ map
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>mergeSpec: anotherSpec [
    | newSpec map anotherPackages |
    newSpec := super mergeSpec: anotherSpec.
    map := anotherSpec mergeMap.
    (anotherPackages := map at: #'packageList') isEmpty not
        ifTrue: [ 
            newSpec
                packages:
                    (self packages isEmpty
                        ifTrue: [ anotherPackages ]
                        ifFalse: [ self packages mergeSpec: anotherPackages ]) ].
    ^ newSpec
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>nonOverridable [
    ^ super nonOverridable , #(#'packageList')
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>packageNamed: aString [

	^self packageNamed: aString ifAbsent: [ nil ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>packageNamed: aString forLoad: ignored forMap: map ifAbsent: absentBlock [
  "at the end of the day, I don't the forLoad arg is important ... 
   it just ends up triggering an error ... when during a real load, you would 
   not get error. After a decent period of mourning we should just scrub this 
   arg from system"

  | importSpec |
  ^ map
    at: aString
    ifAbsent: [ 
      (self importArray notNil or: [ self import notNil ])
        ifTrue: [ 
          "expect the 'missing' name to be satisfied within context of imported project"
          importArray
            ifNotNil: [ 
              importArray
                do: [ :assoc | 
                  ((assoc value includes: aString) and: [ map includesKey: assoc key ])
                    ifTrue: [ 
                      importSpec := (map at: assoc key)
                        mergeImportLoads: {aString};
                        yourself ] ].
              importSpec ifNotNil: [ ^ importSpec ] ].
          (importSpec isNil and: [ self import notNil ])
            ifTrue: [ 
              ^ (map at: self import ifAbsent: absentBlock)
                mergeImportLoads: {aString};
                yourself ] ].
      (aString = 'default' or: [ aString = 'ALL' ])
        ifTrue: [ 
          self project groupSpec
            name: aString;
            includes: self packageNames;
            yourself ]
        ifFalse: [ absentBlock value ] ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>packageNamed: aString forMap: map ifAbsent: absentBlock [
    "import: only allowed to be used with baseline project specs"

    ^ self
        packageNamed: aString
        forLoad: true
        forMap: map
        ifAbsent: absentBlock
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>packageNamed: aString ifAbsent: aBlock [

	^self packageNamed: aString forMap: self packages map ifAbsent: aBlock
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>packageNames [
    packageList == nil
        ifTrue: [ ^ #() ].
    ^ self packages map keys asSet
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>packageSpecsInLoadOrder [
  ^ self packages packageSpecsInLoadOrderFor: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>packages [
    packageList == nil
        ifTrue: [ packageList := self project packagesSpec ].
    ^ packageList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>packages: anObject [
    packageList := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>packagesSpec [

	^self packages
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>postCopy [
    super postCopy.
    blessing := blessing copy.
    description := description copy.
    author := author copy.
    timestamp := timestamp copy.
    packageList := packageList copy
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>postLoadDoIt [

	^postLoadDoIt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>postLoadDoIt: anObject [

	anObject setPostLoadDoItInMetacelloSpec: self
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>postLoadDoIt: aSymbol constructor: aVersionConstructor [
    aVersionConstructor postLoadDoItForVersion: aSymbol
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>preLoadDoIt [

	^preLoadDoIt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>preLoadDoIt: anObject [

	anObject setPreLoadDoItInMetacelloSpec: self
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>preLoadDoIt: aSymbol constructor: aVersionConstructor [
    aVersionConstructor preLoadDoItForVersion: aSymbol
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>project: aString constructor: aVersionConstructor [
    aVersionConstructor projectForVersion: aString
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>project: aString copyFrom: oldSpecName with: aBlock constructor: aVersionConstructor [
    aVersionConstructor projectForVersion: aString copyFrom: oldSpecName with: aBlock
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>project: aString overrides: aBlock constructor: aVersionConstructor [
    aVersionConstructor projectForVersion: aString overrides: aBlock
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>project: aString with: aBlockOrString constructor: aVersionConstructor [
    aVersionConstructor projectForVersion: aString with: aBlockOrString
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>projectDo: projectBlock packageDo: packageBlock groupDo: groupBlock [

	self packageSpecsInLoadOrder do: [:pkgSpec |
		pkgSpec projectDo: projectBlock packageDo: packageBlock groupDo: groupBlock ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>projectLabel [

	^self project label
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>removeGroup: aString constructor: aVersionConstructor [
    aVersionConstructor removeGroupForVersion: aString
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>removeProject: aString constructor: aVersionConstructor [
    aVersionConstructor removeProjectForVersion: aString
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>repositories: aBlock constructor: aVersionConstructor [
    aVersionConstructor repositoriesForVersion: aBlock
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>repository: anObject constructor: aVersionConstructor [
    aVersionConstructor repositoryForVersion: anObject
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>repository: aString username: username password: password constructor: aVersionConstructor [
    aVersionConstructor repositoryForVersion: aString username: username password: password
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>resolveToLoadableSpec: aString forLoad: forLoad forMap: map packages: packageMap [
    | package |
    package := self
        packageNamed: aString
        forLoad: forLoad
        forMap: map
        ifAbsent: [ ^ self error: 'Name not found: ' , aString ].
    packageMap at: package name put: package.
    ^ {package}
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>resolveToLoadableSpecs: nameList [
  "Resolves names in namelist to the  list of packages and projects in the version that would be loaded. Projects are 
	not traversed during the transitive closure. The scope is that of the version itself.
	   If the spec is a package, answer a list including the package and the transitive closure on 
			its #requires: and #includes: fields.
	   If the spec is a project, answer the project.
	   If the spec is a group, answers the list of packages in the #includes: field of the group. 
			Groups in the #includes: field are expanded following the transitive closure on groups"

  | map |
  map := Dictionary new.
  self resolveToLoadableSpecs: nameList forLoad: false map: map.
  ^ map values
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>resolveToLoadableSpecs: required forLoad: forLoad map: packageMap [
  | reqd allReqd map newReqd spec |
  reqd := required copy.
  allReqd := Set new.
  map := self packages map.
  [ reqd isEmpty ]
    whileFalse: [ 
      newReqd := Set new.
      reqd
        do: [ :req | 
          (self
            resolveToLoadableSpec: req
            forLoad: forLoad
            forMap: map
            packages: packageMap)
            do: [ :loadableSpec | 
              newReqd addAll: loadableSpec requires.
              newReqd addAll: loadableSpec includes ] ].
      allReqd addAll: reqd.
      newReqd removeAllFoundIn: allReqd.
      reqd := newReqd ].
  packageMap keys
    do: [ :pkgName | 
      (spec := (packageMap at: pkgName) resolveToLoadableSpec) == nil
        ifTrue: [ packageMap removeKey: pkgName ]
        ifFalse: [ packageMap at: pkgName put: (packageMap at: pkgName) resolveToLoadableSpec ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>setAuthor: anObject [
	author := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>setBlessing: anObject [
	blessing := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>setDescription: anObject [
	description := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>setImport: anArray [
  importArray := importArray
    ifNil: [ anArray ]
    ifNotNil: [ importArray , anArray ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>setPostLoadDoIt: aSymbol [

	postLoadDoIt := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>setPreLoadDoIt: aSymbol [

	preLoadDoIt := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>setTimestamp: anObject [
	timestamp := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>timestamp [

	timestamp == nil 
		ifTrue: [
			^self project valueHolderSpec
				value: '';
				yourself].
	^ timestamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>timestamp: anObject [

	anObject setTimestampInMetacelloVersion: self
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>timestamp: aBlockOrStringOrDateAndTime constructor: aVersionConstructor [
    aVersionConstructor timestampForVersion: aBlockOrStringOrDateAndTime
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>versionClass [

	^MetacelloVersion
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>versionNumber [
    ^ self project versionNumberClass fromString: self versionString
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>versionString [
	versionString == nil ifTrue: [ ^'' ].
	^ versionString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>versionString: anObject [
	versionString := anObject
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionSpec>>versionString: anObject constructor: aVersionConstructor [
    aVersionConstructor versionStringForVersion: anObject
]
