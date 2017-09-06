"
I am ShouldNotImplement, an exception signaled when a method was implemented but should not have been.

This can happen when an implementation is inherited.
"
Class {
	#name : #ShouldNotImplement,
	#superclass : #SelectorException,
	#category : #Kernel-Exceptions,
	#timestamp : 'SvenVanCaekenberghe 4/21/2011 12:33'
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ShouldNotImplement>>standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream print: self selector.
		stream << ' should not have been implemented in '.
		stream print: self signaler class]
]
