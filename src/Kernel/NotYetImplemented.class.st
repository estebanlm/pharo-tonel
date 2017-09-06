"
I am NotYetImplement, an exception signaled when a method is a stub for code that will be implemented in the future.

This is used in incremental development, for example when doing Test First development.
It is similar to ShouldBeImplemented, with a slightly different meaning.
"
Class {
	#name : #NotYetImplemented,
	#superclass : #SelectorException,
	#category : #Kernel-Exceptions,
	#timestamp : '<historical>'
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
NotYetImplemented>>standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream print: self selector.
		stream << ' is not yet implemented in '.
		stream print: self signaler class]
]
