"
SUnit tests for WeakMessageSend
"
Class {
	#name : #WeakMessageSendTest,
	#superclass : #ClassTestCase,
	#category : #Kernel-Tests-Objects,
	#timestamp : 'TorstenBergmann 2/5/2014 08:48'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
WeakMessageSendTest>>testCollectArguments [

	"Fogbugz issue 18127"
	"Test is passed if no primitve fails"
	
	| msg rcvr c|
	
	rcvr := OrderedCollection new.
	c := Color green.
	msg := WeakMessageSend receiver: rcvr selector: #add: arguments: { Color black }.
	
	msg valueWithArguments: {}.
	
	self assertCollection: rcvr asArray equals: { Color black }.
	
	msg valueWithArguments: { #a . WeakArray with: c }.
	
	self assertCollection: rcvr asArray equals: { Color black . #a }.
	
	msg valueWithArguments: (WeakArray with: c).
	
	self assertCollection: rcvr asArray equals: { Color black . #a  . Color green }.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
WeakMessageSendTest>>testNoArguments [
	"self run: #testNoArguments"

	| m |
	m := WeakMessageSend
			receiver: true
			selector: #yourself.
	self assert: (m value).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
WeakMessageSendTest>>testOneArgument [
	"self run: #testOneArgument"	

	| m |
	m := WeakMessageSend
		receiver: Array
		selector: #with:
		argument: 1.
	Smalltalk garbageCollectMost.
	self assert: (m value  = { 1 })

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
WeakMessageSendTest>>testOneArgumentWithGC [

	| m |
	m := WeakMessageSend
		receiver: Array
		selector: #with:
		arguments: { Object new }.
	Smalltalk garbageCollectMost.
	self assert: (m value isNil)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
WeakMessageSendTest>>testReceiverWithGC [

	| m |
	m := WeakMessageSend
		receiver: Object new
		selector: #isNil.
	Smalltalk garbageCollectMost.
	self assert: (m value isNil).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
WeakMessageSendTest>>testTwoArguments [

	| m |
	m := WeakMessageSend
		receiver: Array
		selector: #with:with:
		arguments: { 1 . 2 }.
	Smalltalk garbageCollectMost.
	self assert: (m value = { 1 . 2 }).

]
