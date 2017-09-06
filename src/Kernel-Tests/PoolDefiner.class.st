"
A pool used for testing purposes
"
Class {
	#name : #PoolDefiner,
	#superclass : #SharedPool,
	#classVars : [
		'Author',
		'Gloups'
	],
	#category : #Kernel-Tests-Classes,
	#timestamp : 'TorstenBergmann 2/5/2014 08:39'
}

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:30'
}
PoolDefiner class>>initialize [
	"self initialize"
	
	Gloups := 42.
	Author := 'Ducasse'.
]
