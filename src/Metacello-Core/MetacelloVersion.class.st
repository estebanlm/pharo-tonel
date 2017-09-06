"

"
Class {
	#name : #MetacelloVersion,
	#superclass : #Magnitude,
	#instVars : [
		'spec',
		'versionNumber',
		'importedVersions',
		'versionStatus'
	],
	#category : #Metacello-Core-Model,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion class>>fromSpec: aMetacelloVersionSpec [
    ^ (self new versionNumber: aMetacelloVersionSpec versionNumber)
        spec: aMetacelloVersionSpec;
        yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion class>>fromString: aString [

	^self new versionNumber: aString asMetacelloVersionNumber
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>< aMetacelloVersion [

	aMetacelloVersion species = self species ifFalse: [ ^false ].
	^self versionNumber < aMetacelloVersion versionNumber
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>= aMetacelloVersion [

	aMetacelloVersion species = self species ifFalse: [ ^false ].
	^self versionNumber = aMetacelloVersion versionNumber
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>author [

	^self spec author value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>basicSpec [
    ^ self spec
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>blessing [
    ^ self basicSpec blessing value
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>computeVersionStatus [
    ^ #'noStatus'
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>description [
    ^ self basicSpec description value
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>difference: aMetacelloVersion [
	"Return a a dictionary of additions, removals and modifications"
	
	^self spec difference: aMetacelloVersion spec
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>expandToLoadableSpecNames: nameList [
	"Just like #resolveToLoadableSpecs:, but returns list of spec names instead of specs"
	
	^self spec expandToLoadableSpecNames: nameList
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>groups [
	"Answers the list of groups associated with this version"
	
	| groups |
	groups := OrderedCollection new.
	self spec projectDo: [:ignored | ] packageDo: [:ignored | ] groupDo: [:grp | groups add: grp ].
	^groups
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>hash [

	^self versionNumber hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>importedVersions [

	importedVersions == nil ifTrue: [ importedVersions := #() ].
	^importedVersions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>importedVersions: aCollection [

	importedVersions := aCollection
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>isAllLoadedToSpec [
	"all projects and packages are loaded and match specification"
	
	^self spec isAllLoadedToSpec
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>isLoadedMatchConstraints [
	"all loaded projects and packages match constraints"
	
	^self spec isLoadedMatchConstraints
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>isLoadedToSpec [
	"all loaded projects and packages match specifications"
	
	^self spec isLoadedToSpec
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>isPossibleBaseline [

	^self spec isPossibleBaseline
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>isSomethingLoaded [
	"at least one project or package has been loaded"
	
	^self spec isSomethingLoaded
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>load [

	^self subclassResponsibility
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>load: required [

	^self subclassResponsibility
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>loader [

	^self spec loader
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>name [

	^self versionString
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>packageNamed: aString [

	^self packageNamed: aString ifAbsent: [ ^nil ].
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>packageNamed: aString ifAbsent: aBlock [

	| pkg |
	(pkg := self spec packageNamed: aString ifAbsent: []) == nil
		ifTrue: [ ^aBlock value ].
	^pkg referencedSpec
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>printOn: aStream [
    | label vs |
    (#(structural broken) includes: self blessing) not
        ifTrue: [ 
            (vs := self versionStatus) == #'somethingLoaded'
                ifTrue: [ aStream nextPutAll: '<>' ].
            vs == #'loadedMatchConstraints'
                ifTrue: [ aStream nextPutAll: '>=' ].
            vs == #'loadedToSpec'
                ifTrue: [ aStream nextPut: $~ ] ].
    self versionNumber printOn: aStream.
    self basicSpec ~~ nil
        ifTrue: [ 
            (label := self projectLabel) isEmpty
                ifFalse: [ aStream nextPutAll: ' [' , label , ']' ] ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>project [
    ^ self basicSpec project
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>projectLabel [
    ^ self basicSpec projectLabel
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>projects [
	"Answers the list of projects associated with this version"

	| projects |
	projects := OrderedCollection new.
	self spec projectDo: [:prj | projects add: prj projectReference ] packageDo: [:ignored | ] groupDo: [:ignored | ].
	^projects
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>resolveToLoadableSpecs: nameList [
	"Resolves names in namelist to the  list of packages and projects in the version that would be loaded. Projects are 
	not traversed during the transitive closure. The scope is that of the version itself.
	   If the spec is a package, answer a list including the package and the transitive closure on 
			its #requires: and #includes: fields.
	   If the spec is a project, answer the project.
	   If the spec is a group, answers the list of packages in the #includes: field of the group. 
			Groups in the #includes: field are expanded following the transitive closure on groups"

	^self spec resolveToLoadableSpecs: nameList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>spec [

	^spec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>spec: aMetacellVersionSpec [

	spec := aMetacellVersionSpec
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>timestamp [
    ^ self basicSpec timestamp value
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>unload [

	^self spec unload
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>versionKey [
    "version printString, without the versionStatus decorations, suitable for using as a unique key for the 
	 receiver in a dictionary"

    ^ String
        streamContents: [ :aStream | 
            | label |
            self versionNumber printOn: aStream.
            self basicSpec ~~ nil
                ifTrue: [ 
                    (label := self projectLabel) isEmpty
                        ifFalse: [ aStream nextPutAll: ' [' , label , ']' ] ] ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>versionNumber [

	^versionNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>versionNumber: aVersionNumber [

	versionNumber := aVersionNumber
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>versionNumberFrom: aString [
    ^ self versionNumber class fromString: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>versionSpec [

	^self spec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>versionStatus [

	versionStatus == nil ifTrue: [ versionStatus := self computeVersionStatus].
	^versionStatus
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>versionStatus: aSymbol [

	versionStatus := aSymbol
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>versionString [

	^self versionNumber versionString
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersion>>~> aMetacelloVersion [

	aMetacelloVersion species = self species ifFalse: [ ^false ].
	^self versionNumber ~> aMetacelloVersion versionNumber
]
