"
ToolShortcuts defines some global keyboard shortcuts to open tools for workspaces, system browser, monticello browser, settings, transcript and also image saving. 
"
Class {
	#name : #ToolShortcutsCategory,
	#superclass : #KMCategory,
	#category : #Tool-Base,
	#timestamp : 'BenComan 2/17/2014 23:07'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ToolShortcutsCategory class>>isGlobalCategory [

	^ true 
]

{
	#category : #keymaps,
	#timestamp : ' 8/31/2017 05:26:18'
}
ToolShortcutsCategory>>openKomitter [
	<shortcut>
	^ KMKeymap shortcut: PharoShortcuts current openKomitterShortcut action: [ Komitter openAndCommitToMonticello ]
]

{
	#category : #keymaps,
	#timestamp : ' 8/31/2017 05:26:18'
}
ToolShortcutsCategory>>openMonticelloPackageBrowser [
	<shortcut>
	^ KMKeymap shortcut: PharoShortcuts current openMonticielloShortcut action: [ Smalltalk tools openMonticelloBrowser ]
]

{
	#category : #keymaps,
	#timestamp : ' 8/31/2017 05:26:18'
}
ToolShortcutsCategory>>openSettings [
	<shortcut>
	^ KMKeymap shortcut: PharoShortcuts current openSettingsShortcut action: [ SettingBrowser open ]
]

{
	#category : #keymaps,
	#timestamp : ' 8/31/2017 05:26:18'
}
ToolShortcutsCategory>>openSystemBrowser [
	<shortcut>
	^ KMKeymap shortcut: PharoShortcuts current openSystemBrowserShortcut action: [ Smalltalk tools openClassBrowser ]
]

{
	#category : #keymaps,
	#timestamp : ' 8/31/2017 05:26:18'
}
ToolShortcutsCategory>>openTranscript [
	<shortcut>
	^ KMKeymap shortcut: PharoShortcuts current openTranscriptShortcut action: [ Smalltalk tools openTranscript ]
]

{
	#category : #keymaps,
	#timestamp : ' 8/31/2017 05:26:18'
}
ToolShortcutsCategory>>openUnitTestRunner [
	<shortcut>
	^ KMKeymap shortcut: PharoShortcuts current openTestRunnerShortcut action: [ Smalltalk tools openTestRunner ]
]

{
	#category : #keymaps,
	#timestamp : ' 8/31/2017 05:26:18'
}
ToolShortcutsCategory>>openWorkspace [
	<shortcut>
	^ KMKeymap shortcut: PharoShortcuts current openPlaygroundShortcut action: [ Smalltalk tools workspace open ]
]

{
	#category : #keymaps,
	#timestamp : ' 8/31/2017 05:26:18'
}
ToolShortcutsCategory>>saveImage [
	<shortcut>
	^ KMKeymap
		shortcut: PharoShortcuts current saveImageShortcut
		action: [ 
			(Smalltalk snapshot: true andQuit: false)
				ifFalse: [ UIManager default inform: 'Image saved' ] ]
]
