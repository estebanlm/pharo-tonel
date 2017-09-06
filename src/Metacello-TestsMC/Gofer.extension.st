Extension {
	#name : #Gofer
}

{
	#category : #'*metacello-testsmc',
	#timestamp : ' 8/31/2017 05:26:32'
}
Gofer>>metacelloCleanup [
	"Cleans the specified packages."
	
	^ self execute: MetacelloTestsGoferCleanup
]

{
	#category : #'*metacello-testsmc',
	#timestamp : ' 8/31/2017 05:26:32'
}
Gofer>>metacelloLoad [
	"Load the specified packages into the image."
	
	^ self execute: MetacelloGoferLoad
]

{
	#category : #'*metacello-testsmc',
	#timestamp : ' 8/31/2017 05:26:32'
}
Gofer>>metacelloUnload [
	"Unload the specified packages."
	
	^ self execute: MetacelloTestsGoferUnload
]
