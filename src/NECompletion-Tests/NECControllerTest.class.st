"
A NECControllerTest is a test class for testing the behavior of NECController
"
Class {
	#name : #NECControllerTest,
	#superclass : #TestCase,
	#instVars : [
		'controller'
	],
	#category : #NECompletion-Tests,
	#timestamp : '<historical>'
}

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECControllerTest>>setUp [
	"Setting up code for NECControllerTest"


	controller := NECController new.
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECControllerTest>>tearDown [
	"Tearing down code for NECControllerTest"


	controller := nil.
]

{
	#category : #tests-keyboard,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECControllerTest>>testSmartNeedExtraRemoveInForOppositeAt [

	self assert: (controller smartNeedExtraRemoveIn: '()' for: $( opposite:$) at:1).
	self deny: (controller smartNeedExtraRemoveIn: '(()' for: $( opposite:$) at:2).
	self assert: (controller smartNeedExtraRemoveIn: '(1()' for: $( opposite:$) at:3).
	self assert: (controller smartNeedExtraRemoveIn: '(1(1())' for: $( opposite:$) at:5).
	self assert: (controller smartNeedExtraRemoveIn: '((1)1())))' for: $( opposite:$) at:6).
	self deny: (controller smartNeedExtraRemoveIn: '()(()' for: $( opposite:$) at:3).
	self assert: (controller smartNeedExtraRemoveIn: '(foobar()' for: $( opposite:$) at:8).
]
