Extension {
	#name : #GTSpotterActOn
}

{
	#category : #'*gt-spotter-eventrecorder',
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterActOn>>asRecorderEvent [

	^ GTSpotterRecorderActOnEvent fromAnnouncement: self
]
