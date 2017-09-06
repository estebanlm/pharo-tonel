"
This debugger action is responsible for reselecting the code corresponding with the current instruction to be executed.
"
Class {
	#name : #GTWhereIsDebugAction,
	#superclass : #WhereIsDebugAction,
	#category : #GT-Debugger-Actions,
	#timestamp : 'TudorGirba 1/10/2016 23:39'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTWhereIsDebugAction class>>gtActionFor: aDebugger [
	<gtCodeDebuggingAction>
	
	^ (self forDebugger: aDebugger)
			icon: GLMUIThemeExtraIcons glamorousSearch
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTWhereIsDebugAction>>defaultOrder [

	^ 200
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTWhereIsDebugAction>>executeAction [

	self debugger updateSelectionInterval
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTWhereIsDebugAction>>id [

	^ #gtWhereIs
]
