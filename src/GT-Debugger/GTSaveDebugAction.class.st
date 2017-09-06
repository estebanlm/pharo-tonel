"
This debugger action is responsible for saving the current method from a debugger.
"
Class {
	#name : #GTSaveDebugAction,
	#superclass : #GTCodeDebugAction,
	#category : #GT-Debugger-Actions,
	#timestamp : 'TudorGirba 1/10/2016 23:39'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSaveDebugAction class>>gtActionFor: aDebugger [
	<gtContextCodeDebuggingAction>
	
	^ (self forDebugger: aDebugger)
			icon: GLMUIThemeExtraIcons glamorousAccept
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSaveDebugAction>>defaultKeymap [

	^ PharoShortcuts current acceptShortcut
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSaveDebugAction>>defaultLabel [

	^ 'Accept'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSaveDebugAction>>defaultOrder [

	^ 250
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSaveDebugAction>>executeAction [

	self needsUpdate: false.
	self codePresentation hasUnacceptedEdits 
		ifTrue: [
			self codePresentation 
				compileTextIn: self currentContext 
				from: self session 
				andDo: [ self needsUpdate: true ] ].
	self codePresentation flash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSaveDebugAction>>id [

	^ #gTSaveDebugAction
]
