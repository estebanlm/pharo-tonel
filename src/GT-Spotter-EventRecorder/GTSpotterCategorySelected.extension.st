Extension {
	#name : #GTSpotterCategorySelected
}

{
	#category : #'*gt-spotter-eventrecorder',
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterCategorySelected>>asRecorderEvent [

	^ GTSpotterRecorderCategorySelectedEvent fromAnnouncement: self
]
