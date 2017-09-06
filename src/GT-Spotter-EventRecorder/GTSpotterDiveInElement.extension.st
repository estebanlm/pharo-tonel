Extension {
	#name : #GTSpotterDiveInElement
}

{
	#category : #'*gt-spotter-eventrecorder',
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterDiveInElement>>asRecorderEvent [

	^ GTSpotterRecorderDiveInElementEvent fromAnnouncement: self
]
