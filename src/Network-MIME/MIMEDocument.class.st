"
a MIME object, along with its type and the URL it was found at (if any)
"
Class {
	#name : #MIMEDocument,
	#superclass : #Object,
	#instVars : [
		'type',
		'contents',
		'contentStream',
		'uri'
	],
	#category : #Network-MIME,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>content: aString [
	^self contentType: self defaultContentType  content: aString
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>contentStream: aStream [
	^ self 
		contentStream: aStream 
		mimeType: self defaultMIMEType
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>contentStream: aStream mimeType: aMimeType  [
	"create a MIMEDocument with the given content-type and contentStream"
	"MIMEDocument mimeType: 'text/plain' asMIMEType contentStream: (ReadStream on: 'This is a test')"
	
	^self contentStream: aStream mimeType: aMimeType uri: aStream uri
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>contentStream: aStream mimeType: aMimeType uri: aURI [
	"create a MIMEDocument with the given content-type and contentStream"
	"MIMEDocument mimeType: 'text/plain' asMIMEType contentStream: (ReadStream on: 'This is a test')"
	
	^self new contentStream: aStream mimeType: aMimeType uri: aURI
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>contentType: aMIMEType content: content [
	"create a MIMEDocument with the given content-type and content"
	"MIMEDocument contentType: 'text/plain' content: 'This is a test'"
	
	^ self new
		privateContent: content;
		type: aMIMEType asZnMimeType;
		yourself
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>contentType: type content: content url: url [
	^ self 
		contents: content 
		mimeType: type asZnMimeType 
		uri: url
]

{
	#category : #content-types,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>contentTypeFormData [
	^'application/x-www-form-urlencoded'
]

{
	#category : #content-types,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>contentTypeHtml [
	^'text/html'
]

{
	#category : #content-types,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>contentTypeMultipart [
	^'multipart/form-data'
]

{
	#category : #content-types,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>contentTypePlainText [
	^'text/plain'
]

{
	#category : #content-types,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>contentTypeXml [
	^'text/xml'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>contents: aString [
	^ self 
		contents: aString 
		mimeType: self defaultMIMEType
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>contents: content mimeType: aMimeType  [
	"create a MIMEDocument with the given content-type and content"
	"MIMEDocument mimeType: 'text/plain' asMIMEType content: 'This is a test'"
	
	^self contents: content mimeType: aMimeType uri: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>contents: content mimeType: aMimeType uri: aURL [
	"create a MIMEDocument with the given content-type and content"
	"MIMEDocument mimeType: 'text/plain' asMIMEType content: 'This is a test'"
	
	^self new contents: content mimeType: aMimeType uri: aURL
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>defaultContentType [
	^self defaultMIMEType asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>defaultMIMEType [
	^ ZnMimeType default
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>guessContentTypeFromExtension: ext [
	"guesses a content type from the extension"
	^(self guessTypeFromExtension: ext) asString
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>guessTypeFromExtension: ext [
	"guesses a content type from the extension"
	^self guessTypeFromName: ext
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>guessTypeFromName: url [
	"guesses a content type from the url"
	
	| extension |
	extension := url asString copyAfterLast: $..
	^ ZnMimeType
		forFilenameExtension: extension
		ifAbsent: [ nil ]
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument class>>resetMIMEdatabase [
	"no-op for catching Kom override"
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>content [
	^self contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>contentStream [
	"Answer a RWBinaryOrTextStream on the contents."

	contentStream
		ifNil: [contentStream := contents
				ifNil: [self contentStreamOnURI]
				ifNotNil: [(RWBinaryOrTextStream with: self contents) reset]].
	^contentStream
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>contentStream: aStream mimeType: aMimeType uri: aUri [
	type := aMimeType.
	contentStream := aStream.
	uri := aUri
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>contentStreamOnURI [
	^self uri contentStream
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>contentType [
	^self mimeType asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>contents [
	"Answer the receiver's raw data. If we have a stream to read from. Read in the data, cache it and discard the stream."

	contents ifNil: [contents := self getContentFromStream].
	^contents
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>contents: contentStringOrBytes mimeType: aMimeType uri: aURI [
	type := aMimeType.
	contents := contentStringOrBytes.
	uri := aURI
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>discardContentStream [
	contentStream ifNotNil: [contentStream close].
	contentStream := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>discardContents [
	contents := nil.
	self discardContentStream
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>getContentFromStream [
	| streamContents |
	streamContents := self contentStream contents.
	self discardContentStream.
	^streamContents
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>isGif [
	^ self mainType = 'image'
		and: [self subType = 'gif']
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>isJpeg [
	^ self mainType = 'image'
		and: [self subType = 'jpeg' | (self subType = 'jpg')]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>isMultipart [
	^self mainType = 'multipart'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>isMultipartAlternative [
	"whether the document is in a multipart format where the parts are alternates"
	^ self contentType = 'multipart/alternative'

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>isPng [
	^ self mainType = 'image'
		and: [self subType = 'png']
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>isPnm [
	^ self mainType = 'image'
		and: [self subType = 'pnm']
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>mainType [
	^self mimeType main
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>mimeType [
	^type
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>parts [
	"Return the parts of this message.  There is a far more reliable implementation of parts in MailMessage, but for now we are continuing to use this implementation"
	| parseStream currLine separator msgStream messages |
	self isMultipart ifFalse: 
		[ ^ #() ].
	parseStream := self content readStream.
	currLine := ''.
	[ '--*' match: currLine ] whileFalse: [ currLine := parseStream nextLine ].
	separator := currLine copy.
	msgStream := LimitingLineStreamWrapper 
		on: parseStream
		delimiter: separator.
	messages := OrderedCollection new.
	[ parseStream atEnd ] whileFalse: 
		[ messages add: msgStream upToEnd.
		msgStream skipThisLine ].
	^ messages collect: [ :e | MailMessage from: e ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>printOn: aStream [
	aStream nextPutAll: self class name;
		nextPutAll: ' (';
		nextPutAll: self mimeType asString;
		nextPutAll: ', '.
	contents
		ifNotNil: [aStream
			nextPutAll: self contents size printString;
			nextPutAll: ' bytes)']
		ifNil: [aStream nextPutAll: 'unknown size)'].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>privateContent: aString [
	contents := aString
]

{
	#category : #files,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>saveToFile: anAbsolutePathString [

	FileStream forceNewFileNamed: anAbsolutePathString do: [ :str |
		str binary.
		str nextPutAll: (self contents) ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>subType [
	^self mimeType sub
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>type: mimeType [
	type := mimeType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>uri [
	"Answer the URL the receiver was downloaded from.  It may legitimately be nil."

	^uri
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>uri: aURI [
	uri := aURI
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MIMEDocument>>url [
	"Answer the URL the receiver was downloaded from.  It may legitimately be nil."

	^ uri ifNotNil:[uri asString asUrl]
]
