Extension {
	#name : #IdentitySet
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
IdentitySet>>fuelReplacement [
	| copy |
	copy := self copyEmpty addAll: self.
	^ (self size ~= copy size)
		ifTrue: [ copy ]
		ifFalse: [ self ]
]
