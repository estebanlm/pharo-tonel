Extension {
	#name : #TApplyingOnClassSide
}

{
	#category : #'*CodeExport',
	#timestamp : ' 8/31/2017 07:16:13'
}
TApplyingOnClassSide>>fileOutInitializerOn: aStream [
	(self includesSelector: #initialize) ifTrue: 
		[aStream cr.
		aStream nextChunkPut: self soleInstance name , ' initialize'].
]

{
	#category : #'*CodeExport',
	#timestamp : ' 8/31/2017 07:16:13'
}
TApplyingOnClassSide>>nonTrivial  [
	"Answer whether the receiver has any methods or instance variables."

	^ self instVarNames notEmpty or: [self hasMethods or: [self hasTraitComposition]]
]
