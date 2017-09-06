Extension {
	#name : #PasteUpMorph
}

{
	#category : #'*Morphic-Widgets-Taskbar',
	#timestamp : ' 8/31/2017 05:26:15'
}
PasteUpMorph>>createTaskbarIfNecessary [
	"Private - create a new taskbar if not present."

	self taskbars ifEmpty: [
		TaskbarMorph new openInWorld: self.
		self moveCollapsedWindowsToTaskbar]
]

{
	#category : #'*Morphic-Widgets-Taskbar',
	#timestamp : ' 8/31/2017 05:26:15'
}
PasteUpMorph>>moveCollapsedWindowsToTaskbar [
	"Move collapsed windows to the taskbar."
	
	(self systemWindows select: [:w | w isCollapsed]) do: [:w |
		w restore; minimize]
]

{
	#category : #'*Morphic-Widgets-Taskbar',
	#timestamp : ' 8/31/2017 05:26:15'
}
PasteUpMorph>>removeTaskbar [
	"Remove the receiver's taskbars."
	
	self taskbars do: [:each | each removeFromWorld]
]

{
	#category : #'*Morphic-Widgets-Taskbar',
	#timestamp : ' 8/31/2017 05:26:15'
}
PasteUpMorph>>showWorldTaskbar: aBoolean [
	"Change the receiver to show the taskbar."
	
	aBoolean
		ifTrue: [self createTaskbarIfNecessary]
		ifFalse: [self removeTaskbar]
]

{
	#category : #'*Morphic-Widgets-Taskbar',
	#timestamp : ' 8/31/2017 05:26:15'
}
PasteUpMorph>>taskList [

	^ self submorphs
		detect: [ :e | e isKindOf: TaskListMorph ]
		ifNone: [ NullTaskList in: self ].
]
