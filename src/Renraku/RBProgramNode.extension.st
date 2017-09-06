Extension {
	#name : #RBProgramNode
}

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBProgramNode>>banChecksForValidation [
"returns ban levels that have to be chacked before validation"

	self methodNode ifNotNil: [ :mNode |
		mNode compiledMethod ifNotNil: [ :method |
			^ method banChecksForValidation ] ].
	
	^ #()
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBProgramNode>>banLevelCandidates [
"returns code entities which can ban a rule for this entity"

	self methodNode ifNotNil: [ :mNode |
		mNode compiledMethod ifNotNil: [ :method |
			^ method banLevelCandidates ] ].
	
	^ #()
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBProgramNode>>critiques [
	<eProperty>

	^ ReCriticEngine critiquesOf: self
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBProgramNode>>glmCritiqueSourceIn: aGLMCompositePresentation  [
	
	^ self gtInspectorSourceCodeIn: aGLMCompositePresentation
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBProgramNode>>match: aNode onSuccess: aBlock onFailure: anAlternativeBlock  [
	| context |
	
	context := SmallDictionary new.
	
	(self match: aNode inContext: context)
		ifTrue: [ aBlock cull: context ]
		ifFalse: anAlternativeBlock
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBProgramNode>>nodeAtTraversalIndex: anIndex [
	| index |
	index := 0.

	self nodesDo: [ :n |
		index := index + 1.
		index = anIndex ifTrue: [ ^ n ] ].
	
	NotFound signal.
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBProgramNode>>package [
	"a hack to make the critique check working"
	"the package information is used to determin bans"

	^ nil
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBProgramNode>>reverseNodesDo: aBlock  [
	self children reverseDo: [ :each | each reverseNodesDo: aBlock ].
	aBlock value: self
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBProgramNode>>suitableRulesFrom: aReRuleManager  [
	^ aReRuleManager nodeRules
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBProgramNode>>traversalIndexOf: aNode [
	| index |
	index := 0.

	self nodesDo: [ :n |
		index := index + 1.
		n == aNode ifTrue: [ ^ index ] ].
	
	^ -1.
]
