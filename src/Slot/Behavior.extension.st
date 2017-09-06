Extension {
	#name : #Behavior
}

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
Behavior>>classLayout [
	^ layout
		ifNil: [ 
			| superLayout scope |
			superLayout := superclass classLayout.
			scope := superLayout slotScope extend.
			layout := superLayout class extending: superLayout scope: scope host: self ]
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
Behavior>>classLayout: aClassLayout [
	layout := aClassLayout
]
