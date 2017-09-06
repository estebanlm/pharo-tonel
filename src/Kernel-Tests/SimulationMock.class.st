"
I am used to test the behavior of Context>>jump in MethodContextTest. My example methods includes instance variable stores. When my instance is read-only or writeable, the example method uses or not the write barrier call-back. The copy of the context answered can be used to ensure the stack state is correct.

"
Class {
	#name : #SimulationMock,
	#superclass : #Object,
	#instVars : [
		'instVar1'
	],
	#category : #Kernel-Tests-Methods,
	#timestamp : 'ClementBera 1/27/2017 13:17'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:30'
}
SimulationMock>>exampleClosure [
	"This is a pathological case where the method has no arguments, no temporaries, and the instance variable store is followed by the creation of a closure with no copied values."
	instVar1 := 1.
	[ 2 ] value.
	^ thisContext copy 

]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:30'
}
SimulationMock>>exampleSend [
	"This is a pathological case where the method has no arguments, no temporaries, and the instance variable store is followed by the creation of a closure with no copied values."
	instVar1 := 1.
	self yourself.
	^ thisContext copy 

]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:30'
}
SimulationMock>>exampleStore [
	"This is a pathological case where the method has no arguments, no temporaries, and the instance variable store is followed by the creation of a closure with no copied values."
	instVar1 := 1.
	instVar1 := 2.
	^ thisContext copy 

]
