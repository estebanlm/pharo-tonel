Extension {
	#name : #GTSpotterSearchFinished
}

{
	#category : #'*gt-spotter-eventrecorder',
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterSearchFinished>>asRecorderEvent [

	^ GTSpotterRecorderSearchFinishedEvent fromAnnouncement: self
]
