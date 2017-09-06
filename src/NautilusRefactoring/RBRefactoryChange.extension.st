Extension {
	#name : #RBRefactoryChange
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefactoryChange>>accept: aText notifying: aController [
	^ false
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefactoryChange>>nameToDisplay [

	^ self name
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefactoryChange>>oldVersionTextToDisplay [

	^ ''
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefactoryChange>>textToDisplay [

	^ self name
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefactoryChange>>whatToDisplayIn: aChangeBrowser [

	^ { self }
]
