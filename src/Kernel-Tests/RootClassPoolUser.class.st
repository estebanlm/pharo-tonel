"
I'm a class using a single shared pool (which hides a system class). My subclasses should be able to 
access the class variable defined in the pool I use. 
"
Class {
	#name : #RootClassPoolUser,
	#superclass : #Object,
	#pools : [
		'PoolDefiner'
	],
	#category : #Kernel-Tests-Classes,
	#timestamp : 'StephaneDucasse 12/13/2011 15:57'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
RootClassPoolUser class>>author [

	^  Author
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
RootClassPoolUser class>>gloups [

	^  Gloups
]
