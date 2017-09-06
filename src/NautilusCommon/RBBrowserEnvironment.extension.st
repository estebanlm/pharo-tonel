Extension {
	#name : #RBBrowserEnvironment
}

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
RBBrowserEnvironment>>asSystemNavigationEnvironment [

	| env globalsNames |
	"Optimization for the default environment AKA Smalltalk"
	self class == RBBrowserEnvironment 
		ifTrue: [ ^ Smalltalk globals ].
	
	env := SystemDictionary new.
	
	self classesDo: [:each | 
		env add: ( Smalltalk globals associationAt: each theNonMetaClass name )].
	self traitsDo:  [:each | 
		env add: ( Smalltalk globals associationAt: each name )].
	globalsNames := Smalltalk globals keys asOrderedCollection.
	globalsNames removeAll: ( Smalltalk globals classNames ).
	 globalsNames removeAll: ( Smalltalk globals traitNames ).
	globalsNames do: [:each | 
		env add: ( Smalltalk globals associationAt: each )].

	^ env
]

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
RBBrowserEnvironment>>traits [
	| traits |
	traits := IdentitySet new: 4096.
	self traitsDo: [ :each | traits add: each ].
	^ traits
]

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
RBBrowserEnvironment>>traitsDo: aBlock [

	self systemDictionary allTraitsDo: [ :each | 
		(self includesClass: each)
			ifTrue: [ aBlock value: each ]  ]
]
