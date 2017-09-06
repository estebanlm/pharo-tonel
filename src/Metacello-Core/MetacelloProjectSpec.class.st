"

"
Class {
	#name : #MetacelloProjectSpec,
	#superclass : #MetacelloSpec,
	#instVars : [
		'name',
		'className',
		'versionString',
		'operator',
		'loads',
		'preLoadDoIt',
		'postLoadDoIt'
	],
	#category : #Metacello-Core-Specs,
	#timestamp : ''
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>addToMetacelloPackages: aMetacelloPackagesSpec [

	| spec |
	spec := (aMetacelloPackagesSpec project projectReferenceSpec)
			name: self name;
			projectReference: self copy;
			yourself.
	aMetacelloPackagesSpec addMember: 
		(aMetacelloPackagesSpec addMember 
			name: spec name;
			spec: spec;
			yourself)
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>canDowngradeTo: aMetacelloProjectSpec [
  (self className = aMetacelloProjectSpec className
    and: [ self operator == aMetacelloProjectSpec operator ])
    ifFalse: [ ^ false ].
  self versionOrNil == nil
    ifTrue: [ 
      "https://github.com/dalehenrich/metacello-work/issues/198#issuecomment-21737458"
      ^ true ].
  ^ (self compareVersions: aMetacelloProjectSpec usingOperator: self operator)
    not
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>canUpgradeTo: aMetacelloProjectSpec [
  (self className = aMetacelloProjectSpec className
    and: [ self operator == aMetacelloProjectSpec operator ])
    ifFalse: [ ^ false ].
  self versionOrNil == nil
    ifTrue: [ 
      "https://github.com/dalehenrich/metacello-work/issues/198#issuecomment-21737458"
      ^ true ].
  ^ self compareVersions: aMetacelloProjectSpec usingOperator: self operator
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>className [
    className ifNil: [ self name ifNotNil: [ self className: self constructClassName ] ].
    ^ className
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>className: aString [
    self shouldBeMutable.
    className := aString
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>className: aString constructor: aVersionConstructor [
    aVersionConstructor classNameForProject: aString
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>compareEqual: aMetacelloProjectSpec [
  "name className versionString operator loads preLoadDoIt postLoadDoIt"

  ^ self className = aMetacelloProjectSpec className
    and: [ 
      (self compareVersionsEqual: aMetacelloProjectSpec)
        and: [ 
          self operator == aMetacelloProjectSpec operator
            and: [ 
              self loads = aMetacelloProjectSpec loads
                and: [ 
                  self preLoadDoIt value == aMetacelloProjectSpec preLoadDoIt value
                    and: [ self postLoadDoIt value == aMetacelloProjectSpec postLoadDoIt value ] ] ] ] ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>compareVersions: aMetacelloProjectSpec usingOperator: anOperator [
  ^ aMetacelloProjectSpec versionOrNil == nil
    ifTrue: [ 
      "https://github.com/dalehenrich/metacello-work/issues/199#issuecomment-21739622"
      aMetacelloProjectSpec versionString asMetacelloVersionNumber
        perform: anOperator
        with: self version versionNumber ]
    ifFalse: [ ^ aMetacelloProjectSpec version perform: anOperator with: self version ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>compareVersionsEqual: aMetacelloProjectSpec [
  | vrsn otherVrsn |
  vrsn := self versionOrNil.
  otherVrsn := aMetacelloProjectSpec versionOrNil.
  vrsn ifNil: [ ^ vrsn = otherVrsn ].
  otherVrsn ifNil: [ ^ false ].
  ^ vrsn versionNumber = otherVrsn versionNumber
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>configHasVersionString [
  ^ self versionString ~~ nil
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>configMethodBodyOn: aStream indent: indent [
  ^ self configMethodBodyOn: aStream indent: indent fromShortCut: false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>configMethodBodyOn: aStream indent: indent fromShortCut: fromShortCut [
  | hasVersionString hasOperator hasProjectPackage hasLoads hasClassName hasPreLoadDoIt hasPostLoadDoIt |
  hasClassName := self hasClassName.
  hasVersionString := self configHasVersionString.
  hasOperator := operator ~~ nil.
  hasProjectPackage := self hasRepository
    or: [ hasClassName & (self getFile ~~ nil) ].
  hasLoads := self loads ~~ nil.
  hasPreLoadDoIt := self getPreLoadDoIt ~~ nil.
  hasPostLoadDoIt := self getPostLoadDoIt ~~ nil.
  hasClassName
    ifTrue: [ 
      hasVersionString | hasOperator | hasProjectPackage | hasLoads
        ifTrue: [ 
          aStream
            cr;
            tab: indent + 1 ]
        ifFalse: [ aStream space ].
      aStream nextPutAll: 'className: ' , self className printString.
      hasVersionString | hasPreLoadDoIt | hasPostLoadDoIt | hasOperator
        | hasLoads | hasProjectPackage
        ifTrue: [ aStream nextPut: $; ] ].
  hasVersionString
    ifTrue: [ 
      | vs |
      hasClassName | hasOperator | hasProjectPackage | hasLoads | hasPreLoadDoIt
        | hasPostLoadDoIt
        ifTrue: [ 
          aStream
            cr;
            tab: indent + 1 ]
        ifFalse: [ aStream space ].
      vs := self versionString.
      aStream nextPutAll: 'versionString: '.
      vs isSymbol
        ifTrue: [ aStream nextPut: $# ].
      aStream nextPutAll: vs asString printString.
      hasPreLoadDoIt | hasPostLoadDoIt | hasOperator | hasProjectPackage
        | hasLoads
        ifTrue: [ aStream nextPut: $; ] ].
  hasPreLoadDoIt
    ifTrue: [ 
      hasClassName | hasOperator | hasProjectPackage | hasLoads | hasPreLoadDoIt
        ifTrue: [ 
          aStream
            cr;
            tab: indent + 1 ]
        ifFalse: [ aStream space ].
      aStream nextPutAll: 'preLoadDoIt: '.
      self preLoadDoIt value isSymbol
        ifTrue: [ 
          aStream
            nextPut: $#;
            nextPutAll: self preLoadDoIt value asString printString ]
        ifFalse: [ aStream nextPutAll: self preLoadDoIt value asString ].
      hasPostLoadDoIt | hasOperator | hasProjectPackage | hasLoads
        ifTrue: [ aStream nextPut: $; ] ].
  hasPostLoadDoIt
    ifTrue: [ 
      hasClassName | hasOperator | hasProjectPackage | hasLoads | hasPostLoadDoIt
        ifTrue: [ 
          aStream
            cr;
            tab: indent + 1 ]
        ifFalse: [ aStream space ].
      aStream nextPutAll: 'postLoadDoIt: '.
      self postLoadDoIt value isSymbol
        ifTrue: [ 
          aStream
            nextPut: $#;
            nextPutAll: self postLoadDoIt value asString printString ]
        ifFalse: [ aStream nextPutAll: self postLoadDoIt value asString ].
      hasOperator | hasProjectPackage | hasLoads
        ifTrue: [ aStream nextPut: $; ] ].
  hasOperator
    ifTrue: [ 
      hasClassName | hasVersionString | hasProjectPackage | hasLoads | hasPreLoadDoIt
        | hasPostLoadDoIt
        ifTrue: [ 
          aStream
            cr;
            tab: indent + 1 ]
        ifFalse: [ aStream space ].
      aStream nextPutAll: 'operator: #' , self operator asString printString.
      hasProjectPackage | hasLoads
        ifTrue: [ aStream nextPut: $; ] ].
  hasLoads
    ifTrue: [ 
      hasClassName | hasVersionString | hasOperator | hasProjectPackage
        | hasPreLoadDoIt | hasPostLoadDoIt
        ifTrue: [ 
          aStream
            cr;
            tab: indent + 1 ]
        ifFalse: [ aStream space ].
      aStream nextPutAll: 'loads: #('.
      self loads do: [ :str | aStream nextPutAll: str printString , ' ' ].
      aStream nextPut: $).
      hasProjectPackage
        ifTrue: [ aStream nextPut: $; ] ].
  hasProjectPackage
    ifTrue: [ 
      | hasName hasRepo |
      hasRepo := self hasRepository.
      hasName := self file ~= self className.
      hasName
        ifTrue: [ 
          hasClassName | hasVersionString | hasOperator | hasLoads | hasPreLoadDoIt
            | hasPostLoadDoIt
            ifTrue: [ 
              aStream
                cr;
                tab: indent + 1 ]
            ifFalse: [ aStream space ].
          aStream nextPutAll: 'file: ' , self file printString.
          hasRepo
            ifTrue: [ aStream nextPut: $; ] ].
      hasRepo
        ifTrue: [ 
          | repos |
          repos := self repositories map values.
          repos size = 1
            ifTrue: [ 
              fromShortCut
                ifTrue: [ 
                  hasClassName | hasVersionString | hasOperator | hasLoads | hasPreLoadDoIt
                    | hasPostLoadDoIt | hasName
                    ifTrue: [ 
                      aStream
                        cr;
                        tab: indent + 1 ]
                    ifFalse: [ aStream space ] ]
                ifFalse: [ 
                  aStream
                    cr;
                    tab: indent + 1 ].
              repos first configMethodCascadeOn: aStream lastCascade: true ]
            ifFalse: [ 
              aStream cr.
              self repositories configMethodCascadeOn: aStream indent: indent ] ] ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>configMethodOn: aStream indent: indent [

	aStream 
		tab: indent;
		nextPutAll: 'spec '; cr;
		tab: indent + 1;
		nextPutAll: 'name: ', self name printString, ';'.
	self configMethodBodyOn: aStream indent: indent.
	aStream nextPut: $.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>configShortCutMethodOn: aStream member: aMember indent: indent [
  | hasVersionString hasOperator hasProjectPackage hasLoads hasClassName hasPreLoadDoIt hasPostLoadDoIt |
  hasClassName := self hasClassName.
  hasVersionString := self configHasVersionString.
  hasOperator := operator ~~ nil.
  hasProjectPackage := self hasRepository
    or: [ hasClassName & (self getFile ~~ nil or: [ className ~= self name ]) ].
  hasLoads := self loads ~~ nil.
  hasPreLoadDoIt := self getPreLoadDoIt ~~ nil.
  hasPostLoadDoIt := self getPostLoadDoIt ~~ nil.
  hasClassName | hasOperator | hasProjectPackage | hasLoads | hasPreLoadDoIt
    | hasPostLoadDoIt
    ifTrue: [ 
      (aMember methodUpdateSelector == #'copy:'
        or: [ aMember methodUpdateSelector == #'with:' ])
        ifTrue: [ 
          aStream
            nextPutAll: 'with: [';
            cr ]
        ifFalse: [ 
          aStream
            nextPutAll: 'overrides: [';
            cr ].
      aStream
        tab: indent;
        nextPutAll: 'spec'.
      self configMethodBodyOn: aStream indent: indent fromShortCut: true.
      aStream nextPutAll: ' ]'.
      ^ self ].
  hasVersionString
    ifTrue: [ 
      | vs |
      vs := self versionString.
      aStream nextPutAll: 'with: '.
      vs isSymbol
        ifTrue: [ aStream nextPut: $# ].
      aStream nextPutAll: vs asString printString ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>constructClassName [
    ^ nil
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>currentlyLoadedClassesInVersion [
    self versionOrNil ifNotNil: [ :vrsn | ^ vrsn currentlyLoadedClassesInVersion ].
    ^ #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>file [
    ^ self className
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>getClassName [
    "raw access to iv"

    ^ className
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>getFile [
    "raw access to iv"

    ^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>getOperator [

	^operator
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>getPostLoadDoIt [

	^postLoadDoIt
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>getPreLoadDoIt [

	^preLoadDoIt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>getRepositories [
    "raw access to iv"

    ^ nil
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>hasClassName [
    ^ className ~~ nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>hasLoadConflicts: aMetacelloProjectSpec [
  ^ (self hasNoLoadConflicts: aMetacelloProjectSpec) not
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>hasNoLoadConflicts: aMetacelloProjectSpec [
  "same as compareEqual:, except if versionString and/or repositories are not 
	specified for either one, then there are not conflicts"

  ^ self className = aMetacelloProjectSpec className
    and: [ 
      (self compareVersionsEqual: aMetacelloProjectSpec)
        and: [ self operator == aMetacelloProjectSpec operator ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>hasNonVersionStringField [
    | hasVersionString hasOperator hasProjectPackage hasLoads hasClassName hasPreLoadDoIt hasPostLoadDoIt |
    hasClassName := self hasClassName.
    hasVersionString := self versionString ~~ nil.
    hasOperator := operator ~~ nil.
    hasProjectPackage := (self file ~~ nil and: [ hasClassName and: [ self className ~= self name ] ])
        or: [ self hasRepository ].
    hasLoads := self loads ~~ nil.
    hasPreLoadDoIt := self getPreLoadDoIt ~~ nil.
    hasPostLoadDoIt := self getPostLoadDoIt ~~ nil.
    ^ hasClassName | hasOperator | hasProjectPackage | hasLoads | hasPreLoadDoIt | hasPostLoadDoIt
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>hasRepository [
    ^ false
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>isLocked [
  ^ self registration locked
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>label [

	^self name
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>load [

	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>loadListForVersion: vrsn  [

	^ (self loads == nil
			or: [self loads isEmpty])
		ifTrue: [vrsn spec defaultPackageNames]
		ifFalse: [self loads]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>loads [
	^ loads
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>loads: aCollection [

	aCollection setLoadsInMetacelloProject: self
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>loads: anObject constructor: aVersionConstructor [
    aVersionConstructor loadsForProject: anObject
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>mergeMap [

	| map |
	map := super mergeMap.
	map at: #name put: name.
	map at: #className put: className.
	map at: #versionString put: versionString.
	map at: #operator put: operator.
	map at: #loads put: loads.
	map at: #preLoadDoIt put: preLoadDoIt.
	map at: #postLoadDoIt put: postLoadDoIt.
	^map
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>mergeScriptLoads: aSpec [
    self shouldBeMutable.
    aSpec loads
        ifNotNil: [ :otherLoads | self loads ifNil: [ loads := otherLoads ] ifNotNil: [ loads := (loads , otherLoads) asSet asArray ] ].
    self loader: aSpec loader
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>metacelloRegistrationHash [
    "name className versionString operator loads preLoadDoIt postLoadDoIt"

    | hash |
    hash := String stringHash: name initialHash: 0.
    hash := String stringHash: self className initialHash: hash.
    hash := String stringHash: self versionString initialHash: hash.
    hash := String stringHash: self operator asString initialHash: hash.
    hash := String stringHash: self preLoadDoIt asString initialHash: hash.
    hash := String stringHash: self postLoadDoIt asString initialHash: hash.
    ^ hash bitXor: loads hash
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>name [

	^name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>name: aString [
    ((aString at: 1) isSeparator or: [ (aString at: aString size) isSeparator ])
        ifTrue: [ self error: 'Names are not allowed to have leading or trailing blanks: ' , aString printString ].
    self shouldBeMutable.
    name := aString
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>name: aString constructor: aVersionConstructor [
    aVersionConstructor nameForProject: aString
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>operator [

	operator == nil ifTrue: [ ^#>= ].
	^ operator
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>operator: anObject [
    " #= #~= #> #< #>= #<= #~> "

    self shouldBeMutable.
    operator := anObject
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>operator: anObject constructor: aVersionConstructor [
    aVersionConstructor operatorForProject: anObject
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>postLoadDoIt [

	^postLoadDoIt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>postLoadDoIt: anObject [

	anObject setPostLoadDoItInMetacelloSpec: self
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>postLoadDoIt: aSymbol constructor: aVersionConstructor [
    aVersionConstructor postLoadDoItForProject: aSymbol
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>preLoadDoIt [

	^preLoadDoIt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>preLoadDoIt: anObject [

	anObject setPreLoadDoItInMetacelloSpec: self
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>preLoadDoIt: aSymbol constructor: aVersionConstructor [
    aVersionConstructor preLoadDoItForProject: aSymbol
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>projectDo: projectBlock packageDo: packageBlock groupDo: groupBlock [
    projectBlock value: self
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>projectLabel [
    ^ 'project'
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>projectPackage [

	^nil
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>registration [
    ^ MetacelloProjectRegistration
        registrationForProjectSpec: self
        ifAbsent: [ :ignored |  ]
        ifPresent: [ :existing :new | existing ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>registrationsCompareEqual: aMetacelloProjectSpec [
    "name className versionString operator loads preLoadDoIt postLoadDoIt"

    ^ self className = aMetacelloProjectSpec className
        and: [ self versionString = aMetacelloProjectSpec versionString and: [ self operator == aMetacelloProjectSpec operator ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>resolveToLoadableSpec [

	^self copy
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>setLoads: aCollection [
    self shouldBeMutable.
    loads := aCollection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>setName: aStringOrNil [
    self shouldBeMutable.
    name := aStringOrNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>setPostLoadDoIt: aSymbol [
    self shouldBeMutable.
    postLoadDoIt := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>setPreLoadDoIt: aSymbol [
    self shouldBeMutable.
    preLoadDoIt := aSymbol
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>unregisterProject [
    ^ MetacelloProjectRegistration
        registrationForProjectSpec: self
        ifAbsent: [  ]
        ifPresent: [ :existing :new | existing unregisterProject ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>version [
    self subclassResponsibility
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>version: anObject constructor: aVersionConstructor [
    aVersionConstructor versionForProject: anObject
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>versionKey [
	"suitable for using as a unique key for the receiver's version in a dictionary"

	^ self version versionKey
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>versionOrNil [

	^[ self version ] on: MetacelloVersionDoesNotExistError do: [:ex | ^nil ].
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>versionString [
	^ versionString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>versionString: anObject [
    self shouldBeMutable.
    versionString := anObject
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpec>>versionString: anObject constructor: aVersionConstructor [
    aVersionConstructor versionStringForProject: anObject
]
