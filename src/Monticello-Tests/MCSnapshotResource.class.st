"

"
Class {
	#name : #MCSnapshotResource,
	#superclass : #TestResource,
	#instVars : [
		'snapshot'
	],
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotResource class>>mockPackage [
	^ (MCPackage new name: self mockPackageName)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotResource class>>mockPackageName [
	^ 'MonticelloMocks'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotResource class>>takeSnapshot [
	^ self mockPackage snapshot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotResource>>definitions [
	^ snapshot definitions
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotResource>>setUp [
	snapshot := self class takeSnapshot.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotResource>>snapshot [
	^ snapshot
]
