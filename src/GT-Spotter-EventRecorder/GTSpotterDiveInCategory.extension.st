Extension {
	#name : #GTSpotterDiveInCategory
}

{
	#category : #'*gt-spotter-eventrecorder',
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterDiveInCategory>>asRecorderEvent [

	^ GTSpotterRecorderDiveInCategoryEvent fromAnnouncement: self
]
