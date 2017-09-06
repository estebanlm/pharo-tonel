"
A filter for kernel classes
"
Class {
	#name : #KernelClassesFilter,
	#superclass : #StackFilter,
	#instVars : [
		'kernelClasses'
	],
	#category : #DebuggerFilters,
	#timestamp : 'TorstenBergmann 1/31/2014 11:30'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:17'
}
KernelClassesFilter>>initialize [
	
	super initialize.
	kernelClasses := self kernelClassesToExclude asOrderedCollection.
	kernelClasses := kernelClasses 
		addAll: (kernelClasses collect: #class);
		yourself
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:17'
}
KernelClassesFilter>>kernelClassesToExclude [
	^ {Boolean.
	True.
	False.
	BlockClosure.
	Context.
	Array.
	OrderedCollection.
	Set.
	IdentitySet.
	Dictionary.
	IdentityDictionary.
	Class.
	Metaclass.
	Behavior.
	SmallInteger.
	Float.
	Error.
	Exception.
	UndefinedObject.
	MessageSend}
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
KernelClassesFilter>>shouldDisplay: aContext [
	^ (kernelClasses includes: aContext receiver class) not
]
