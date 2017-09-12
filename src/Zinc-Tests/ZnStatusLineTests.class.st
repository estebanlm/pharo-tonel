Class {
	#name : #ZnStatusLineTests,
	#superclass : #TestCase,
	#category : #Zinc-Tests
}

{ #category : #testing }
ZnStatusLineTests >> testInitialization [
	"Make sure everything is properly initialized"
	
	ZnConstants officialHTTPStatusCodesSpec pairsDo: [ :code :reason |
		| statusLine |
		statusLine := ZnStatusLine code: code.
		self assert: statusLine code equals: code.
		self assert: statusLine reason equals: reason ]
]

{ #category : #testing }
ZnStatusLineTests >> testReading [
	| statusLine string |
	string := 'HTTP/1.1 200 OK', String crlf.
	statusLine := ZnStatusLine readFrom: string readStream.
	self assert: statusLine code = 200.
	self assert: statusLine reason = 'OK'.
	self assert: statusLine version = ZnConstants defaultHTTPVersion 
]

{ #category : #testing }
ZnStatusLineTests >> testReadingWrongCode [
	| string |
	string := 'HTTP/1.0 1000 OK', String crlf.
	self should: [ ZnStatusLine readFrom: string readStream ] raise: ZnUnknownHttpStatusCode 
]

{ #category : #testing }
ZnStatusLineTests >> testReadingWrongVersion [
	| string |
	string := 'HTTP/0.9 200 OK', String crlf.
	self should: [ ZnStatusLine readFrom: string readStream ] raise: ZnUnknownHttpVersion
]

{ #category : #testing }
ZnStatusLineTests >> testReadingWrongVersion2 [
	| string |
	string := 'HTTP/0.9 Foo OK', String crlf.
	self should: [ ZnStatusLine readFrom: string readStream ] raise: ZnUnknownHttpVersion
]

{ #category : #testing }
ZnStatusLineTests >> testWriting [
	| statusLine string |
	statusLine := ZnStatusLine ok.
	string := String streamContents: [ :stream | statusLine writeOn: stream ].
	self assert: string = ('HTTP/1.1 200 OK', String crlf)
]
