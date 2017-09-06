"
Abstract super class for protocol clients

	protocolInstance		reference to the protocol client throughing the exception. Exception handlers can access the client in order close, respond or whatever may be appropriate

"
Class {
	#name : #ProtocolClientError,
	#superclass : #Error,
	#instVars : [
		'protocolInstance'
	],
	#category : #Network-Protocols,
	#timestamp : 'mir 5/12/2003 18:05'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:57'
}
ProtocolClientError class>>protocolInstance: aProtocolInstance [
	^self new protocolInstance: aProtocolInstance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:57'
}
ProtocolClientError>>messageText [
	^super messageText
		ifNil: [self response]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:57'
}
ProtocolClientError>>protocolInstance [
	^protocolInstance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:57'
}
ProtocolClientError>>protocolInstance: aProtocolInstance [
	protocolInstance := aProtocolInstance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:57'
}
ProtocolClientError>>response [
	^self protocolInstance lastResponse
]
