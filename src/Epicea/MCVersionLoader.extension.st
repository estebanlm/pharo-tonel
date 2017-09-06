Extension {
	#name : #MCVersionLoader
}

{
	#category : #'*Epicea-Triggering',
	#timestamp : ' 8/31/2017 05:26:27'
}
MCVersionLoader>>asEpiceaEvent [

	^ EpMonticelloVersionsLoad versions: versions
]

{
	#category : #'*Epicea-Triggering',
	#timestamp : ' 8/31/2017 05:26:27'
}
MCVersionLoader>>isEpiceaInterestingJobOwner [

	^ true
]
