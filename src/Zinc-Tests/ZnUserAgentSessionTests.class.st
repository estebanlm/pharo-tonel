"

"
Class {
	#name : #ZnUserAgentSessionTests,
	#superclass : #TestCase,
	#category : #Zinc-Tests,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnUserAgentSessionTests>>dummyCredential [
	^ZnBasicCredential new 
		username: 'test'; 
		password: 'foobar';
		realm: 'dummy';
		domain: 'test.com';
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnUserAgentSessionTests>>testAccessors [
	| session |
	session := ZnUserAgentSession new.
	self assert: (session cookieJar isKindOf: ZnCookieJar).
	self assert: (session credentials notNil)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnUserAgentSessionTests>>testAddCredential [
	| session count |
	session := ZnUserAgentSession new.
	count := session credentials size.
	session addCredential: self dummyCredential.
	self assert: ((session credentials size) = (count + 1))
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnUserAgentSessionTests>>testWithCookieJar [
	self assert: ((ZnUserAgentSession withCookieJar: ZnCookieJar new) notNil)
]
