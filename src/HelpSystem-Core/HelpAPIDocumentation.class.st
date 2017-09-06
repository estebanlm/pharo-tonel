"
This class represents the browsable package API help for the help system.

Instance Variables

"
Class {
	#name : #HelpAPIDocumentation,
	#superclass : #HelpOnHelp,
	#category : #HelpSystem-Core-Help,
	#timestamp : 'tbn 4/30/2010 15:12'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpAPIDocumentation class>>bookName [
	^'API Documentation'
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpAPIDocumentation class>>builder [
	^PackageAPIHelpBuilder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpAPIDocumentation class>>helpPackages [
	^#('HelpSystem-Core-Model' 'HelpSystem-Core-Utilities' 'HelpSystem-Core-UI')
]
