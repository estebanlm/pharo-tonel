"
I am ZnBasicCredential, a concrete subclass of ZnCredential.
I implement basic HTTP authentication.
I hold a username and password.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnBasicCredential,
	#superclass : #ZnCredential,
	#instVars : [
		'username',
		'password'
	],
	#category : #Zinc-HTTP-Support,
	#timestamp : 'SvenVanCaekenberghe 12/6/2010 12:58'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicCredential class>>authName [
	^ 'Basic'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicCredential>>authTokenForUrl: urlObject method: method [
	^ 'Basic ', (ZnUtils encodeBase64: (username, ':', password)) 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicCredential>>isComplete [
	^ username notNil & password notNil 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicCredential>>password [
	^ password
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicCredential>>password: anObject [
	password := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicCredential>>username [
	^ username
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicCredential>>username: anObject [
	username := anObject
]
