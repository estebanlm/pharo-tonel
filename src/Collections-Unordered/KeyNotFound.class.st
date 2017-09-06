"
I am KeyNotFound, an exception indicating that a key was not found in a Dictionary.
"
Class {
	#name : #KeyNotFound,
	#superclass : #NotFound,
	#category : #Collections-Unordered,
	#timestamp : 'SvenVanCaekenberghe 4/19/2011 19:41'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
KeyNotFound>>key [
	^ self object
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
KeyNotFound>>key: aKey [
	self object: aKey
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:00'
}
KeyNotFound>>standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream << 'key '.
		stream print: self object.
		stream << ' not found in '.
		stream print: self collection class ]
]
