Extension {
	#name : #Behavior
}

{
	#category : #'*Rpackage-Core',
	#timestamp : ' 8/31/2017 07:16:47'
}
Behavior>>originalName [
	^ ((self isObsolete and: [ self name beginsWith: 'AnObsolete' ])
		ifTrue: [ (self name copyFrom:   'AnObsolete' size + 1 to: self name size ) ]
		ifFalse:  [ self name ]) asSymbol
]
