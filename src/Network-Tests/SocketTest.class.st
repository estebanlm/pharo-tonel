"
SUnit tests for sockets
"
Class {
	#name : #SocketTest,
	#superclass : #TestCase,
	#instVars : [
		'listenerSocket',
		'clientSocket',
		'serverSocket'
	],
	#category : #Network-Tests-Kernel,
	#timestamp : 'TorstenBergmann 2/5/2014 10:11'
}

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>faultyUDPSocket [

	| cls |
	
	cls := Socket newAnonymousSubclass .
	
	"the mock socket is not sending anything, so there is nothing to wait for"
	cls compile: 'waitForSendDoneFor: aNumber ^ true'.
	
	"compile the primitive to not send, but return a 0 count for any send"
	cls compile: 'primSocket: socketID sendUDPData: aStringOrByteArray toHost: hostAddress port: portNumber startIndex: startIndex count: count ^ 0'.
	
	^ cls newUDP
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>listenerAddress [
	^NetNameResolver loopBackAddress

]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>listenerPort [
	^42324

]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>setUp [

	listenerSocket := Socket newTCP listenOn: self listenerPort backlogSize: 4 interface: self listenerAddress.

]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>tearDown [

	listenerSocket ifNotNil:[listenerSocket destroy].
	clientSocket ifNotNil:[clientSocket destroy].
	serverSocket ifNotNil:[serverSocket destroy].

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>testClientConnect [
	"Tests a client socket connection"

	clientSocket := Socket newTCP.
	clientSocket connectTo: self listenerAddress port: self listenerPort.
	clientSocket waitForConnectionFor: 2.
	self assert: clientSocket isConnected.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>testDataReceive [
	"Test data transfer and related methods"

	self testDataSending.
	"It can take a tad for the status change to be visible"
	(Delay forMilliseconds: 200) wait.
	self assert: serverSocket dataAvailable.
	self assert: (serverSocket receiveData = 'Hello World').
	self deny: (serverSocket dataAvailable).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>testDataSending [
	"Test data transfer and related methods"

	self testServerAccept.
	clientSocket sendData: 'Hello World'.
	clientSocket waitForSendDoneFor: 2.
	self assert: clientSocket sendDone.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>testLocalAddress [
	"Tests the various localAddress values for sockets"

	self testServerAccept.
	self assert: listenerSocket localAddress asSocketAddress = self listenerAddress.
	self assert: clientSocket localAddress asSocketAddress = self listenerAddress.
	self assert: serverSocket localAddress asSocketAddress = self listenerAddress.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>testLocalPort [
	"Tests the various localPort values for sockets"

	self testServerAccept.
	self assert: listenerSocket localPort = self listenerPort.
	self assert: clientSocket localPort > 0.
	self assert: serverSocket localPort > 0.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>testRemoteAddress [
	"Tests the various remoteAddress values for sockets"

	self testServerAccept.
	self assert: listenerSocket remoteAddress = #[0 0 0 0].
	self assert: clientSocket remoteAddress asSocketAddress = self listenerAddress.
	self assert: serverSocket remoteAddress asSocketAddress = self listenerAddress.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>testRemotePort [
	"Tests the various remoteAddress values for sockets"

	self testServerAccept.
	self assert: listenerSocket remotePort = 0.
	self assert: clientSocket remotePort = self listenerPort.
	self assert: serverSocket remotePort > 0.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>testServerAccept [
	"Tests a server-side accept"

	self testClientConnect.
	serverSocket := listenerSocket waitForAcceptFor: 2.
	self assert: (serverSocket notNil).
	self assert: (serverSocket isConnected).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>testUDPBroadcastError [
	"Test that we get a specific error when failure is due to sending to a broadcast address without SO_BROADCAST set"
	"Use 255.255.255.255 for testing, which in RFC 919 is defined as 'denoting a broadcast on a local hardware network, which must not be forwarded. 
	This address may be used, for example, by hosts that do not know their network number and are asking some server for it.'"

	self
		should: [ 
			Socket newUDP
				setOption: 'SO_BROADCAST' value: false;
				sendUDPData: #[] toHost: #[255 255 255 255] port: 1950 ]
		raise: NoBroadcastAllowed.
	self
		shouldnt: [ 
			Socket newUDP
				setOption: 'SO_BROADCAST' value: true;
				sendUDPData: #[] toHost: #[255 255 255 255] port: 1 ]
		raise: NoBroadcastAllowed
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SocketTest>>testUDPFaultySend [

	| socket host |
	
	socket := self faultyUDPSocket.	
	host := #[1 2 3 4].
	
	"Check that sending is not caught in a infinite loop"
	self should: [ 
		
		self 
			deny: (socket isBroadcastAddress: host);
			should: [socket sendUDPData: #[123] toHost: host port: 1 ] raise: NetworkError.
			
		host := #[ 255 255 255 255].
		
		self 
			assert: (socket isBroadcastAddress: host);
			should: [ socket sendUDPData: #[123] toHost: host port: 1 ] raise: NoBroadcastAllowed.
			
		socket setOption: 'SO_BROADCAST' value: true.
		
		self should: [ socket sendUDPData: #[123] toHost: host port: 1 ] raise: NetworkError.
		
	] notTakeMoreThanMilliseconds: 20 .

	socket destroy.
]
