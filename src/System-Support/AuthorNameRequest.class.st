"
I am used to request a new author name.
"
Class {
	#name : #AuthorNameRequest,
	#superclass : #Notification,
	#instVars : [
		'initialAnswer'
	],
	#category : #System-Support,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
AuthorNameRequest class>>messagePrompt [
	^
'Please type your full name. 
It will be used to sign the changes you make to the image.
Spaces, accents, dashes, underscore and similar characters are not allowed
'
]

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:13'
}
AuthorNameRequest>>defaultAction [
	^ UIManager default
			request: self messagePrompt
			initialAnswer: initialAnswer
			title: 'Author identification'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
AuthorNameRequest>>initialAnswer [
	
	^ initialAnswer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
AuthorNameRequest>>initialAnswer: anObject [
	
	initialAnswer := anObject
]

{
	#category : #ui-requests,
	#timestamp : ' 8/31/2017 07:16:13'
}
AuthorNameRequest>>messagePrompt [
	^ self class messagePrompt
]
