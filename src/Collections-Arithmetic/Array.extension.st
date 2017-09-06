Extension {
	#name : #Array
}

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Array>>+* aCollection [
	"Premultiply aCollection by self.  aCollection should be an Array or Matrix.
	 The name of this method is APL's +.x squished into Smalltalk syntax."

	^aCollection preMultiplyByArray: self

]

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Array>>preMultiplyByArray: a [
	"Answer a+*self where a is an Array.  Arrays are always understood as column vectors,
	 so an n element Array is an n*1 Array.  This multiplication is legal iff self size = 1."

	self size = 1 ifFalse: [self error: 'dimensions do not conform'].
	^a * self first
]

{
	#category : #'*Collections-arithmetic',
	#timestamp : ' 8/31/2017 07:16:28'
}
Array>>preMultiplyByMatrix: m [
	"Answer m+*self where m is a Matrix."

	m numberOfColumns = self size ifFalse: [self error: 'dimensions do not conform'].
	^ (1 to: m numberOfRows) collect: [ :row | 
			| s |
			s := 0.
			1 to: self size do: [:k | s := (m at: row at: k) * (self at: k) + s].
		s ]
]
