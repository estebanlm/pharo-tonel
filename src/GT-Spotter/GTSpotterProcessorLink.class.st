"

"
Class {
	#name : #GTSpotterProcessorLink,
	#superclass : #DoubleLink,
	#instVars : [
		'headLink',
		'tailLink',
		'size'
	],
	#category : #GT-Spotter-Utils,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProcessorLink class>>from: aDoubleLink [

	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProcessorLink>>asSpotterProcessorLink [

	^ self
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProcessorLink>>clear [

	self
		headLink: nil;
		tailLink: nil.
		
	size := 0.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProcessorLink>>gtDisplayOn: stream [
	stream 
		nextPutAll: 'Processor link: ';
		nextPutAll: self processor title asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProcessorLink>>headLink [
	^ headLink
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProcessorLink>>headLink: anObject [
	headLink := anObject
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProcessorLink>>incrementSize [

	size := self size + 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProcessorLink>>isEmpty [

	^ self headLink isNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProcessorLink>>isFull [

	^ self size = self processor itemsLimit
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProcessorLink>>processor [

	^ self value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProcessorLink>>size [

	^ size ifNil: [ size := 0 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProcessorLink>>tailLink [
	^ tailLink
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterProcessorLink>>tailLink: anObject [
	tailLink := anObject
]
