"
An AbstractMessageConverter is a wrapper used to switch which information to retrieve from a method.

This way, you can avoid switch case, you just have to use set the correct filter
"
Class {
	#name : #AbstractMethodConverter,
	#superclass : #Object,
	#instVars : [
		'method'
	],
	#category : #Tool-Base,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMethodConverter class>>method: aMessage [

	^ self new
		method: aMessage;
		yourself
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMethodConverter>>getText [

	method ifNil: [ ^ '' ].	
	^ self internalGetText
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMethodConverter>>getTextFor: aMethod [

	method := aMethod.
	method ifNil: [ ^ '' ].
	
	^ self internalGetText
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMethodConverter>>internalGetText [

	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMethodConverter>>method [

	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMethodConverter>>method: aMessage [

	method := aMessage
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMethodConverter>>shouldShout [

	^ false
]
