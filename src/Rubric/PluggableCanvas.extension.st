Extension {
	#name : #PluggableCanvas
}

{
	#category : #'*Rubric-Editing-Core',
	#timestamp : ' 8/31/2017 05:26:20'
}
PluggableCanvas>>rubParagraph: paragraph bounds: bounds color: color [
	self apply: [ :c |
		c paragraph: paragraph bounds: bounds color: color ]
]
