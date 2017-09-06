"
Abstract super class for exceptions signalled by clients based on the telnet protocol.

"
Class {
	#name : #TelnetProtocolError,
	#superclass : #ProtocolClientError,
	#category : #Network-Protocols,
	#timestamp : 'mir 5/12/2003 18:07'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:57'
}
TelnetProtocolError>>code [
	^self protocolInstance responseCode
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:57'
}
TelnetProtocolError>>isCommandUnrecognized [
	^ self code = 500
]
