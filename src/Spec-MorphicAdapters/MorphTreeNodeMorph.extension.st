Extension {
	#name : #MorphTreeNodeMorph
}

{
	#category : #'*Spec-MorphicAdapters',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphTreeNodeMorph>>isMorphicModel [

	^ true
]

{
	#category : #'*Spec-MorphicAdapters',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphTreeNodeMorph>>model [

	^ self complexContents
]
