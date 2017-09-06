"
I represent a ZnServer that is used for testing purpose. 

I know how to start ZnServer that is started on a random port. For that reason I keep right URL that you can use sending #url message. 

"
Class {
	#name : #GTEventRecorderTestServer,
	#superclass : #Object,
	#instVars : [
		'server',
		'url'
	],
	#category : #GT-EventRecorder-Tests-Core,
	#timestamp : 'JurajKubelka 11/15/2015 17:50'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventRecorderTestServer>>initializeUsingDelegate: aDelegate semaphore: aSemaphore [
	| subscription |
	server := ZnServer on: 0.
	server delegate: aDelegate.
	server route: UUID new asString.
	subscription := ZnLogEvent announcer 
							when: ZnServerSocketBoundEvent 
							do: [ :announcement | announcement serverId = server route 
										ifTrue: [ aSemaphore signal ] ]
							for: self.
	server start.
	[ (aSemaphore waitTimeoutMSecs: 200) not ] assert.
	ZnLogEvent announcer removeSubscription: subscription.
	url := ZnUrl new
		scheme: #http;
		host: NetNameResolver loopBackName;
		port: server serverSocket port;
		yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventRecorderTestServer>>server [
	^ server
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventRecorderTestServer>>stop [
	server stop
]

{
	#category : #subscription,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventRecorderTestServer>>unsubscribeAll [
	ZnLogEvent announcer unsubscribe: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventRecorderTestServer>>url [
	^ url
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventRecorderTestServer>>when: anAnnouncement do: aBlock [
	"Subscribe myself for events that belongs to my ZnServer."
	^ ZnLogEvent announcer 
			when: anAnnouncement 
			do: [ :announcement | announcement serverId = server route ifTrue: [ aBlock cull: announcement ] ]
			for: self.
]
