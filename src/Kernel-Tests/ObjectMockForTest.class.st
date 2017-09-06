"
I am a simple mock for tests
"
Class {
	#name : #ObjectMockForTest,
	#superclass : #Object,
	#instVars : [
		'variable'
	],
	#category : #Kernel-Tests-Objects,
	#timestamp : 'CyrilFerlicot 8/16/2017 22:00'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ObjectMockForTest>>variable [
	^ variable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ObjectMockForTest>>variable: anObject [
	variable := anObject
]
