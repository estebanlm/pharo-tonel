"
A GTSpotterRecorderHidePreviewEvent  models the action of explicitly hidding the preview.

"
Class {
	#name : #GTSpotterRecorderHidePreviewEvent,
	#superclass : #GTSpotterRecorderEvent,
	#category : #GT-Spotter-EventRecorder-Events,
	#timestamp : 'AndreiChis 2/27/2015 14:38'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderHidePreviewEvent>>accept: aVisitor [
	^ aVisitor visitHidePreviewEvent: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderHidePreviewEvent>>isHidePreview [
	^ true
]
