"
Welcome to Pharo Smalltalk Help System
"
Class {
	#name : #HelpOnHelp,
	#superclass : #CustomHelp,
	#category : #HelpSystem-Core-Help,
	#timestamp : 'tbn 2/12/2010 14:27'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpOnHelp class>>bookName [
	^'Help on Help'
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpOnHelp class>>introduction [
	"This method was automatically generated. Edit it using:"
	"HelpOnHelp edit: #introduction"
	^HelpTopic
		title: 'Introduction'
		contents: 
'WELCOME TO THE HELP SYSTEM

The help system is a simple user interface to display help contents to the user. It can be accessed from the world menu using "Tools" -> "Help Browser" or by evaluating ''HelpBrowser open'' in a workspace.

There is a predefined mechanism allowing you to have help contents stored as source code using methods in specific help provider classes. This allows to manage the help texts using the standard development tools. But this is only one possible representation.

!' readStream nextChunkText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpOnHelp class>>key [
	^'HelpOnHelp'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpOnHelp class>>pages [
	^#(introduction HelpHowToHelpTopics HelpAPIDocumentation)
]
