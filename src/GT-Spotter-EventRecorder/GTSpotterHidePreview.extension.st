Extension {
	#name : #GTSpotterHidePreview
}

{
	#category : #'*gt-spotter-eventrecorder',
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterHidePreview>>asRecorderEvent [

	^ GTSpotterRecorderHidePreviewEvent fromAnnouncement: self
]
