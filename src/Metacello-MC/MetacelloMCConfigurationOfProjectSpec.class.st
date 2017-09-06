"

"
Class {
	#name : #MetacelloMCConfigurationOfProjectSpec,
	#superclass : #MetacelloMCProjectSpec,
	#category : #Metacello-MC-Specs,
	#timestamp : ''
}

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCConfigurationOfProjectSpec>>asConfigurationProjectSpec [
    ^ self
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCConfigurationOfProjectSpec>>asProjectRegistration [
    ^ MetacelloProjectRegistration fromMCConfigurationProjectSpec: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCConfigurationOfProjectSpec>>constructClassName [
    ^ 'ConfigurationOf' , self name
]

{
	#category : #mutability,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCConfigurationOfProjectSpec>>copyForRegistration: aMetacelloProjectRegistration onWrite: aBlock [
  | copy |
  aMetacelloProjectRegistration
    configurationProjectSpecIfPresent: [ :spec | 
      copy := spec copy.
      aBlock value: copy.
      aMetacelloProjectRegistration configurationProjectSpec: copy ]
    ifAbsent: [ 
      aMetacelloProjectRegistration
        baselineProjectSpecIfPresent: [ :spec | 
          copy := spec copy.
          aBlock value: copy.
          aMetacelloProjectRegistration baselineProjectSpec: copy ]
        ifAbsent: [ aBlock value: nil ] ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCConfigurationOfProjectSpec>>hasClassName [
    ^ className ~~ nil and: [ className ~= self constructClassName ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCConfigurationOfProjectSpec>>hasConflictWithBaselineSpec: projectSpec [
	projectSpec name = self name
		ifFalse: [ ^ true ].
	projectSpec project configuration className = self project configuration className
		ifFalse: [ ^ true ].
	^ ((projectSpec repositories isEmpty or: [ self repositories isEmpty ])
		or: [ projectSpec repositories hasNoLoadConflicts: self repositories ]) not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCConfigurationOfProjectSpec>>hasConflictWithProjectSpec: projectSpec [
	^ projectSpec hasConflictWithConfigurationSpec: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCConfigurationOfProjectSpec>>isConfigurationOfProjectSpec [
	^ true
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCConfigurationOfProjectSpec>>mergeSpec: anotherSpec [
    ^ super mergeSpec: anotherSpec asConfigurationProjectSpec
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCConfigurationOfProjectSpec>>projectLabel [
    ^ 'configuration'
]
