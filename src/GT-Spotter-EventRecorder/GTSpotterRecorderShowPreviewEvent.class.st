"
A GTSpotterRecorderShowPreviewEvent models the action of explicitly closing the preview of an object.

"
Class {
	#name : #GTSpotterRecorderShowPreviewEvent,
	#superclass : #GTSpotterRecorderEvent,
	#category : #GT-Spotter-EventRecorder-Events,
	#timestamp : 'AndreiChis 2/27/2015 14:39'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderShowPreviewEvent>>accept: aVisitor [
	^ aVisitor visitShowPreviewEvent: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderShowPreviewEvent>>isShowPreview [
	^ true
]
