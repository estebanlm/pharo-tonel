"
My subclasses have values specific to the active process. They can be read with #value and set with #value:
"
Class {
	#name : #ProcessLocalVariable,
	#superclass : #ProcessSpecificVariable,
	#category : #Kernel-Processes,
	#timestamp : 'mvl 3/13/2007 12:28'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProcessLocalVariable class>>value: anObject [
	^ self soleInstance value: anObject
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProcessLocalVariable>>value: anObject [
	Processor activeProcess psValueAt: index put: anObject
]
