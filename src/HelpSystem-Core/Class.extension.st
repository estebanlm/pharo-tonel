Extension {
	#name : #Class
}

{
	#category : #'*HelpSystem-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Class>>asHelpTopic [
	^SystemReference forClass: self
]
