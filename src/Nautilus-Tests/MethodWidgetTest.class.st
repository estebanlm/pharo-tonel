"

"
Class {
	#name : #MethodWidgetTest,
	#superclass : #TestCase,
	#category : #Nautilus-Tests,
	#timestamp : ''
}

{
	#category : #mock,
	#timestamp : ' 8/31/2017 05:26:44'
}
MethodWidgetTest>>foo [
	<script: 'self new'>
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
MethodWidgetTest>>testElementInCacheShouldBeNotNil [

	MethodWidget resetMethodIconCache.
	self assert: (MethodWidget new methodIconFor: (self class >> #foo)) target notNil.
	Smalltalk garbageCollect.
	self assert: (MethodWidget new methodIconFor: (self class >> #foo)) target notNil.
]
