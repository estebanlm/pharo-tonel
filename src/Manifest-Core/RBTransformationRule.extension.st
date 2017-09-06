Extension {
	#name : #RBTransformationRule
}

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
RBTransformationRule>>transform: aCritic [
	| changeCode |

	changeCode := (self changes detect: [ :ch | 
			(ch  isMeta = aCritic  methodClass isMeta) &
			(ch changeClassName = aCritic criticTheNonMetaclassClass name) & 
			(ch selector = aCritic selector)]) source.
		
	aCritic methodClass compile: changeCode
]
