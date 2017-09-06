"
I am a shared pool used for testing.
"
Class {
	#name : #TestSharedPool,
	#superclass : #SharedPool,
	#classVars : [
		'One'
	],
	#category : #Slot-Tests,
	#timestamp : 'MartinDias 1/31/2014 15:50'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:46'
}
TestSharedPool class>>initialize [
	One := 1
]
