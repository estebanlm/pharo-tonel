"
This action is responsible for inspecting a selected piece of code from the code pane of the debugger.
"
Class {
	#name : #GTInspectSelectionDebugAction,
	#superclass : #GTCodeDebugAction,
	#instVars : [
		'shouldBasicInspect'
	],
	#category : #GT-Debugger-Actions,
	#timestamp : 'TudorGirba 1/10/2016 23:42'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTInspectSelectionDebugAction class>>gtActionFor: aDebugger [
	"<gtContextCodeDebuggingAction>"
	
	^ (self forDebugger: aDebugger)
			icon: GLMUIThemeExtraIcons glamorousInspect
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTInspectSelectionDebugAction class>>gtBasicInspectActionFor: aDebugger [
	"<gtContextCodeDebuggingAction>"
	
	^ (self forDebugger: aDebugger)
			makeBasicInspect;
			label: 'Basic inspect it';
			keymap: $i meta shift; 
			order: 16;
			icon: GLMUIThemeExtraIcons glamorousInspect
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTInspectSelectionDebugAction>>defaultKeymap [

	^ PharoShortcuts current inspectItShortcut 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTInspectSelectionDebugAction>>defaultLabel [

	^ 'Inspect it'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTInspectSelectionDebugAction>>defaultOrder [

	^ 15
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTInspectSelectionDebugAction>>executeAction [
	
	self codePresentation evaluateSelectionAndDo: [ :result |
		shouldBasicInspect 
			ifTrue: [ result basicInspect ]
			ifFalse: [ result inspect ] ]
		

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTInspectSelectionDebugAction>>id [

	^ #gTInspectSelectionDebugAction
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTInspectSelectionDebugAction>>initialize [
	super initialize.
	self needsUpdate: false.
	shouldBasicInspect := false
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTInspectSelectionDebugAction>>makeBasicInspect [

	shouldBasicInspect := true
]
