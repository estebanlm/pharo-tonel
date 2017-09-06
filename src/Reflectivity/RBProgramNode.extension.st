Extension {
	#name : #RBProgramNode
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>afterHooks [
	^self propertyAt: #afterHooks ifAbsent: #()
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>afterLinks [
	^ self links select: [ :each | each control == #after ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>allAfterAreWeak [
	self hasMetalink ifFalse: [^false].
	^self afterLinks allSatisfy: [ :link | link hasOption: #optionWeakAfter ].
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>availableReifications [
	^RFReification subclasses 
		select: [ :e | e entities includesAny: self class withAllSuperclasses ]
		thenCollect: #key

]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>beforeHooks [
	^self propertyAt: #beforeHooks ifAbsentPut: OrderedCollection new
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>beforeLinks [
	^ self links select: [ :each | each control == #before ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>clearReflectivityAnnotations [
	self removeProperty: #preambles ifAbsent: [ ].
	self removeProperty: #beforeHooks ifAbsent: [ ].
	self removeProperty: #afterHooks ifAbsent: [ ].
	self removeProperty: #insteadHooks ifAbsent: [ ].
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>hasBeenExecuted [
	^self propertyAt: #tagExecuted ifAbsent: false
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>hasMetalink [
	^self hasProperty: #links
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>hasMetalink: aMetaLink [
	^self links isNotNil and: [(self links includes: aMetaLink)]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>hasMetalinkAfter [
	self hasMetalink ifFalse: [^false].
	^self afterLinks isNotEmpty
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>hasMetalinkBefore [
	self hasMetalink ifFalse: [^false].
	^self beforeLinks isNotEmpty
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>hasMetalinkInstead [
		self hasMetalink ifFalse: [^false].
		^self insteadLinks isNotEmpty
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>insteadHooks [
	^self propertyAt: #insteadHooks ifAbsent: #()
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>insteadLinks [
	^ self links select: [ :each | each control == #instead ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>invalidate [
	self methodNode method invalidate. 
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>link: aMetaLink [
	(aMetaLink checkForCompatibilityWith: self) ifFalse: [ self error: 'link requests reification that can not be provided by this node' ].
	(self propertyAt: #links ifAbsentPut: [ IdentitySet new ]) add: aMetaLink.
	aMetaLink installOn: self.
	self clearReflectivityAnnotations.
	self methodNode method installLink: aMetaLink. 
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>links [
	^self propertyAt: #links ifAbsent: nil
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>nodesWithLinks [
	^ self allChildren select: [ :e | e links isNotNil ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>preambles [
	^self propertyAt: #preambles ifAbsent: #()
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>removeLink: aMetaLink [

	self hasMetalink ifFalse: [ ^ self ].
	
	self links remove: aMetaLink ifAbsent: [].
	self links ifEmpty: [ self removeProperty: #links ].
	self clearReflectivityAnnotations.
	self methodNode method removeLink: aMetaLink. 
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBProgramNode>>tagExecuted [
	^self propertyAt: #tagExecuted put: true 
]
