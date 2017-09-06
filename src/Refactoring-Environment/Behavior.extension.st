Extension {
	#name : #Behavior
}

{
	#category : #'*Refactoring-Environment',
	#timestamp : ' 8/31/2017 05:26:25'
}
Behavior>>asEnvironment [
	^ RBClassEnvironment class: self
]
