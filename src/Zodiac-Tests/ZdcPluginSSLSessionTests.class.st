"
ZdcPluginSSLSession Tests tests ZdcPluginSSLSession.

"
Class {
	#name : #ZdcPluginSSLSessionTests,
	#superclass : #TestCase,
	#instVars : [
		'session'
	],
	#category : #Zodiac-Tests,
	#timestamp : 'HenrikNergaard 3/27/2017 09:23'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZdcPluginSSLSessionTests>>setUp [

	session := ZdcPluginSSLSession new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZdcPluginSSLSessionTests>>tearDown [

	session destroy.
	session := nil.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZdcPluginSSLSessionTests>>testCertificateName [
	
	self assert: session certificateName equals: nil.
	
	session certificateName: 'myCert.pem'.
	
	self assert: session certificateName equals: 'myCert.pem'.
	
	session certificateName: 'otherCert.pem'.
	
	self assert: session certificateName equals: 'otherCert.pem'.
	
	session certificateName: nil.
	
	self assert: session certificateName equals: nil.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZdcPluginSSLSessionTests>>testServerName [
	
	[ session serverName ] on: PrimitiveFailed do: [ self skip ].
	
	self assert: session serverName equals: nil.
	
	session serverName: 'pharo.org'.
	
	self assert: session serverName equals: 'pharo.org'.
	
	session serverName: 'smalltalkhub.com'.
	
	self assert: session serverName equals: 'smalltalkhub.com'.
	
	session serverName: nil.
	
	self assert: session serverName equals: nil.

]
