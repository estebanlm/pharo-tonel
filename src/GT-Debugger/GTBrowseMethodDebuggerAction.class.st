"
I am a debugging action for browsing the currently selected class.
"
Class {
	#name : #GTBrowseMethodDebuggerAction,
	#superclass : #DebugAction,
	#category : #GT-Debugger-Actions,
	#timestamp : 'AndreiChis 12/30/2015 11:17'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowseMethodDebuggerAction class>>gtActionFor: aDebugger [
	<gtCodeDebuggingAction>
	
	^ (self forDebugger: aDebugger)
			icon: GLMUIThemeExtraIcons glamorousBrowse
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowseMethodDebuggerAction>>defaultLabel [

	^ 'Browse'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowseMethodDebuggerAction>>defaultOrder [

	^ 220
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowseMethodDebuggerAction>>executeAction [
	Smalltalk tools browser 
	openOnClass: self debugger selectedContext methodClass
 	selector: self debugger selectedContext selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowseMethodDebuggerAction>>id [

	^ #gtBrowseMethodDebuggerAction
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowseMethodDebuggerAction>>initialize [
	super initialize.
	self needsUpdate: false
]
