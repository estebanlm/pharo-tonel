"
Handling remote changes
"
Class {
	#name : #GoferRemoteChanges,
	#superclass : #GoferChanges,
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:33'
}

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferRemoteChanges>>sourceSnapshotOf: aReference [
	^ aReference workingCopy package snapshot
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferRemoteChanges>>targetSnapshotOf: aReference [
	^ (aReference resolveWith: self gofer) version snapshot
]
