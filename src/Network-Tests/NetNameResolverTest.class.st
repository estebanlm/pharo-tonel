"
SUnit tests for NetNameResolver 
"
Class {
	#name : #NetNameResolverTest,
	#superclass : #TestCase,
	#category : #Network-Tests-Kernel,
	#timestamp : 'TorstenBergmann 2/5/2014 10:12'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:29'
}
NetNameResolverTest>>localHostAddressIsLoopBackAddress [
		^NetNameResolver localHostAddress = NetNameResolver loopBackAddress
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:29'
}
NetNameResolverTest>>localHostNameIsLoopBackName [
		^NetNameResolver localHostName = NetNameResolver loopBackName
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
NetNameResolverTest>>testLocalHostAddress [
	NetNameResolver isConnected
		ifTrue: [self deny: self localHostAddressIsLoopBackAddress]
		ifFalse: [self assert: self localHostAddressIsLoopBackAddress]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
NetNameResolverTest>>testLocalHostName [
	self deny: NetNameResolver localHostName isNil.
	NetNameResolver isConnected
		ifTrue: [self deny: self localHostNameIsLoopBackName]
		ifFalse: [self assert: self localHostNameIsLoopBackName]
]
