"
My subclasses are dynamic variables: each subclass represents a variable
whose value persists inside the block passed to #value:during:. There is
no way to change the value inside such a block, but it is possible to
temporarirly rebind it in a nested manner.
"
Class {
	#name : #DynamicVariable,
	#superclass : #ProcessSpecificVariable,
	#category : #Kernel-Processes,
	#timestamp : 'mvl 3/13/2007 13:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
DynamicVariable class>>value: anObject during: aBlock [

	^ self soleInstance value: anObject during: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
DynamicVariable>>value: anObject during: aBlock [
	| activeProcess oldValue |
	activeProcess := Processor activeProcess.
	"oldValue will be nil if the variable has not yet been set"
	oldValue := activeProcess psValueAt: index.
	^ [ activeProcess
			psValueAt: index
			put: anObject.
		aBlock value ] ensure: [ 
			activeProcess
				psValueAt: index
				put: oldValue ]
]
