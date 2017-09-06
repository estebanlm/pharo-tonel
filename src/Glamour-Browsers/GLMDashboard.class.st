"

"
Class {
	#name : #GLMDashboard,
	#superclass : #GLMExplicitBrowser,
	#instVars : [
		'panesLayouts'
	],
	#category : #Glamour-Browsers-Dashboard,
	#timestamp : ''
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDashboard>>addPaneNamed: aString [
	self addNewPaneNamed: aString
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDashboard>>addPaneNamed: aSymbol layout: aLayout [
	self addPaneNamed: aSymbol.
	self panesLayouts at: aSymbol put: aLayout
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDashboard>>initializeScriptingDefaults [
	super initializeScriptingDefaults.
	self transmissions
		detect: [ :each | each originatesAt: (self pane port: #entity) ]
		ifNone: [ 
			self
				transmit to: (self panes first port: #entity);
				from: #outer port: #entity;
				andShow: [:a |  a custom: GLMFlexiblePresentation new ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDashboard>>layoutOfPaneNamed: aSymbol [
	^ self panesLayouts
		at: aSymbol
		ifAbsent:
			[ | index pas yTop yBot |
			"I think this can be clean a little but I don't have the time right now."
			index := (self panes collect: [ :e | e name ]) indexOf: aSymbol.
			pas := 1 / ((self panes size / 2) floor + 1).
			yTop := ((index / 2) rounded - 1) * pas.
			yBot := (index / 2) rounded * pas.
			(index = self panes size and: [ index odd ])
				ifTrue: [ ^ (0 @ yTop corner: 1 @ yBot) asLayoutFrame ].
			index odd
				ifTrue: [ (0 @ yTop corner: 0.5 @ yBot) asLayoutFrame ]
				ifFalse: [ (0.5 @ yTop corner: 1 @ yBot) asLayoutFrame ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDashboard>>panesLayouts [
	^ panesLayouts ifNil: [ panesLayouts := Dictionary new ]
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDashboard>>renderGlamorouslyOn: aRenderer  [
	 
	^aRenderer renderDashboard: self
]
