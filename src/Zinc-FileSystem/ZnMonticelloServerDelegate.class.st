"
I am ZnMonticelloServerDelegate.
I am a proof of concept implementation of a basic Monticello server.
I function as a delegate for ZnServer.

ZnServer startDefaultOn: 1701.
ZnServer default delegate: ((ZnMonticelloServerDelegate new) 
									directory: '/tmp/monticello'; 
									yourself).

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnMonticelloServerDelegate,
	#superclass : #Object,
	#instVars : [
		'directory'
	],
	#category : #Zinc-FileSystem,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnMonticelloServerDelegate>>directory [
	^ directory 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnMonticelloServerDelegate>>directory: object [
	directory := object asFileReference
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnMonticelloServerDelegate>>handleGetMczEntry: request [
	| name file stream entity |
	name := request uri firstPathSegment.
	file := self directory / name.
	^ ((self isValidMczName: name) and: [ file exists ]) 
		ifTrue: [ |  |
			(stream := file readStream)
				binary.
			(entity := ZnStreamingEntity type: ZnMimeType applicationOctetStream length: file size)
				stream: stream.
			ZnResponse ok: entity ]
		ifFalse: [ ZnResponse notFound: request uri ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnMonticelloServerDelegate>>handleListMczEntries: request [
	^ ZnResponse ok: (ZnEntity html: self repositoryListing)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnMonticelloServerDelegate>>handlePutMczEntry: request [
	| name file |
	name := request uri firstPathSegment.
	file := self directory / name.
	^ ((self isValidMczName: name) and: [ file exists not ]) 
		ifTrue: [
			file writeStreamDo: [ :stream |
				stream binary.
				request entity writeOn: stream ].
			ZnResponse created: request uri ]
		ifFalse: [ ZnResponse badRequest: request ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnMonticelloServerDelegate>>handleRequest: request [
	(request method = #GET)
		ifTrue: [
			^ request uri isSlash
				ifTrue: [ self handleListMczEntries: request ]
				ifFalse: [ self handleGetMczEntry: request ] ].
	^ (request method = #PUT) 
		ifTrue: [ self handlePutMczEntry: request ]
		ifFalse: [ ZnResponse badRequest: request ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnMonticelloServerDelegate>>isValidMczName: string [
	^ string isString 
		and: [ string isEmpty not
			and: [ (string endsWith: '.mcz')
				and: [ (string includes: $/) not ] ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnMonticelloServerDelegate>>mczEntries [
	^ (self directory fileNames select: [ :each | each endsWith: '.mcz' ])
		asSortedCollection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnMonticelloServerDelegate>>repositoryListing [
	^ ZnHtmlOutputStream streamContents: [ :html |
		html page: 'Monticello Repository' do: [
			html tag: #ul do: [ 
				self mczEntries do: [ :each |
					html tag: #li do: [ 
						html 
							tag: #a 
							attributes: { #href. each } 
							with: each ] ] ] ] ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnMonticelloServerDelegate>>value: request [
	"I implement the generic #value: message as equivalent to #handleRequest:"
	
	^ self handleRequest: request
]
