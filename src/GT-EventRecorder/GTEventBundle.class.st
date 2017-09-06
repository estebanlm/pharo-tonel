"
I associate a piece of data that should be delivered to a remote server with the url of that remote server.

Instances of me should be sent to a GTEventDelivery.


"
Class {
	#name : #GTEventBundle,
	#superclass : #Object,
	#instVars : [
		'url',
		'category',
		'data'
	],
	#category : #GT-EventRecorder-Support,
	#timestamp : 'AndreiChis 10/13/2015 00:34'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventBundle>>accept: aVisitor  [
	^ aVisitor visitSingleBundle: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventBundle>>category [
	^ category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventBundle>>category: anObject [
	category := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventBundle>>data [
	^ data
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventBundle>>data: anObject [
	data := anObject
]

{
	#category : #'accessing - computed',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventBundle>>entity [
	^ ZnByteArrayEntity bytes: self data
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventBundle>>url [
	^ url
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventBundle>>url: anObject [
	url := anObject
]
