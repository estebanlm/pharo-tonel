Extension {
	#name : #GTSpotterExitAnnouncement
}

{
	#category : #'*gt-spotter-eventrecorder',
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterExitAnnouncement>>asRecorderEvent [

	^ GTSpotterRecorderExitAnnouncementEvent fromAnnouncement: self
]
