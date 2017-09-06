Extension {
	#name : #GTSpotterShowPreview
}

{
	#category : #'*gt-spotter-eventrecorder',
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterShowPreview>>asRecorderEvent [

	^ GTSpotterRecorderShowPreviewEvent fromAnnouncement: self
]
