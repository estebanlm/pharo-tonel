Extension {
	#name : #Canvas
}

{
	#category : #'*Rubric-Editing-Core',
	#timestamp : ' 8/31/2017 05:26:20'
}
Canvas>>rubParagraph: paragraph bounds: bounds color: c [
	"Draw the given paragraph"
	^self subclassResponsibility
]
