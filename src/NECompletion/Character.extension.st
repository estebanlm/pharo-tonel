Extension {
	#name : #Character
}

{
	#category : #'*NECompletion',
	#timestamp : ' 8/31/2017 05:26:21'
}
Character>>isCompletionCharacter [
	^ self isAlphaNumeric or: [ self = $: ]
]
