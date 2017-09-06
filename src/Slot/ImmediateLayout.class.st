"
I am the special layout for SmallIntegers.

SmallIntegers are typically implemented as tagged pointers and thus require a special format.
"
Class {
	#name : #ImmediateLayout,
	#superclass : #ObjectLayout,
	#category : #Slot-Layout,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
ImmediateLayout class>>extending: superLayout scope: aScope host: aClass [
	^ superLayout extendImmediate
		host: aClass;
		yourself
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
ImmediateLayout>>extend: newScope [
	^ FixedLayout new slotScope: newScope
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:35'
}
ImmediateLayout>>initialize [
	super initialize.
	self host: SmallInteger.
]

{
	#category : #format,
	#timestamp : ' 8/31/2017 07:16:35'
}
ImmediateLayout>>instanceSpecification [
	^ 7
]
