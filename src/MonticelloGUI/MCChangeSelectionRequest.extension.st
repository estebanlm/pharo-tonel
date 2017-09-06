Extension {
	#name : #MCChangeSelectionRequest
}

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCChangeSelectionRequest>>defaultAction [
	^ (MCChangeSelector new patch: patch; label: label) showModally
]
