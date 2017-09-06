"
I am the default layout for objects.

I contain a fixed number of Slots.
Instances of classes using this kind of layout have always the same size.
"
Class {
	#name : #FixedLayout,
	#superclass : #PointerLayout,
	#category : #Slot-Layout,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
FixedLayout class>>extending: superLayout scope: aScope host: aClass [
	^ (superLayout extend: aScope)
		host: aClass;
		yourself
]

{
	#category : #format,
	#timestamp : ' 8/31/2017 07:16:35'
}
FixedLayout>>instanceSpecification [
	^ self hasFields
		ifTrue: [ 1 ]
		ifFalse: [ 0 ]
]
