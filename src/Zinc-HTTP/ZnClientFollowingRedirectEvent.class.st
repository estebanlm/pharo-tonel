"
ZnClientFollowingRedirectEvent signals that a redirect to target is being followed. How many redirects to follow, if any is configurable.
"
Class {
	#name : #ZnClientFollowingRedirectEvent,
	#superclass : #ZnClientLogEvent,
	#instVars : [
		'target'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 14:34'
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientFollowingRedirectEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Following Redirect '; print: target
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientFollowingRedirectEvent>>target [
	^ target
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientFollowingRedirectEvent>>target: anObject [
	target := anObject
]
