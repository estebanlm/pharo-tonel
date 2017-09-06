"
A GTDebuggerBrowserUpdateRequest is a wrapper for a DebugActionExecuted event. It is sent to the debugger after the DebugActionExecuted event was handled by the debugger.
"
Class {
	#name : #GTDebuggerBrowserUpdateRequest,
	#superclass : #Announcement,
	#instVars : [
		'debugActionExecutedAnnouncement'
	],
	#category : #GT-Debugger-UI,
	#timestamp : 'AndreiChis 3/29/2016 23:26'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerBrowserUpdateRequest class>>from: anAnnouncement [
	^ self new from: anAnnouncement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerBrowserUpdateRequest>>debugActionExecutedAnnouncement [
	^ debugActionExecutedAnnouncement
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerBrowserUpdateRequest>>from: anAnnouncement [
	debugActionExecutedAnnouncement := anAnnouncement
]
