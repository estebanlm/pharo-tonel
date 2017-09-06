Extension {
	#name : #TextMethodLink
}

{
	#category : #'*Rubric-Editing-Core',
	#timestamp : ' 8/31/2017 05:26:20'
}
TextMethodLink>>rubActOnClick: anEvent for: target in: aParagraph editor: anEditor [
	self flag: 'TODO: complete implementation with class'.
	
	browseSenders == anEvent shiftPressed
		ifTrue: [ anEditor editor implementorsOf: self selector ]
		ifFalse: [ anEditor editor sendersOf: self selector ].
		
	^ true
]

{
	#category : #'*Rubric-Editing-Core',
	#timestamp : ' 8/31/2017 05:26:20'
}
TextMethodLink>>rubMayActOnEvent: anEvent [
	^ anEvent isMouseMove or: [ anEvent isMouseDown and: [ anEvent commandKeyPressed ] ]
]
