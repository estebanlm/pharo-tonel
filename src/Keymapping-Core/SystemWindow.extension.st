Extension {
	#name : #SystemWindow
}

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
SystemWindow class>>buildShortcutsOn: aBuilder [
	<keymap>

	(aBuilder shortcut: #close)
		category: #WindowShortcuts
		default: PharoShortcuts current closeWindowShortcut
		do: [ :target | target closeWindowAction ]
		description: 'Close this window'.
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
SystemWindow>>closeWindowAction [
"closed by a shortcut action. 
 subclasses may overwrite this to do a different action (for example, cancel edits)"
	self close
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
SystemWindow>>initializeShortcuts: aKMDispatcher  [
	"Where we may attach keymaps or even on:do: local shortcuts if needed."

	super initializeShortcuts: aKMDispatcher.
	aKMDispatcher attachCategory: #WindowShortcuts	
]
