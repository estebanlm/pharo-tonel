Extension {
	#name : #Symbol
}

{
	#category : #'*System-Support',
	#timestamp : ' 8/31/2017 07:16:13'
}
Symbol>>implementors [
	^SystemNavigation new allImplementorsOf: self
]

{
	#category : #'*System-Support',
	#timestamp : ' 8/31/2017 07:16:13'
}
Symbol>>senders [
	^SystemNavigation new allSendersOf: self
]
