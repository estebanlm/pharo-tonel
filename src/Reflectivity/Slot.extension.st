Extension {
	#name : #Slot
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>afterHooks [
	^self propertyAt: #afterHooks ifAbsent: #()
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>afterLinks [
	^ self links select: [ :each | each control == #after ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>assignmentNodes [
	^self astNodes 
		select: [ :each | each isWrite ] 
		thenCollect: [ :each | each parent ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>astNodes [
	^self definingClass variableNodes select: [ :each | each binding variable == self ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>availableReifications [
	^RFReification subclasses 
		select: [ :e | e entities includesAny: self class withAllSuperclasses ]
		thenCollect: #key
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>beforeHooks [
	^self propertyAt: #beforeHooks ifAbsentPut: OrderedCollection new
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>beforeLinks [
	^ self links select: [ :each | each control == #before ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>clearReflectivityAnnotations [
	self removeProperty: #preambles ifAbsent: [ ].
	self removeProperty: #beforeHooks ifAbsent: [ ].
	self removeProperty: #afterHooks ifAbsent: [ ].
	self removeProperty: #insteadHooks ifAbsent: [ ].
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>hasMetalink [
	^ self hasProperty: #links
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>hasMetalinkAfter [
	self hasMetalink
		ifFalse: [ ^ false ].
	^ self afterLinks isNotEmpty
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>hasMetalinkBefore [
	self hasMetalink ifFalse: [ ^ false ].
	^ self beforeLinks isNotEmpty
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>hasMetalinkInstead [
	self hasMetalink
		ifFalse: [ ^ false ].
	^ self insteadLinks isNotEmpty
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>insteadLinks [
	^ self links select: [ :each | each control == #instead ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>link: aMetaLink [
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
Slot>>links [
	^self propertyAt: #links ifAbsent: nil
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>preambles [
	^ self propertyAt: #preambles ifAbsent: #()
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Slot>>removeLink: aMetaLink [
	self links remove: aMetaLink.
	self usingMethods do: [:method | method removeLink: aMetaLink].
	self links ifEmpty: [ self removeProperty: #links ].
	self clearReflectivityAnnotations.
]
