"
I'm in charge to style an ast when there are semantic warnings
"
Class {
	#name : #SemanticWarningIconStyler,
	#superclass : #IconStyler,
	#category : #Reflectivity-Tools-Breakpoints,
	#timestamp : 'johanfabry 11/27/2015 11:55'
}

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
SemanticWarningIconStyler>>highlightColor [
	^(Color yellow alpha: 0.3)
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
SemanticWarningIconStyler>>iconFor: aNode [
	^self iconNamed: #flag.
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
SemanticWarningIconStyler>>iconLabel: aNode [
	^'Semantic warning: ', (aNode propertyAt: #semanticWarning) asString
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SemanticWarningIconStyler>>shouldStyleNode: aNode [
	^aNode hasProperty: #semanticWarning
]
