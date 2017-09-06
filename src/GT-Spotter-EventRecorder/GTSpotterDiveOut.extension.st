Extension {
	#name : #GTSpotterDiveOut
}

{
	#category : #'*gt-spotter-eventrecorder',
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterDiveOut>>asRecorderEvent [

	^ GTSpotterRecorderDiveOutEvent fromAnnouncement: self
]
