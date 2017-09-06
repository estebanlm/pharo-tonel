Extension {
	#name : #FinderUI
}

{
	#category : #'*necompletion',
	#timestamp : ' 8/31/2017 05:26:21'
}
FinderUI>>guessTypeForName: aString  [
 
	self flag: 'we may be able to do something more sophisticated here, but needed something to prevent a DNU. Returning nil was taken from AbstractTool. See Debugger or Workspace for actual guessing logic'.
	^ nil.
]

{
	#category : #'*necompletion',
	#timestamp : ' 8/31/2017 05:26:21'
}
FinderUI>>isCodeCompletionAllowed [

	^ true
]

{
	#category : #'*necompletion',
	#timestamp : ' 8/31/2017 05:26:21'
}
FinderUI>>selectedClassOrMetaClass [

	^ self selectedClass
]
