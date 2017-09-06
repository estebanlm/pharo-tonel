"

"
Class {
	#name : #MetacelloProjectSpecForLoad,
	#superclass : #Object,
	#instVars : [
		'projectSpec',
		'useDetermineVersionForLoad',
		'overrideProjectSpec'
	],
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecForLoad>>hasOverride [
    ^ self overrideProjectSpec ~~ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecForLoad>>overrideProjectSpec [
	^ overrideProjectSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecForLoad>>overrideProjectSpec: anObject [
	overrideProjectSpec := anObject
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecForLoad>>performCurrentVersionTestAgainst: vrsn operator: anOperator targetVersionStatus: targetVersionStatus using: anMCLoader [
  "answer true if the current state of image is to be left as is"

  | currentVersion existing new |
  vrsn ifNil: [ ^ false ].
  self useDetermineVersionForLoad
    ifTrue: [ 
      | prjct cv |
      self hasOverride
        ifTrue: [ 
          self
            error:
              'unexpected logic combination: useDeterminVersionForLoad & hasOverride' ].
      prjct := self projectSpec projectClassProject.
      prjct loader: anMCLoader.
      (cv := prjct currentVersion) == nil
        ifTrue: [ ^ false ].
      (targetVersionStatus includes: cv versionStatus)
        ifTrue: [ ^ cv perform: anOperator with: vrsn ].
      ^ false ].
  (self hasOverride not or: [ targetVersionStatus ~= #(#'allLoadedToSpec') ])
    ifTrue: [ ^ false ].
  (self overrideProjectSpec allPackagesLoaded: anMCLoader)
    ifFalse: [ 
      "roughly equivalent to versionStatus test above (#'allLoadedToSpec')"
      ^ false ].
  (self overrideProjectSpec
    isPartiallyLoaded: self overrideProjectSpec copy loader)
    ifFalse: [ 
      "if the project is not loaded at all"
      ^ false ].
  (currentVersion := self overrideProjectSpec versionOrNil) ifNil: [ ^ false ].
  currentVersion = vrsn
    ifTrue: [ ^ true ].
  existing := self overrideProjectSpec asProjectRegistration.
  new := self projectSpec asProjectRegistration.
  ^ currentVersion > vrsn
    ifTrue: [ 
      "answer false if downgrade allowed"
      (MetacelloAllowProjectDowngrade new
        existingProjectRegistration: existing;
        newProjectRegistration: new;
        signal) == existing ]
    ifFalse: [ 
      "answer false if upgrade allowed"
      (MetacelloAllowProjectUpgrade new
        existingProjectRegistration: existing;
        newProjectRegistration: new;
        signal) == existing ]
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecForLoad>>performLoad [
  | displayString spec |
  spec := self projectSpec.
  displayString := 'Project: ' , spec name.
  spec versionString ~~ nil
    ifTrue: [ displayString := displayString , ' ' , spec versionString ].
  Transcript
    cr;
    show: displayString.
  self hasOverride
    ifTrue: [ 
      | override |
      override := self overrideProjectSpec copy.
      override mergeScriptLoads: spec.
      override loadVersion: nil ]
    ifFalse: [ 
      | vrsn |
      vrsn := self useDetermineVersionForLoad
        ifTrue: [ spec determineCurrentVersionForLoad ]
        ifFalse: [ spec versionOrNil ].
      (spec asProjectSpecForVersion: vrsn) loadVersion: vrsn ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecForLoad>>projectSpec [
	^ projectSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecForLoad>>projectSpec: anObject [
	projectSpec := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecForLoad>>useDetermineVersionForLoad [
    useDetermineVersionForLoad ifNil: [ useDetermineVersionForLoad := true ].
    ^ useDetermineVersionForLoad
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecForLoad>>useDetermineVersionForLoad: anObject [
	useDetermineVersionForLoad := anObject
]
