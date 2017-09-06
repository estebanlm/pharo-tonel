"
A utility class containing the help for GT BytecodeDebugger.
"
Class {
	#name : #GTBytecodeDebuggerHelp,
	#superclass : #GTDebuggerHelp,
	#category : #GT-BytecodeDebugger-Model,
	#timestamp : 'AndreiChis 1/25/2016 10:14'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebuggerHelp class>>bookName  [
	^'Bytecode'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebuggerHelp class>>overview [
	^ HelpTopic 
		title: 'Overview'
		contents: 
'GT Bytecode is an extension for GT Debugger providing support for stepping through bytecode instructions.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebuggerHelp class>>pages [
	^#(overview actions)
]
