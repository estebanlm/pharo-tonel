"

"
Class {
	#name : #MetacelloMergeMemberSpec,
	#superclass : #MetacelloMemberSpec,
	#category : #Metacello-Core-Members,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMergeMemberSpec>>applyAdd: addBlock copy: copyBlock merge: mergeBlock remove: removeBlock [

	mergeBlock value: self
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMergeMemberSpec>>applyToList: aListSpec [

	aListSpec merge: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMergeMemberSpec>>methodUpdateSelector [

	^#with:
]
