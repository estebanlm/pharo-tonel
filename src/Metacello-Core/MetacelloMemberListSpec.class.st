"

"
Class {
	#name : #MetacelloMemberListSpec,
	#superclass : #MetacelloSpec,
	#instVars : [
		'list',
		'memberMap'
	],
	#category : #Metacello-Core-Members,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>add: aSpec [

	self subclassResponsibility
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>addMember: aMember [

	self list add: aMember.
	self clearMemberMap
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>clearMemberMap [

	memberMap := nil.
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>collect: aBlock  [
	| newCollection |
	newCollection :=OrderedCollection new.
	self do: [:each | newCollection add: (aBlock value: each)].
	^ newCollection
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>copy: aMemberSpec [

	self addMember: aMemberSpec
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>copy: specNamed to: aSpec [

	self subclassResponsibility
]

{
	#category : #'toolbox support',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>deleteSpec: aSpec [
    "remove the spec from list"

    | member |
    member := self list detect: [ :aMember | aMember spec = aSpec ] ifNone: [ ^ self ].
    self list remove: member
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>detect: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Answer the first element for which aBlock evaluates to true."

	^ self detect: aBlock ifNone: [ self error: 'Object is not in the collection.' ]
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>detect: aBlock ifNone: exceptionBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Answer the first element for which aBlock evaluates to true. If none  
	evaluate to true, then evaluate the argument, exceptionBlock."

	self
		do: [ :each | 
			(aBlock value: each)
				ifTrue: [ ^ each ] ].
	^ exceptionBlock value
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>do: aBlock [

	self map values do: aBlock
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>isEmpty [

	^self list isEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>list [

	list == nil ifTrue: [ list := OrderedCollection new ].
	^list
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>list: aCollection [

	list := aCollection.
	self clearMemberMap
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>map [
	
	| map |
	memberMap ~~ nil ifTrue: [ ^memberMap ].
	map := Dictionary new.
	self list do: [:member | 
		member
			applyAdd: [:memberSpec | self mapAdd: memberSpec into: map ] 
			copy: [:memberSpec | self mapCopy: memberSpec into: map ]
			merge: [:memberSpec | self mapMerge: memberSpec into: map ] 
			remove: [:memberSpec | self mapRemove: memberSpec into: map ]].
	memberMap := map.
	^memberMap
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>mapAdd: aMemberSpec into: map [
	
	map at: aMemberSpec name put: aMemberSpec spec
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>mapCopy: aMemberSpec into: map [
    | spec |
    spec := map at: aMemberSpec sourceName ifAbsent: [  ].
    spec == nil
        ifTrue: [ ^ self error: 'Source spec named ' , aMemberSpec sourceName printString , ' not found' ]
        ifFalse: [ 
            spec aboutToCopy.
            map at: aMemberSpec name put: (spec copy mergeSpec: aMemberSpec spec copy) ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>mapMerge: aMemberSpec into: map [
	| spec |
	spec :=  map at: aMemberSpec name ifAbsent: [].
	spec == nil
		ifTrue: [ map at: aMemberSpec name put: aMemberSpec spec copy ]
		ifFalse: [ map at: aMemberSpec name put: (spec mergeSpec: aMemberSpec spec)]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>mapRemove: aMemberSpec into: map [
	
	map removeKey: aMemberSpec name ifAbsent: []
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>merge: aSpec [

	self subclassResponsibility
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>mergeSpec: anotherSpec [

	| newSpec val |
	newSpec := super mergeSpec: anotherSpec.
	newSpec list: self list copy.
	anotherSpec list do: [:groupMember | groupMember applyToList: newSpec ].
	^newSpec
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>notEmpty [

	^self list notEmpty
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>postCopy [

	super postCopy.
	list := list copy.
	self clearMemberMap
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>remove: aSpec [

	self subclassResponsibility
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>select: aBlock  [
	| newCollection |
	newCollection := OrderedCollection new.
	self do: [:each | (aBlock value: each) ifTrue: [newCollection add: each]].
	^newCollection
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>specListDetect: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Answer the first element for which aBlock evaluates to true."

	^ self specListDetect: aBlock ifNone: [ self error: 'Object is not in the collection.' ]
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>specListDetect: aBlock ifNone: exceptionBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Answer the first element for which aBlock evaluates to true. If none  
	evaluate to true, then evaluate the argument, exceptionBlock."

	self
		specListDo: [ :each | 
			(aBlock value: each)
				ifTrue: [ ^ each ] ].
	^ exceptionBlock value
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>specListDo: aBlock [

	self list do: [:member |  aBlock value: member spec ]
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberListSpec>>specListSelect: aBlock  [
	| newCollection |
	newCollection := OrderedCollection new.
	self specListDo: [:each | (aBlock value: each) ifTrue: [newCollection add: each]].
	^newCollection
]
