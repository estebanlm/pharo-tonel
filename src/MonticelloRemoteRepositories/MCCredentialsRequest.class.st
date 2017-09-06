"
I am used to prompt in a UI indepentent way for a username and a password.
If the user successfully entered the two strings I return an MCServerCredential if not I return nil.
"
Class {
	#name : #MCCredentialsRequest,
	#superclass : #Notification,
	#instVars : [
		'username',
		'password',
		'url'
	],
	#category : #MonticelloRemoteRepositories,
	#timestamp : '<historical>'
}

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCCredentialsRequest class>>signalUrl: aUrl [
	^ self new 
		url: aUrl;
		signal
]

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCCredentialsRequest class>>signalUrl: aUrl username: username password: password [
	^ self new 
		url: aUrl;
		username: username;
		password: password;
		signal
]

{
	#category : #exceptiondescription,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCCredentialsRequest>>defaultAction [
	
	username := UIManager default
			request: self userMessagePrompt
			initialAnswer: self username
			title: 'User' translated.
	(username isNil or: [ username isEmpty ])
		ifTrue: [ ^ nil ].
	password := UIManager default
			requestPassword: self passwordMessagePrompt.
	^ MCServerCredentials user: username password: password
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCCredentialsRequest>>password [
	^ password
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCCredentialsRequest>>password: anObject [
	password := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCCredentialsRequest>>passwordMessagePrompt [
	^ 'Please enter a password for ', self url asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCCredentialsRequest>>url [
	^ url
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCCredentialsRequest>>url: anObject [
	url := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCCredentialsRequest>>userMessagePrompt [
	^ 'Please enter a username for ', self url asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCCredentialsRequest>>username [
	^ username
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCCredentialsRequest>>username: anObject [
	username := anObject
]
