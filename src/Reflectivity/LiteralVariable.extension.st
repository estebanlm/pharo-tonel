Extension {
	#name : #LiteralVariable
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>afterHooks [
	^self propertyAt: #afterHooks ifAbsent: #()
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>afterLinks [
	^ self links select: [ :each | each control == #after ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>assignmentNodes [
	^self astNodes 
		select: [ :each | each isWrite ] 
		thenCollect: [ :each | each parent ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>astNodes [
	self subclassResponsibility
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>availableReifications [
	^RFReification subclasses 
		select: [ :e | e entities includesAny: self class withAllSuperclasses ]
		thenCollect: #key
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>beforeHooks [
	^self propertyAt: #beforeHooks ifAbsentPut: OrderedCollection new
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>beforeLinks [
	^ self links select: [ :each | each control == #before ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>clearReflectivityAnnotations [
	self removeProperty: #preambles ifAbsent: [ ].
	self removeProperty: #beforeHooks ifAbsent: [ ].
	self removeProperty: #afterHooks ifAbsent: [ ].
	self removeProperty: #insteadHooks ifAbsent: [ ].
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>hasMetalink [
	^ self hasProperty: #links
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>hasMetalinkAfter [
	self hasMetalink
		ifFalse: [ ^ false ].
	^ self afterLinks isNotEmpty
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>hasMetalinkBefore [
	self hasMetalink ifFalse: [ ^ false ].
	^ self beforeLinks isNotEmpty
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>hasMetalinkInstead [
	self hasMetalink
		ifFalse: [ ^ false ].
	^ self insteadLinks isNotEmpty
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>insteadHooks [
	^self propertyAt: #insteadHooks ifAbsent: #()
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>insteadLinks [
	^ self links select: [ :each | each control == #instead ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>isCascade [
	self flag: #hack.
	^false
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>link: aMetaLink [
	| methods |
	(aMetaLink checkForCompatibilityWith: self) ifFalse: [ self error: 'link requests reification that can not be provided by this node' ].
	
	methods := self usingMethods.
	(self propertyAt: #links ifAbsentPut: [ IdentitySet new ]) add: aMetaLink.
	aMetaLink installOnVariable: self.
	methods
		do: [ :method |  
			method
				createTwin;
				invalidate.
			method installLink: aMetaLink ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>links [
	^self propertyAt: #links ifAbsent: nil
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>methodNode [
	self flag: #hack.
	^nil
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>preambles [
	^ self propertyAt: #preambles ifAbsent: #()
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
LiteralVariable>>removeLink: aMetaLink [
	self usingMethods do: [:method | method removeLink: aMetaLink].
	self links remove: aMetaLink.
	self links ifEmpty: [ self removeProperty: #links ].
	self clearReflectivityAnnotations.
]
