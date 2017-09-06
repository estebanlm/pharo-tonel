"
I am a simple UI used to set the credentials of a remote
"
Class {
	#name : #CredentialEditor,
	#superclass : #ComposableModel,
	#instVars : [
		'username',
		'usernameLabel',
		'password',
		'passwordLabel',
		'showPassword'
	],
	#category : #Komitter-Support,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor class>>defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :col |
			col 
				newRow: [ :r | r add: #usernameLabel width: 80; add: #username ] height: self inputTextHeight;
				newRow: [ :r | r add: #passwordLabel width: 80; add: #password ] height: self inputTextHeight + 4;
				newRow: [ :r | r add: #showPasswordWidget width: 120; newColumn: [ :c | ] ] height: self inputTextHeight + 4;
				newRow: [ :r | ]
		];
	yourself
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor>>getPassword [

	^ password text
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor>>getUsername [
	
	^ username text
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor>>initialExtent [

	^ 400@180
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor>>initializeDialogWindow: aWindow [

	self 
		bindKeyCombination: $m meta 
		toAction: [ aWindow triggerOkAction ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor>>initializePresenter [

	showPassword 
		whenActivatedDo: [ password beDecrypted ];
		whenDeactivatedDo: [ password beEncrypted ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor>>initializeWidgets [

	username := self newTextInput.
	usernameLabel := self newLabel.
	
	password := self newTextInput.
	passwordLabel := self newLabel.
	
	showPassword := self newCheckBox.
	
	usernameLabel label: 'Username'.
	passwordLabel label: 'Password'.
	
	password
		ghostText: '*****';
		autoAccept: true;
		beEncrypted.
		
	username 
		ghostText: 'John Doe';
		autoAccept: true.
		
	showPassword	
		label: 'Show password'.
		
	self focusOrder
		add: username;
		add: password;
		add: showPassword.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor>>password [
	^ password
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor>>passwordLabel [
	^ passwordLabel
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor>>setPassword: aPassword [

	password text: aPassword
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor>>setUsername: aName [

	username text: aName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor>>showPasswordWidget [
	^ showPassword
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor>>title [

	^ 'Edit credentials'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor>>username [
	^ username
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
CredentialEditor>>usernameLabel [
	^ usernameLabel
]
