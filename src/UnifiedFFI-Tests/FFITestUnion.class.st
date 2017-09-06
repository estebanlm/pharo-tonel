"

"
Class {
	#name : #FFITestUnion,
	#superclass : #FFIExternalUnion,
	#category : #UnifiedFFI-Tests,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestUnion class>>fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
		byte byte;
		short short;
		long long;
		float float;
		double double;
		int64 int64;
		)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestUnion>>byte [
	"This method was automatically generated"
	^handle unsignedByteAt: 1
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestUnion>>byte: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: 1 put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestUnion>>double [
	"This method was automatically generated"
	^handle doubleAt: 1
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestUnion>>double: anObject [
	"This method was automatically generated"
	handle doubleAt: 1 put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestUnion>>float [
	"This method was automatically generated"
	^handle floatAt: 1
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestUnion>>float: anObject [
	"This method was automatically generated"
	handle floatAt: 1 put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestUnion>>int64 [
	"This method was automatically generated"
	^handle signedLongLongAt: 1
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestUnion>>int64: anObject [
	"This method was automatically generated"
	handle signedLongLongAt: 1 put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestUnion>>long [
	"This method was automatically generated"
	^handle platformLongAt: 1
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestUnion>>long: anObject [
	"This method was automatically generated"
	^handle platformLongAt: 1 put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestUnion>>short [
	"This method was automatically generated"
	^handle signedShortAt: 1
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestUnion>>short: anObject [
	"This method was automatically generated"
	handle signedShortAt: 1 put: anObject
]
