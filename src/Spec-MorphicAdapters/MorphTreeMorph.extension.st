Extension {
	#name : #MorphTreeMorph
}

{
	#category : #'*Spec-MorphicAdapters',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphTreeMorph>>initializeColumsFrom: aModel [

	self columns: aModel columns
]
