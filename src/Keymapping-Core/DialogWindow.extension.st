Extension {
	#name : #DialogWindow
}

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
DialogWindow>>closeWindowAction [
"closed by keyboard shortcut - act like 'cancel' "
	self cancel
]
