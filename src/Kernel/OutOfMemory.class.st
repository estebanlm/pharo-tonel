"
OutOfMemory is signaled when an allocation fails due to not having enough memory. Its default action signals the low-space semaphore.
Originally suggested by A. Raab.
"
Class {
	#name : #OutOfMemory,
	#superclass : #Error,
	#category : #Kernel-Exceptions,
	#timestamp : 'StephaneDucasse 12/18/2009 12:01'
}

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
OutOfMemory>>defaultAction [
	Smalltalk signalLowSpace.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
OutOfMemory>>isResumable [

	^true
]
