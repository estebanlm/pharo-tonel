"
This trait is a protocol for comparable objects. Classes using it must implement #<, #=, and #hash.
"
Trait {
	#name : #TComparable,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Kernel-Numbers,
	#timestamp : '<historical>'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
TComparable>>< aComparable [
	"Answer whether the receiver is less than the argument."

	^self subclassResponsibility
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
TComparable>><= aComparable  [
	"Answer whether the receiver is less than or equal to the argument."

	^(self > aComparable) not
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
TComparable>>= aComparable  [
	"Compare the receiver with the argument and answer with true if the 
	receiver is equal to the argument. Otherwise answer false."

	^self subclassResponsibility
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
TComparable>>> aComparable  [
	"Answer whether the receiver is greater than the argument."

	^aComparable < self
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
TComparable>>>= aComparable  [
	"Answer whether the receiver is greater than or equal to the argument."

	^aComparable <= self
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
TComparable>>between: min and: max  [
	"Answer whether the receiver is less than or equal to the argument, max, 
	and greater than or equal to the argument, min."

	^self >= min and: [self <= max]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
TComparable>>hash [
	"Hash must be redefined whenever = is redefined."

	^self subclassResponsibility
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
TComparable>>max: aComparable  [
	"Answer the receiver or the argument, whichever is greater."

	self > aComparable
		ifTrue: [^self]
		ifFalse: [^aComparable]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
TComparable>>min: aComparable  [
	"Answer the receiver or the argument, whichever is lesser."

	self < aComparable
		ifTrue: [^self]
		ifFalse: [^aComparable]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
TComparable>>min: aMin max: aMax  [

	^ (self min: aMin) max: aMax
]
