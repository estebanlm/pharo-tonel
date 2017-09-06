Extension {
	#name : #RBLintRule
}

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBLintRule>>anchorFor: anEntity [

	^ ReSourceAnchor
			entity: anEntity
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBLintRule>>check: anEntity [

	^ self check: anEntity ifNoCritiques: [ "do nothing" ]
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBLintRule>>check: anEntity forCritiquesDo: aCriticBlock [

	(self basicCheck: anEntity)
		ifTrue: [ aCriticBlock cull: (self critiqueFor: anEntity) ]
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBLintRule>>check: anEntity forCritiquesDo: aCriticBlock ifNone: alternativeBlock [
	| encounteredCritique |
	
	encounteredCritique := false.

	self check: anEntity forCritiquesDo: [ :crit |
		encounteredCritique := true.
		aCriticBlock cull: crit ].
	
	encounteredCritique ifFalse: alternativeBlock
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBLintRule>>check: anEntity ifNoCritiques: alternativeBlock [
	| critics |
	
	critics := OrderedCollection new.
	self check: anEntity forCritiquesDo: [ :critic | critics add: critic ] ifNone: alternativeBlock.
	^ critics
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBLintRule class>>checksAST [

	^ false
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBLintRule class>>checksNode [

	^ false
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBLintRule>>critiqueFor: anEntity [

	^ ReTrivialCritique
		withAnchor: (self anchorFor: anEntity)
		by: self
]
