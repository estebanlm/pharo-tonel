"
This action is responsible for evaluating the selection in a code pane of a debugger and pushing the result in the inspector of the debugger.
"
Class {
	#name : #GTSelectionGoDebugAction,
	#superclass : #GTCodeDebugAction,
	#category : #GT-Debugger-Actions,
	#timestamp : 'TudorGirba 1/10/2016 23:41'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSelectionGoDebugAction class>>gtActionFor: aDebugger [
	<gtContextCodeDebuggingAction>
	
	^ (self forDebugger: aDebugger)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSelectionGoDebugAction>>defaultKeymap [

	^ $g meta
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSelectionGoDebugAction>>defaultLabel [

	^ 'Do it and go'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSelectionGoDebugAction>>defaultOrder [

	^ 5
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSelectionGoDebugAction>>executeAction [
	
	self codePresentation 
		evaluateSelectionAndDo: [ :result | self debugger inspect: result ] 
		

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSelectionGoDebugAction>>id [

	^ #gTOpenSelectionDebugAction
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSelectionGoDebugAction>>initialize [
	super initialize.
	self needsUpdate: false
]
