"
I am ZnHeaders.
I am a collection of HTTP headers.
I can be used for generating and parsing.

Header names are normalized and used case insensitive.
Header values can be multi-valued.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnHeaders,
	#superclass : #Object,
	#instVars : [
		'headers'
	],
	#classVars : [
		'CommonHeaders'
	],
	#category : #Zinc-HTTP-Core,
	#timestamp : 'SvenVanCaekenberghe 1/18/2011 10:57'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders class>>defaultRequestHeaders [
	^ self new
		at: 'User-Agent' put: ZnConstants defaultUserAgent;
		at: 'Accept' put: '*/*';
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders class>>defaultResponseHeaders [
	^ self new
		at: 'Server' put: ZnConstants defaultServerString;
		at: 'Date' put: ZnUtils httpDate;
		yourself
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders class>>initialize [
	CommonHeaders := (
		#(
			'Content-Length' 'Content-Type' 'Date' 'Server' 'Connection' 'User-Agent' 'Host'
			'Accept' 'Accept-Language' 'Accept-Encoding'
			'Referer' 'Dnt'
			'Cookie' 'Set-Cookie' 'Authorization' 'WWW-Authenticate' 'Proxy-Authorization'
			'Content-Encoding' 'Transfer-Encoding' 'Location'
			'If-Modified-Since' 'Content-Disposition' 
			'X-Zinc-Remote-Address' 'X-Forwarded-Server' 'X-Forwarded-For' 'X-Forwarded-Host' ) 
			collect: [ :each | ZnUtils capitalizeString: each ]) asSet
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders class>>readFrom: stream [
	^ self new
		readFrom: stream;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders class>>requestHeadersFor: url [
	| headers |
	headers := self defaultRequestHeaders.
	headers request: url.
	^ headers
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders class>>withAll: keyedCollection [
	^ self new
		addAll: keyedCollection;
		yourself 
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>= other [
	self class = other class ifFalse: [ ^ false ].
	^ self headers = other headers
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>acceptEntityDescription: entity [
	"Take over the content type and length from entity"
	
	entity 
		ifNotNil: [
			self
				contentType: entity contentType;
				contentLength: entity contentLength ]
		ifNil: [
			self 
				clearContentType; 
				clearContentLength ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>addAll: keyedCollection [
	"Note that we use #addAllMulti:"

	keyedCollection isEmpty
		ifFalse: [ self headers addAllMulti: keyedCollection ].
	^ keyedCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>at: headerName [
	"Return the value stored under headerName,
	a String for single-valued headers, an Array of Strings for multi-valued headers"
	
	^ self headers at: (self normalizeHeaderKey: headerName)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>at: headerName add: value [
	"Store value under headerName, optionally turning it into a multi-valued header 
	when a value was already present"
	
	^ self headers at: (self normalizeHeaderKey: headerName) add: value 
		

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>at: headerName ifAbsent: block [
	"Like #at: but executes block when the headerName is not found"
	
	self isEmpty ifTrue: [ ^ block value ].
	^ self headers at: (self normalizeHeaderKey: headerName) ifAbsent: block
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>at: headerName ifPresent: block [
	"Like #at: but executes block when the headerName is found"

	^ self headers at: (self normalizeHeaderKey: headerName) ifPresent: block
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>at: headerName put: value [
	"Store value under headerName, replace existing entries"
	
	^ self headers at: (self normalizeHeaderKey: headerName) put: value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>at: headerName put: value ifPresentMerge: binaryBlock [
	"Store value under headerName, when there is an existing entry,
	stored the result of evaluating binaryBlock with old and new value"
	
	| normalizedKey existingValue newValue |
	normalizedKey := self normalizeHeaderKey: headerName.
	existingValue := self headers at: normalizedKey ifAbsent: [ nil ].
	newValue := existingValue isNil
		ifTrue: [ value ] 
		ifFalse: [ binaryBlock value: existingValue value: value ].
	^ self headers at: normalizedKey put: newValue 
		


]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>clearContentLength [
	self removeKey: 'Content-Length' ifAbsent: [] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>clearContentType [
	self removeKey: 'Content-Type' ifAbsent: [] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>contentLength [
	"We allow multiple content-length headers provided they are identical."
	
	| value |
	(value := self headers at: 'Content-Length') isString
		ifFalse: [
			value asSet size = 1
				ifTrue: [ value := value first ]
				ifFalse: [ self error: 'Multiple, different Content-Length headers are not allowed' ] ].
	^ Integer readFrom: value ifFail: [ self error: 'Illegal HTTP Content Length' ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>contentLength: object [
	self at: 'Content-Length' put: object asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>contentType [
	| headerValue |
	headerValue := (self headers at: 'Content-Type') trimBoth.
	headerValue isEmpty ifTrue: [ ^ ZnMimeType default ].
	^ ZnMimeType fromString: headerValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>contentType: object [
	self at: 'Content-Type' put: object asString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>extendHeaderAt: key from: line [
	"The value of a continuation header line is concatenated, 
	keeping the whitespace, but without the CRLF"

	| existingValue newValue |
	existingValue := self at: key.
	newValue := existingValue isArray
		ifTrue: [ | last |
			last := existingValue size.
			existingValue at: last put: ((existingValue at: last) , line).
			existingValue ]
		ifFalse: [ existingValue , line ].
	self at: key put: newValue
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>hasContentLength [
	^ self includesKey: 'Content-Length'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>hasContentType [
	^ self includesKey: 'Content-Type'
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>hash [
	^ self headers hash
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>headers [
	headers isNil ifTrue: [ headers := ZnMultiValueDictionary new ].
	^ headers
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>headersDo: block [
	"Execute a two argument (key, value) block for each header.
	Multi-valued headers are handled transparently."

	self isEmpty ifTrue: [ ^ self ].
	self headers keysAndValuesDo: [ :headerKey :headerValue |
		headerValue isArray
			ifTrue: [ 
				headerValue do: [ :each | 
					block value: headerKey value: each ] ]
			ifFalse: [
				block value: headerKey value: headerValue ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>includesKey: headerName [
	^ self isEmpty not and: [ self headers includesKey: (self normalizeHeaderKey: headerName) ]
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>isDescribingEntity [
	"Do I include enough information to describe an entity (i.e. content length and type) ?"
	
	^ (self headers includesKey: 'Content-Type') 
		and: [ self headers includesKey: 'Content-Length' ]

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>isEmpty [
	^ headers isNil or: [ self headers isEmpty ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>keysAndValuesDo: block [
	"Execute a two argument (key, value) block for each header.
	Multi-valued headers are handled transparently."

	self headersDo: block
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>normalizeHeaderKey: string [
	"Test string to see if it has proper header key capitalization,
	if true, return string, if not, return a properly capitalized copy"
	
	"Optimization: if string is a know,, properly capitalized header, use it as is"
	(CommonHeaders includes: string) 
		ifTrue: [ ^ string ].
	^ (ZnUtils isCapitalizedString: string)
		ifTrue: [ string ] 
		ifFalse: [ ZnUtils capitalizeString: string ] 
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>postCopy [
	headers := headers copy
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>printOn: stream [
	super printOn: stream.
	self isEmpty ifFalse: [ self headers printElementsOn: stream ]
	
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>readFrom: stream [
	| line reader |
	reader := ZnLineReader on: stream.
	[ (line := reader nextLine) isEmpty ] whileFalse: [ | key |
		key := self readOneHeaderFrom: line readStream.
		"Continuation header lines start with a space or tab"
		[ stream atEnd not and: [ #[ 32 9 ] includes: stream peek asInteger ] ]
			whileTrue: [ 
				self extendHeaderAt: key from: reader nextLine ] ] 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>readOneHeaderFrom: stream [
	| key value |
	key := stream upTo: $:.
	[ stream peek == Character space ] whileTrue: [ stream next ].
	value := stream upToEnd.
	self at: key add: value.
	^ key
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>removeKey: headerName [
	^ self headers removeKey: (self normalizeHeaderKey: headerName)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>removeKey: headerName ifAbsent: block [
	self isEmpty ifTrue: [ ^ block value ].
	^ self headers removeKey: (self normalizeHeaderKey: headerName) ifAbsent: block
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>request: url [
	"Setup the receiver to request url"
	
	(url isNil or: [ url hasHost not ]) ifTrue: [ ^ self ].  
	self at: 'Host' put: url authority.
	(ZnNetworkingUtils proxyAuthorizationHeaderValueToUrl: url)
		ifNotNil: [ :value | self at: 'Proxy-Authorization' put: value ].    
  
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>unlimited [
	self headers unlimited
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHeaders>>writeOn: stream [
	| writeStream |
	writeStream := ZnBivalentWriteStream on: stream.
	self headersDo: [ :key :value |
		writeStream nextPutAll: key; nextPut: $:; space; nextPutAll: value; nextPutAll: String crlf ]
]
