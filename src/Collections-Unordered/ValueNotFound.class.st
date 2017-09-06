"
I am ValueNotFound, an exception indicating that a value was not found in a Dictionary.
"
Class {
	#name : #ValueNotFound,
	#superclass : #NotFound,
	#category : #Collections-Unordered,
	#timestamp : 'SvenVanCaekenberghe 4/19/2011 19:42'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:00'
}
ValueNotFound>>standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream << 'value '.
		stream print: self object.
		stream << ' not found in '.
		stream print: self collection class]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ValueNotFound>>value [
	^ self object
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ValueNotFound>>value: aValue [
	^ self object: aValue
]
