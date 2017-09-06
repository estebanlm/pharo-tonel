Extension {
	#name : #TextLink
}

{
	#category : #'*Rubric-Editing-Core',
	#timestamp : ' 8/31/2017 05:26:20'
}
TextLink>>rubMayActOnEvent: anEvent [
	^ anEvent isMouseDown and: [ anEvent commandKeyPressed ]
]
