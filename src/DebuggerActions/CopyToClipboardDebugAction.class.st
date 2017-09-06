"
A CopyToClipboardDebugAction copies a short debugging stack to the clipboard.

"
Class {
	#name : #CopyToClipboardDebugAction,
	#superclass : #DebugAction,
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:17'
}
CopyToClipboardDebugAction class>>actionType [
	<contextMenuDebuggingAction>
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
CopyToClipboardDebugAction>>defaultLabel [

	^ 'Copy Stack to Clipboard'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
CopyToClipboardDebugAction>>defaultOrder [

	^ 120
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
CopyToClipboardDebugAction>>executeAction [

	Clipboard clipboardText: (String streamContents: [ :s| 
		self debugger interruptedContext shortDebugStackOn: s ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
CopyToClipboardDebugAction>>id [

	^ #copyToClipboard
]
