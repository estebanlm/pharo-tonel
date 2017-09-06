Extension {
	#name : #Array
}

{
	#category : #'*Spec-Core',
	#timestamp : ' 8/31/2017 05:26:18'
}
Array>>generateSpec [
	| str spec |
	str := self readStream.	
	
	spec :=  OrderedCollection with: #SpecLayoutFrame.
		
	#( leftFraction: topFraction: rightFraction: bottomFraction: leftOffset: topOffset: rightOffset: bottomOffset: ) do: [:sel |
		spec add: sel.
		str next ifNil: [ spec add: 0 ] ifNotNil: [:value | spec add: value ]].
	^ spec asArray
]
