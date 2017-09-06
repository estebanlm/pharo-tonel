"

"
Class {
	#name : #MetacelloProjectReferenceSpec,
	#superclass : #MetacelloAbstractPackageSpec,
	#instVars : [
		'projectReference'
	],
	#category : #Metacello-Core-Specs,
	#timestamp : ''
}

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>aboutToCopy [
    self projectReference className
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>answers: aListOfPairs [

	self shouldNotImplement
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>configMethodCascadeOn: aStream member: aMember last: lastCascade indent: indent [
    aMember methodUpdateSelector == #'remove:'
        ifTrue: [ aStream nextPutAll: 'removeProject: ' , self name printString ]
        ifFalse: [ 
            self projectReference == nil
                ifTrue: [ ^ self ].
            aStream nextPutAll: self projectLabel , ': ' , self projectName printString , ' '.
            (aMember methodUpdateSelector == #'copy:' and: [ self projectReference hasNonVersionStringField ])
                ifTrue: [ aStream nextPutAll: 'copyFrom: ' , aMember sourceName printString , ' ' ].
            self projectReference configShortCutMethodOn: aStream member: aMember indent: indent + 1 ].
    lastCascade
        ifTrue: [ aStream nextPut: $. ]
        ifFalse: [ 
            aStream
                nextPut: $;;
                cr ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>configMethodOn: aStream indent: indent [

	aStream 
		tab: indent; nextPutAll: 'spec '; cr;
		tab: indent + 1; nextPutAll: 'name: ', self name printString; nextPut: $;; cr;
		tab: indent + 1; nextPutAll: 'projectReference: '; nextPut: $[; cr.
	aStream 
		tab: indent + 2; nextPutAll: 'spec'.
	self projectReference ifNotNil: [ self projectReference configMethodBodyOn: aStream indent: indent + 2].
	aStream nextPutAll: ' ].'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>hasRepository [
    ^ self projectReference hasRepository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>includes: aCollection [

	self shouldNotImplement
]

{
	#category : #importing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>mergeImportLoads: aLoadList [
    self projectReference mergeImportLoads: aLoadList
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>mergeMap [

	| map |
	map := super mergeMap.
	map at: #projectReference put: projectReference.
	^map
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>mergeSpec: anotherSpec [

	| newSpec map anotherProjectReference |
	newSpec := super mergeSpec: anotherSpec.
	map := anotherSpec mergeMap.
	(anotherProjectReference := map at: #projectReference) ~~ nil
		ifTrue: [ 
			newSpec projectReference: 
				(newSpec projectReference == nil
					ifTrue: [ anotherProjectReference ]
					ifFalse: [ newSpec projectReference mergeSpec: anotherProjectReference ])].
	^newSpec
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>nonOverridable [

	^super nonOverridable, #( projectReference )
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>postCopy [

	super postCopy.
	projectReference := projectReference copy.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>projectDo: projectBlock packageDo: packageBlock groupDo: groupBlock [

	projectBlock value: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>projectLabel [
    ^ self projectReference projectLabel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>projectName [
	^self projectReference name
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>projectReference [
	^ projectReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>projectReference: anObject [
	projectReference := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>referencedSpec [

	^self projectReference
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>relativeCurrentVersion [

	^self projectReference relativeCurrentVersion
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>repositories [
    ^ self referencedSpec repositories
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>repositorySpecs [

	^self repositories map values
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>requires: aCollection [

	self shouldNotImplement
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>version [

	^self projectReference version
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>versionOrNil [

	^self projectReference versionOrNil
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectReferenceSpec>>versionString: aString [

	^self projectReference versionString: aString
]
