"

"
Class {
	#name : #MetacelloSpec,
	#superclass : #Object,
	#instVars : [
		'project',
		'loader',
		'mutable'
	],
	#category : #Metacello-Core-Specs,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec class>>for: aVersionMap [

	^(self platformClass new)
		for: aVersionMap;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec class>>platformClass [

	^self
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>aboutToCopy [

]

{
	#category : #'spec creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>addMember [

	^MetacelloAddMemberSpec for: self project
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>answers [

	^#()
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>configMethodOn: aStream [

	self configMethodOn: aStream indent: 0
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>configMethodOn: aStream indent: indent [

	self subclassResponsibility
]

{
	#category : #'spec creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>copyMember [

	^MetacelloCopyMemberSpec for: self project
]

{
	#category : #mutability,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>copyOnWrite: aBlock [
    "assume that only registered projects are immutable ... otherwise you'll get an error"

    | copy |
    copy := self copy.
    aBlock value: copy.
    ^ copy
]

{
	#category : #doits,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>doItBlock: selector [

	selector == nil ifTrue: [ ^nil ].
	selector numArgs = 0
		ifTrue: [ ^[ self project configuration perform: selector ] ].
	selector numArgs = 1
		ifTrue: [ ^[:aLoader | self project configuration perform: selector with: aLoader ] ].
	selector numArgs = 2
		ifTrue: [ ^[:aLoader :pkgSpec | self project configuration perform: selector with: aLoader with: pkgSpec ] ].
	^nil
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>for: aProject [
    self shouldBeMutable.
    project := aProject
]

{
	#category : #mutability,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>immutable [
    mutable := false
]

{
	#category : #mutability,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>isMutable [
    mutable ifNil: [ ^ true ].
    ^ mutable
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>label [

	^self printString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>loader [

	loader == nil 
		ifTrue: [ | prjctLoader |
			(prjctLoader := self project loader) == nil
				ifTrue: [ self loader: (self project loaderClass on: self) ]
				ifFalse: [ self loader: prjctLoader ]].
	^loader
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>loader: aLoader [
    "We're interested in propogating the loader state, _except_ for the spec"

    self shouldBeMutable.
    loader := aLoader copy.
    loader spec: self
]

{
	#category : #importing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>mergeImportLoads: aLoadList [
    self error: 'import: can only be used with baseline project specs'
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>mergeMap [

	^Dictionary new.
]

{
	#category : #'spec creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>mergeMember [

	^MetacelloMergeMemberSpec for: self project
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>mergeSpec: aSpec [
    | newSpec nonOverridable |
    self validateMergeForSpec: aSpec.
    newSpec := self copy.
    nonOverridable := self nonOverridable.
    aSpec mergeMap
        keysAndValuesDo: [ :key :value | 
            (nonOverridable includes: key)
                ifFalse: [ 
                    value ~~ nil
                        ifTrue: [ newSpec instVarNamed: key asString put: value ] ] ].
    ^ newSpec
]

{
	#category : #mutability,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>mutable [
    mutable := true
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>nonOverridable [

	^#()
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>postCopy [
    super postCopy.
    mutable := nil.
    loader ~~ nil
        ifTrue: [ self loader: loader ].
]

{
	#category : #doits,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>postLoadDoIt [
	"noop unless non-nil value returned"

	^nil
]

{
	#category : #doits,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>postLoadDoItBlock [

	^self doItBlock: self postLoadDoIt value
]

{
	#category : #doits,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>preLoadDoIt [
	"noop unless non-nil value returned"
	
	^nil
]

{
	#category : #doits,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>preLoadDoItBlock [

	^self doItBlock: self preLoadDoIt value
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>printOn: aStream [

	self configMethodOn: aStream indent: 0
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>project [

	^project
]

{
	#category : #'spec creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>removeMember [

	^MetacelloRemoveMemberSpec for: self project
]

{
	#category : #mutability,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>shouldBeMutable [
    self isMutable
        ifTrue: [ ^ self ].
    self error: 'Not allowed to modify an immutable object'
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpec>>validateMergeForSpec: aSpec [
    aSpec class = self class
        ifFalse: [ 
            self
                error:
                    'The project spec ' , self name printString , ' in project ' , self project label , ' has incompatible specs. '
                        , aSpec class name asString , ' and ' , self class name asString , ' are not compatible.' ]
]
