Extension {
	#name : #Heap
}

{
	#category : #'*Kernel-Processes',
	#timestamp : ' 8/31/2017 07:16:33'
}
Heap>>removeFirstOrNil [
	"Remove the first element from the receiver"
	self isEmpty ifTrue:  [ ^nil ].
	^self privateRemoveAt: 1
]
