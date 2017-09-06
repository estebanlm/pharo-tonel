"
This is a specialized inspector that is embedded in  GTDebugger.

It is special in two ways:
- the first presentation is different in that it shows all variables active in the debugging context
- the looking up of presentation ignores the default state presentation because the vertical splitting of state and workspace does not work in the context of the debugger due to space limitations. Instead, the workspace is offered in a separate presentation.
"
Class {
	#name : #GTDebuggerInspector,
	#superclass : #GTInspector,
	#instVars : [
		'debugger',
		'notifyPaneRemoved'
	],
	#category : #GT-Debugger-UI,
	#timestamp : 'AndreiChis 12/30/2015 10:03'
}

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerInspector>>actOnPaneAdded: ann [

	(self panes atLast: 2 ifAbsent: [ ^ self ])
		presentations first updateToolbar
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerInspector>>actOnPaneRemoved: anAnnouncement [

	self panes last presentations first updateToolbar.
	self notifyPaneRemoved ifTrue: [ 
		self debugger announce: anAnnouncement ]
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerInspector>>attachExtraBehaviourToPresentationsIn: aComposite [

	aComposite presentations do: [ :aPresentation |
		aPresentation addAction: 
			((self closeActionFor: aPresentation)
				condition: [ :currentPresentation |
					self panes size > 1 and: [ 
						self isPresentation: aPresentation inPane: self panes last  ] ] ) ]
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerInspector>>compose [
	self pager
		minimumPageNumberForScrollbar: 2; 
		show: [ :a :each | 
			a dynamic display: [ :x | 
				(GLMCompositePresentation new with: [ :aComposite | 
					each gtDebuggerPresentationsIn: aComposite inContext: self.
					self attachExtraBehaviourToPresentationsIn: aComposite.
					aComposite ])
						startOn: x ] ].
	self first when: GLMPaneAdded send: #actOnPaneAdded: to: self.
	self first when: GLMPaneRemoved send: #actOnPaneRemoved: to: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerInspector>>debugger [
	^ debugger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerInspector>>debugger: anObject [
	debugger := anObject
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerInspector>>isPresentation: aPresentation inPane: aPane [
	^ aPane presentations first cachedPresentation 
		ifNil: [ false ] 
		ifNotNil: [ :aCachedPresentation | aCachedPresentation first includes: aPresentation ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerInspector>>notifyPaneRemoved [
	^ notifyPaneRemoved ifNil: [ false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerInspector>>notifyPaneRemoved: anObject [
	notifyPaneRemoved := anObject
]
