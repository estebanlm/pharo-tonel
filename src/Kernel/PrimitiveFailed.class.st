"
I am PrimitiveFailed, an exception signaled when a primitive fails.
"
Class {
	#name : #PrimitiveFailed,
	#superclass : #SelectorException,
	#category : #Kernel-Exceptions,
	#timestamp : 'SvenVanCaekenberghe 4/21/2011 12:31'
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
PrimitiveFailed>>standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream << 'primitive '.
		stream print: self selector.
		stream << ' in '.
		stream print: self signaler class.
		stream << ' failed' ]
]
