Extension {
	#name : #MCVersionSaved
}

{
	#category : #'*Epicea',
	#timestamp : ' 8/31/2017 05:26:27'
}
MCVersionSaved>>asEpiceaEvent [
	
	^ EpMonticelloVersionSave version: version repository: repository
]
