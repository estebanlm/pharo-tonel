"

"
Class {
	#name : #MetacelloTestsGoferUnload,
	#superclass : #GoferUnload,
	#category : #Metacello-TestsMC,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloTestsGoferUnload>>execute [
	self workingCopies 
		do: [ :copy | self unload: copy ].
	self model load.
	self gofer metacelloCleanup.
	self workingCopies 
		do: [ :copy | self unregister: copy ]
]

{
	#category : #unloading,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloTestsGoferUnload>>unloadClasses: aWorkingCopy [
	"skip this so that tests run faster"
]
