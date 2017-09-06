Extension {
	#name : #TemporaryVariable
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TemporaryVariable>>afterLinks [
	^ self links select: [ :each | each control == #after ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TemporaryVariable>>astNodes [
	self flag: #FIXME. "will return all temps with the same name... as we do not allow shadowing this is ok but shoudl be fixed later"
	^self method variableNodes select: [ :each | (each name = self name)]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TemporaryVariable>>beforeHooks [
	^self propertyAt: #beforeHooks ifAbsentPut: OrderedCollection new
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TemporaryVariable>>beforeLinks [
	^ self links select: [ :each | each control == #before ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TemporaryVariable>>clearReflectivityAnnotations [
	self removeProperty: #preambles ifAbsent: [ ].
	self removeProperty: #beforeHooks ifAbsent: [ ].
	self removeProperty: #afterHooks ifAbsent: [ ].
	self removeProperty: #insteadHooks ifAbsent: [ ].
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TemporaryVariable>>hasMetalink [
	^ self hasProperty: #links
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TemporaryVariable>>hasMetalinkAfter [
	self hasMetalink
		ifFalse: [ ^ false ].
	^ self afterLinks isNotEmpty
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TemporaryVariable>>hasMetalinkBefore [
	self hasMetalink ifFalse: [ ^ false ].
	^ self beforeLinks isNotEmpty
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TemporaryVariable>>hasMetalinkInstead [
	self hasMetalink
		ifFalse: [ ^ false ].
	^ self insteadLinks isNotEmpty
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TemporaryVariable>>insteadLinks [
	^ self links select: [ :each | each control == #instead ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TemporaryVariable>>link: aMetaLink [
	(aMetaLink checkForCompatibilityWith: self) ifFalse: [ self error: 'link requests reification that can not be provided by this node' ].
	
	(self propertyAt: #links ifAbsentPut: [ IdentitySet new ]) add: aMetaLink.
	aMetaLink installOnVariable: self.
	method 
		createTwin;
		invalidate.
	method installLink: aMetaLink
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TemporaryVariable>>links [
	^self propertyAt: #links ifAbsent: nil
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TemporaryVariable>>preambles [
	^ self propertyAt: #preambles ifAbsent: #()
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TemporaryVariable>>removeLink: aMetaLink [
	self usingMethods do: [:mth | mth removeLink: aMetaLink].
	self links remove: aMetaLink.
	self links ifEmpty: [ self removeProperty: #links ].
	self clearReflectivityAnnotations.
]
