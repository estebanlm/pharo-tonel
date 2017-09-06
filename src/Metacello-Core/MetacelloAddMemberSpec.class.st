"

"
Class {
	#name : #MetacelloAddMemberSpec,
	#superclass : #MetacelloMemberSpec,
	#category : #Metacello-Core-Members,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAddMemberSpec>>applyAdd: addBlock copy: copyBlock merge: mergeBlock remove: removeBlock [

	addBlock value: self
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAddMemberSpec>>applyToList: aListSpec [

	aListSpec add: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAddMemberSpec>>methodUpdateSelector [

	^#overrides:
]
