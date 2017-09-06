Extension {
	#name : #CompiledMethod
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>assignmentNodes [
	^self ast assignmentNodes
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>blockNodes [
	^self ast blockNodes
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>compiledMethod [
	^self
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>createTwin [
	self reflectiveMethod: (ReflectiveMethod on: self)
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>destroyTwin [
	self reflectiveMethod: nil
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>hasLinks [
	self reflectiveMethod ifNil: [ ^false ].
	^self reflectiveMethod hasLinks. 
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>installLink: aMetaLink [
	self reflectiveMethod ifNil: [ self createTwin ].
	self reflectiveMethod increaseLinkCount.
	(aMetaLink optionCompileOnLinkInstallation or: [ self isRealPrimitive ])
		ifTrue: [ self reflectiveMethod compileAndInstallCompiledMethod ]
		ifFalse: [ self invalidate ].
	SystemAnnouncer uniqueInstance announce: (MetalinkChanged new link: aMetaLink)	
	
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>instanceVariableReadNodes [
	^self ast instanceVariableReadNodes
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>instanceVariableWriteNodes [
	^self ast instanceVariableWriteNodes
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>invalidate [
	| reflectiveMethod |
	self reflectivityDisabled ifTrue: [ ^self ].
	
	reflectiveMethod := self reflectiveMethod.
	reflectiveMethod ifNil: [^self "do nothing"].
	(self isRealPrimitive or: (reflectiveMethod ast metaLinkOptionsFromClassAndMethod includes: #optionCompileOnLinkInstallation))
					ifTrue: [reflectiveMethod compileAndInstallCompiledMethod ] 
					ifFalse: [reflectiveMethod installReflectiveMethod]
	
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>metaLinkOptions [
	^{
	#penultimateLiteral -> #( + optionCompileOnLinkInstallation).
	#selector -> #( + optionCompileOnLinkInstallation).
	#objectAt: -> #( + optionCompileOnLinkInstallation).
	#header -> #( + optionCompileOnLinkInstallation).
	#numLiterals -> #( + optionCompileOnLinkInstallation).
	#literalAt: -> #( + optionCompileOnLinkInstallation).
	#metaLinkOptions -> #( + optionCompileOnLinkInstallation)
	}
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>reflectiveMethod [
	^self propertyAt: #reflectiveMethod ifAbsent: nil
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>reflectiveMethod: aReflectiveMethod [
	self propertyAt: #reflectiveMethod put: aReflectiveMethod
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>reflectivityDisabled [
	^self hasPragmaNamed: #disableReflectivity
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>removeLink: aLink [

	self reflectiveMethod ifNotNil: [:rm | rm removeLink: aLink].
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>sendNodes [
	^self ast sendNodes
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>variableNodes [
	^self ast variableNodes
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>variableReadNodes [
	^self ast variableReadNodes
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
CompiledMethod>>variableWriteNodes [
	^self ast variableWriteNodes
]
