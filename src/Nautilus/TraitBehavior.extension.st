Extension {
	#name : #TraitBehavior
}

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
TraitBehavior>>hierarchyClassTree [

^{
	self . 

	( self subclasses 
	reject: [ :class | class isClassSide ] 
	thenCollect: [ :cls | cls hierarchyClassTree ]
	) sort: [ :a :b | a first name <= b first name ]
} 
]
