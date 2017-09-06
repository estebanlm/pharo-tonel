Extension {
	#name : #TClass
}

{
	#category : #'*HelpSystem-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
TClass>>asHelpTopic [
	^SystemReference forClass: self
]
