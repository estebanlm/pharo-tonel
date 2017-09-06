"
I am ShouldBeImplemented, an exception signaled when some method should have been implemented but was not.

This is more like a placeholder during development.
"
Class {
	#name : #ShouldBeImplemented,
	#superclass : #SelectorException,
	#category : #Kernel-Exceptions,
	#timestamp : 'SvenVanCaekenberghe 4/21/2011 12:34'
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ShouldBeImplemented>>standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream print: self selector.
		stream << ' should have been implemented in '.
		stream print: self signaler class]
]
