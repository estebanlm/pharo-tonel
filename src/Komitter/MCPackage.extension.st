Extension {
	#name : #MCPackage
}

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCPackage>>baseSnapshot [

	^ self workingCopy baseSnapshot
]

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCPackage>>koPackage [

	^ KomitPackage package: self
]

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCPackage>>package [
	"Required to adapt Komitter, which deals with MCPackages to MCSliceInfo, which deals with MCWorkingCopy instances. This is obviously not a great solution, but is slightly improvement over what we had (i.e. lots of duplication)"
	^ self
	
]

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCPackage>>patch [
	| snapshot base patch |
	
	snapshot := self snapshot.
	base := self baseSnapshot.
	patch := base
		ifNil: [ MCPatch new initializeWithTarget: self snapshot ]
		ifNotNil: [ MCPatch new silentInitializeWithBase: base target: snapshot ].
		
	^ KomitPatch 
		base: base
		patch: patch
]

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCPackage>>remotes [

	^ self workingCopy remotes
]

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCPackage>>version [

	^ KomitterManager current versionFor: self
]
