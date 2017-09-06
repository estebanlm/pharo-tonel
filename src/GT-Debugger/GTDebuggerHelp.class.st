"
A utility class containing the help for GT Debugger.

Customs debuggers that want to provide a help topic should create a subclass and override GTMoldableDebugger class>>#helpClass.

I dynamically build and display  the list of actions  available for a debugger.
"
Class {
	#name : #GTDebuggerHelp,
	#superclass : #CustomHelp,
	#category : #GT-Debugger-Model,
	#timestamp : 'AndreiChis 1/25/2016 11:07'
}

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerHelp class>>actions [
		
	^ HelpTopic 
		title: 'Actions'
		contents: 'TODO'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerHelp class>>bookName  [
	^'GT Debugger'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerHelp class>>key [
	^ self name
]

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerHelp class>>overview [
	^ HelpTopic 
		title: 'Overview'
		contents: 
'GT Debugger is a moldable debugger that is part of Pharo and was developed as part of the Glamorous Toolkit project (http://gt.moosetechnology.org)'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerHelp class>>pages [
	^#(overview actions)
]
