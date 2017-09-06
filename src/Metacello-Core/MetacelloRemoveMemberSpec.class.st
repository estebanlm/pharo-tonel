"

"
Class {
	#name : #MetacelloRemoveMemberSpec,
	#superclass : #MetacelloMemberSpec,
	#category : #Metacello-Core-Members,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloRemoveMemberSpec>>applyAdd: addBlock copy: copyBlock merge: mergeBlock remove: removeBlock [

	removeBlock value: self
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloRemoveMemberSpec>>applyToList: aListSpec [

	aListSpec remove: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloRemoveMemberSpec>>methodUpdateSelector [

	^#remove:
]
