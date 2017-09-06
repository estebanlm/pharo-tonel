"
I open a HelpBrowser for the currently active debugger.

To specify a help topic a debugger has to override the class side method #helpClass.
"
Class {
	#name : #GTHelpDebugAction,
	#superclass : #DebugAction,
	#category : #GT-Debugger-Actions,
	#timestamp : 'AndreiChis 1/25/2016 11:04'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTHelpDebugAction class>>gtDebuggingAction [
	"<gtDebuggingAction>"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTHelpDebugAction>>defaultIcon [

	^ GLMUIThemeExtraIcons glamorousHelp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTHelpDebugAction>>defaultLabel [

	^ ''
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTHelpDebugAction>>defaultOrder [

	^ 200
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTHelpDebugAction>>executeAction [

	HelpBrowser open selectTopicSatisfying: [:each | 
		each owner notNil and:  [
			(each owner key = self debugger class helpClass key) and: [
				each title = 'Overview' ] ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTHelpDebugAction>>initialize [
	super initialize.
	self needsUpdate: false
]
