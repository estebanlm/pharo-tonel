"
This is a custom help book providing the API documentation for the regular expression framework.

"
Class {
	#name : #RegexAPIDocumentation,
	#superclass : #RegexHelp,
	#category : #Regex-Help,
	#timestamp : 'Tbn 11/12/2010 22:56'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RegexAPIDocumentation class>>bookName [
	^'API Documentation'
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:25'
}
RegexAPIDocumentation class>>builder [
	^PackageAPIHelpBuilder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RegexAPIDocumentation class>>helpPackages [
	^#('Regex-Core' 'Regex-Core-Exceptions' 'Regex-Tests-Core')
]
