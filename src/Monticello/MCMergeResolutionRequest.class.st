"
Notify to resolve conflicts by merging
"
Class {
	#name : #MCMergeResolutionRequest,
	#superclass : #Notification,
	#instVars : [
		'merger'
	],
	#category : #Monticello-Versioning,
	#timestamp : 'TorstenBergmann 2/5/2014 13:51'
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeResolutionRequest>>autoMerge [
	"If there are not conflicts, merge, otherwise delegate to the UI"
	self hasConflicts
		ifTrue: [ self resolve ]
		ifFalse: [ self merge ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeResolutionRequest>>hasConflicts [
	^ self merger hasConflicts
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeResolutionRequest>>merge [
	self resume: true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeResolutionRequest>>merger [
	^ merger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeResolutionRequest>>merger: aMerger [
	merger := aMerger
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeResolutionRequest>>resolve [
	self pass
]
