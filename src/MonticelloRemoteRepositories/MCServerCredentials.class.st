"
I store a username and password.

"
Class {
	#name : #MCServerCredentials,
	#superclass : #Object,
	#instVars : [
		'username',
		'password'
	],
	#category : #MonticelloRemoteRepositories,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
MCServerCredentials class>>user: nameString password: passwordString [

	^ self new
			username: nameString;
			password: passwordString;
			yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCServerCredentials>>password [

	^ password.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCServerCredentials>>password: aString  [

	password := aString.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCServerCredentials>>username [

	^ username.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCServerCredentials>>username: aString  [

	username := aString.
]
