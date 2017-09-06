Extension {
	#name : #ProtoObject
}

{
	#category : #'*Fuel-Collections',
	#timestamp : ' 8/31/2017 05:26:12'
}
ProtoObject>>fuelPointsTo: anObject [
	"This method returns true if self contains a pointer to anObject,
		and returns false otherwise"
	<primitive: 132>
	"This is the same as the following smalltalk code:
	1 to: self class instSize do:
		[:i | (self instVarAt: i) == anObject ifTrue: [^ true]].
	1 to: self basicSize do:
		[:i | (self basicAt: i) == anObject ifTrue: [^ true]].
	^ false"

]

{
	#category : #'*Fuel-Collections',
	#timestamp : ' 8/31/2017 05:26:12'
}
ProtoObject>>largeIdentityHash [

	^ self basicIdentityHash 
]
