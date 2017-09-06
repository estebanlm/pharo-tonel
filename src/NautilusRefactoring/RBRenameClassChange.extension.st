Extension {
	#name : #RBRenameClassChange
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenameClassChange>>nameToDisplay [

	^ self printString
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenameClassChange>>oldVersionTextToDisplay [
	^ String streamContents: [ :s | 
			self changes do: [ :c | 	s << c oldVersionTextToDisplay; cr ]]

]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenameClassChange>>textToDisplay [
	^ String streamContents: [ :s | 
         s << self printString ; cr.
         self changes do: [ :c | 	s << c textToDisplay; cr ]]

]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenameClassChange>>whatToDisplayIn: aChangeBrowser [
	^ { self }
	
]
