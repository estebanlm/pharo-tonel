Extension {
	#name : #Object
}

{
	#category : #'*System-Support',
	#timestamp : ' 8/31/2017 07:16:13'
}
Object class>>registerToolsOn: aToolRegistry [

	" Override to register any tools for Smalltalk tools registry. " 
]

{
	#category : #'*System-Support',
	#timestamp : ' 8/31/2017 07:16:13'
}
Object>>systemNavigation [

	^ SystemNavigation new
]
