"

"
Class {
	#name : #MetacelloCopyMemberSpec,
	#superclass : #MetacelloMemberSpec,
	#instVars : [
		'sourceName'
	],
	#category : #Metacello-Core-Members,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloCopyMemberSpec>>applyAdd: addBlock copy: copyBlock merge: mergeBlock remove: removeBlock [
    copyBlock value: self
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloCopyMemberSpec>>applyToList: aListSpec [

	aListSpec copy: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloCopyMemberSpec>>methodUpdateSelector [

	^#copy:
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloCopyMemberSpec>>sourceName [

	^sourceName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloCopyMemberSpec>>sourceName: aString [

	sourceName := aString
]
