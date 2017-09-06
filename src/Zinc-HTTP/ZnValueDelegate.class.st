"
I am ZnValueDelegate.
I forward #handleRequest: messages to the object that I wrap using #value:

ZnServer default delegate: 
	(ZnValueDelegate with: [ :request | 
		ZnResponse ok: (ZnEntity with: 'You asked for ', request uri printString) ] ).

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnValueDelegate,
	#superclass : #Object,
	#instVars : [
		'object'
	],
	#category : #Zinc-HTTP-Client-Server,
	#timestamp : 'SvenVanCaekenberghe 12/7/2010 16:14'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnValueDelegate class>>with: object [
	^ self new
		object: object;
		yourself
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnValueDelegate>>handleRequest: request [
	^ object value: request
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnValueDelegate>>object: anObject [
	object := anObject
]
