"
This class stores 32bit Integer points in place. It is used to pass data efficiently to the primitive level during high-bandwidth 2D graphics operations.
"
Class {
	#name : #PointArray,
	#superclass : #IntegerArray,
	#type : #words,
	#traits : 'TPointAccess',
	#classTraits : 'TPointAccess classTrait',
	#category : #Balloon-Collections,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:11'
}
PointArray class>>new: n [
	^super new: n*2
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:11'
}
PointArray>>asPointArray [
	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
PointArray>>size [
	"Return the number of elements in the receiver"
	^super size // 2
]
