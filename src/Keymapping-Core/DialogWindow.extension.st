Extension { #name : #DialogWindow }

{ #category : #'*Keymapping-Core' }
DialogWindow >> closeWindowAction [
"closed by keyboard shortcut - act like 'cancel' "
	self cancel
]
