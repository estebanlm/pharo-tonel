"
I am a context that know how to work with 
a basic  Workspace.
"
Class {
	#name : #SugsWorkspaceContext,
	#superclass : #SugsAbstractContext,
	#category : #SmartSuggestions-Menu,
	#timestamp : 'NicolaiHess 1/23/2016 23:44'
}

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsWorkspaceContext>>selectedClass [
	^model selectedClassOrMetaClass
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsWorkspaceContext>>selectedMethod [
	^ model selectedMethod.
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsWorkspaceContext>>sourceTextArea [
	^ model sourceTextArea
]
