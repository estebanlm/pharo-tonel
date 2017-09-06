"
A pool used for testing purposes
"
Class {
	#name : #PoolDefiner2,
	#superclass : #SharedPool,
	#classVars : [
		'Author',
		'VariableInPoolDefiner2'
	],
	#category : #Kernel-Tests-Classes,
	#timestamp : 'TorstenBergmann 2/5/2014 08:39'
}

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:30'
}
PoolDefiner2 class>>initialize [
	"self initialize"
	
	VariableInPoolDefiner2 := 33.
	Author := 'NotDucasse'.
]
