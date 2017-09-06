Extension {
	#name : #RBTransformationRule
}

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBTransformationRule>>check: aMethod forCritiquesDo: aCriticBlock [
	
	(self basicCheck: aMethod)
		ifTrue: [
			aCriticBlock cull: (
				ReTransformationCritique
					for: aMethod
					by: self
					tree: rewriteRule tree)  ]
		
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBTransformationRule>>suggestedCode: aCritic [

	^ (self changes detect: [ :ch | 
			(ch  isMeta = aCritic  methodClass isMeta) &
			(ch changeClassName = aCritic criticTheNonMetaclassClass name) & 
			(ch selector = aCritic selector)]) source.
		
]
