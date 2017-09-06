Extension {
	#name : #SimpleServiceEntry
}

{
	#category : #'*Tool-FileList',
	#timestamp : ' 8/31/2017 05:26:25'
}
SimpleServiceEntry>>addServiceFor: served toMenu: aMenu [
	aMenu 
		add: self label 
		target: self 
		selector: #performServiceFor: 
		argument: served.
	self usingLineAfter ifTrue: [ aMenu addLine ].
]
