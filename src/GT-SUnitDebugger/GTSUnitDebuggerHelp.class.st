"
A utility class containing the help for GT SUnitDebugger.
"
Class {
	#name : #GTSUnitDebuggerHelp,
	#superclass : #GTDebuggerHelp,
	#category : #GT-SUnitDebugger,
	#timestamp : 'AndreiChis 1/25/2016 10:14'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebuggerHelp class>>bookName  [
	^'SUnit'
]

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebuggerHelp class>>overview [
	^ HelpTopic 
		title: 'Overview'
		contents: 
'GT SUnit is an extension for GT Debugger providing support for debugging tests.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebuggerHelp class>>pages [
	^#(overview actions)
]
