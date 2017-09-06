Extension {
	#name : #Model
}

{
	#category : #'*Tool-Base',
	#timestamp : ' 8/31/2017 05:26:18'
}
Model>>containingWindow [
	"Answer the window that holds the receiver. The dependents technique is
	odious and may not be airtight, if multiple windows have the same
	model. "
	^ self dependents
		detect: [:d | (d isSystemWindow)
				and: [d model == self]]
		ifNone: []
]
