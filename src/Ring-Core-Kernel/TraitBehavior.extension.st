Extension {
	#name : #TraitBehavior
}

{
	#category : #'*Ring-Core-Kernel',
	#timestamp : ' 8/31/2017 07:17:01'
}
TraitBehavior>>methodNamed: aSelector [

	^ self methodDict at: aSelector
]

{
	#category : #'*Ring-Core-Kernel',
	#timestamp : ' 8/31/2017 07:17:01'
}
TraitBehavior>>methodsInProtocol: aString [

	^ (self organization listAtCategoryNamed: aString) 
			collect: [ :each | (self compiledMethodAt: each) ]
]

{
	#category : #'*Ring-Core-Kernel',
	#timestamp : ' 8/31/2017 07:17:01'
}
TraitBehavior>>protocols [
	
	^ self organization categories copy
]
