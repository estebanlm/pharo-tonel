Extension {
	#name : #DelayScheduler
}

{
	#category : #'*Kernel-Tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
DelayScheduler>>testCaseSupportActiveDelay [
	^activeDelay
]

{
	#category : #'*Kernel-Tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
DelayScheduler>>testCaseSupportSetActiveDelayStartTime: time [
	activeDelayStartTime := time.
]

{
	#category : #'*Kernel-Tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
DelayScheduler>>testCaseSupportSystemTimingSemaphore [
	^ timingSemaphore
]

{
	#category : #'*Kernel-Tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
DelayScheduler>>testCaseSupportTimingSemaphore [
	"Tests might alter which sempahore the VM signals, so call this from test tearDown"
	^ timingSemaphore.
]
