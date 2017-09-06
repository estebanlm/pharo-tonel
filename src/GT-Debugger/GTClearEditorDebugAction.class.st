"
This action is responsible for canceling/clearing the changes in a code editor from a debugger.
"
Class {
	#name : #GTClearEditorDebugAction,
	#superclass : #DebugAction,
	#category : #GT-Debugger-Actions,
	#timestamp : 'TudorGirba 1/10/2016 23:38'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTClearEditorDebugAction class>>gtActionFor: aDebugger [
	<gtContextCodeDebuggingAction>
	
	^ (self forDebugger: aDebugger)
		icon: GLMUIThemeExtraIcons glamorousCancel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTClearEditorDebugAction>>defaultIcon [

	^ nil
	"^ Smalltalk ui icons smallCancelIcon"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTClearEditorDebugAction>>defaultKeymap [

	^ PharoShortcuts current cancelShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTClearEditorDebugAction>>defaultLabel [

	^ 'Cancel'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTClearEditorDebugAction>>defaultOrder [

	^ 260
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTClearEditorDebugAction>>executeAction [

	self debugger codePresentation hasUnacceptedEdits ifTrue: [  
		self debugger codePresentation clearUserEdits.
		self debugger updateCodeEditor ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTClearEditorDebugAction>>id [

	^ #gtClearEditorDebugAction
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTClearEditorDebugAction>>initialize [
	super initialize.
	self needsUpdate: false
]
