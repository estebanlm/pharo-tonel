Extension {
	#name : #Form
}

{
	#category : #'*Athens-Core',
	#timestamp : ' 8/31/2017 05:26:26'
}
Form>>asAthensPaintOn: canvas  [

	^ canvas surface createFormPaint: self
]
