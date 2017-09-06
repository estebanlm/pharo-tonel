"
I am DoubleLink, the elementary part of a DoubleLinkedList.

I hold a value, as well as a link to my successor (nextLink) and to my predecessor (previousLink) - both can be nil.
"
Class {
	#name : #DoubleLink,
	#superclass : #Object,
	#instVars : [
		'value',
		'nextLink',
		'previousLink'
	],
	#category : #Collections-DoubleLinkedList,
	#timestamp : 'SvenVanCaekenberghe 1/12/2014 14:15'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:11'
}
DoubleLink class>>value: anObject [
	^ self new
		value: anObject;
		yourself
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:11'
}
DoubleLink>>asDoubleLink [
	^ self
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:11'
}
DoubleLink>>clearLinks [
	nextLink := previousLink := nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
DoubleLink>>hasPredecessor [
	^ previousLink notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
DoubleLink>>hasSuccessor [
	^ nextLink notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
DoubleLink>>nextLink [
	^ nextLink
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
DoubleLink>>nextLink: anObject [
	nextLink := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
DoubleLink>>previousLink [
	^ previousLink
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
DoubleLink>>previousLink: anObject [
	previousLink := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
DoubleLink>>value [
	^ value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
DoubleLink>>value: anObject [
	value := anObject
]
