"
A MutexSet helps with aquiring a set of mutexes.
"
Class {
	#name : #MutexSet,
	#superclass : #Object,
	#instVars : [
		'array'
	],
	#category : #Kernel-Processes,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
MutexSet class>>withAll: mutexList [
	^self new withAll: mutexList
]

{
	#category : #'mutual exclusion',
	#timestamp : ' 8/31/2017 07:16:33'
}
MutexSet>>critical: aBlock [
	"Evaluate aBlock aquiring all mutexes"
	^self pvtCritical: aBlock startingAt: 1
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
MutexSet>>pvtCritical: aBlock startingAt: index [
	| mutex |
	index > array size ifTrue:[^aBlock value].
	mutex := array at: index.
	^mutex critical:[self pvtCritical: aBlock startingAt: index+1].
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:33'
}
MutexSet>>withAll: mutexList [
	array := mutexList.
]
