"
I'm the abstract class Magnitude that provides common protocol for objects that have
the ability to be compared along a linear dimension, such as dates or times.
Subclasses of Magnitude include Date, ArithmeticValue, and Time, as well as
Character and LookupKey.
 
 
My subclasses should implement
  < aMagnitude 
  = aMagnitude 
  hash

Here are some example of my protocol:
     3 > 4
     5 = 6
     100 max: 9
	7 between: 5 and: 10 

"
Class {
	#name : #Magnitude,
	#superclass : #Object,
	#category : #Kernel-Numbers,
	#timestamp : 'sd 9/4/2005 10:14'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Magnitude>>< aMagnitude [
	"Answer whether the receiver is less than the argument."

	^self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Magnitude>><= aMagnitude [
	"Answer whether the receiver is less than or equal to the argument."

	^(self > aMagnitude) not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Magnitude>>= aMagnitude [
	"Compare the receiver with the argument and answer with true if the 
	receiver is equal to the argument. Otherwise answer false."

	^self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Magnitude>>> aMagnitude [
	"Answer whether the receiver is greater than the argument."

	^aMagnitude < self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Magnitude>>>= aMagnitude [
	"Answer whether the receiver is greater than or equal to the argument."

	^aMagnitude <= self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Magnitude>>between: min and: max [
	"Answer whether the receiver is less than or equal to the argument, max, 
	and greater than or equal to the argument, min."

	^self >= min and: [self <= max]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Magnitude>>compareWith: anotherMagnitude ifLesser: lesserBlock ifEqual: equalBlock ifGreater: greaterBlock [

	^ self < anotherMagnitude
		ifTrue: lesserBlock
		ifFalse: [ 
			self = anotherMagnitude
				ifTrue: equalBlock
				ifFalse: greaterBlock ]
]

{
	#category : #hash,
	#timestamp : ' 8/31/2017 07:16:33'
}
Magnitude>>hash [
	"Hash must be redefined whenever = is redefined."

	^self subclassResponsibility
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Magnitude>>max: aMagnitude [
	"Answer the receiver or the argument, whichever has the greater 
	magnitude."

	self > aMagnitude
		ifTrue: [^self]
		ifFalse: [^aMagnitude]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Magnitude>>min: aMagnitude [
	"Answer the receiver or the argument, whichever has the lesser 
	magnitude."

	self < aMagnitude
		ifTrue: [^self]
		ifFalse: [^aMagnitude]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Magnitude>>min: aMin max: aMax [

	^ (self min: aMin) max: aMax
]
