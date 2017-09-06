Extension {
	#name : #ClassTrait
}

{
	#category : #'*CodeExport',
	#timestamp : ' 8/31/2017 07:16:13'
}
ClassTrait>>fileOutInitializerOn: aStream [
	(self includesSelector: #initialize) ifTrue: 
		[aStream cr.
		aStream nextChunkPut: self soleInstance name , ' initialize'].
]

{
	#category : #'*CodeExport',
	#timestamp : ' 8/31/2017 07:16:13'
}
ClassTrait>>nonTrivial  [
	"Answer whether the receiver has any methods or instance variables."

	^ self instVarNames notEmpty or: [self hasMethods or: [self hasTraitComposition]]
]
