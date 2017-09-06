"
I am SubclassResponsibility, an exception signaled when an inherited method should have been implemented in a subclass but was not.
"
Class {
	#name : #SubclassResponsibility,
	#superclass : #SelectorException,
	#category : #Kernel-Exceptions,
	#timestamp : 'SvenVanCaekenberghe 4/21/2011 12:35'
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
SubclassResponsibility>>standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream print: self signaler class.
		stream << ' had the subclass responsibility to implement '.
		stream print: self selector ]
]
