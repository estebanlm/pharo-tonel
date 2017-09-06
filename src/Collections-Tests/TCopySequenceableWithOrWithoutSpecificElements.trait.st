"
A trait for test purposes
"
Trait {
	#name : #TCopySequenceableWithOrWithoutSpecificElements,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:33'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithOrWithoutSpecificElements>>indexInNonEmpty [
" return an index between bounds of 'nonEmpty' "

	self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithOrWithoutSpecificElements>>nonEmpty [
	self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithOrWithoutSpecificElements>>test0FixtureCopyWithOrWithoutSpecificElementsTest [
	self nonEmpty.
	self deny: self nonEmpty isEmpty.
	self indexInNonEmpty.
	self assert: self indexInNonEmpty > 0.
	self assert: self indexInNonEmpty <= self nonEmpty size
]

{
	#category : #'tests - copying with or without',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithOrWithoutSpecificElements>>testCopyWithFirst [

	| index element result |
	index:= self indexInNonEmpty .
	element:= self nonEmpty at: index.
	
	result := self nonEmpty copyWithFirst: element.	
	
	self assert: result size = (self nonEmpty size + 1).
	self assert: result first = element .
	
	2 to: result size do:
	[ :i |
	self assert: (result at: i) = ( self nonEmpty at: ( i - 1 ))].
]

{
	#category : #'tests - copying with or without',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithOrWithoutSpecificElements>>testCopyWithSequenceable [

	| result index element |
	index := self indexInNonEmpty .
	element := self nonEmpty at: index.
	result := self nonEmpty copyWith: (element ).
	
	self assert: result size = (self nonEmpty size + 1).
	self assert: result last = element .
	
	1 to: (result size - 1) do:
	[ :i |
	self assert: (result at: i) = ( self nonEmpty at: ( i  ))].
]

{
	#category : #'tests - copying with or without',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithOrWithoutSpecificElements>>testCopyWithoutFirst [

	| result |
	result := self nonEmpty copyWithoutFirst.
	
	self assert: result size = (self nonEmpty size - 1).
	
	1 to: result size do:
		[:i |
		self assert: (result at: i)= (self nonEmpty at: (i + 1))].
]

{
	#category : #'tests - copying with or without',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithOrWithoutSpecificElements>>testCopyWithoutIndex [
	| result index |
	index := self indexInNonEmpty .
	result := self nonEmpty copyWithoutIndex: index .
	
	"verify content of 'result:'"
	1 to: result size do:
		[:i | 
		i<( index ) ifTrue: [self assert: ((result at:i )= (self nonEmpty at:i))].
		i>=( index ) ifTrue: [self assert: (result at:i )= (self nonEmpty at:(i+1))]].
	
	"verify size of result : "
	self assert: result size=(self nonEmpty size -1).
]

{
	#category : #'tests - copying with or without',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithOrWithoutSpecificElements>>testForceToPaddingStartWith [

	| result element |
	element := self nonEmpty at: self indexInNonEmpty .
	result := self nonEmpty forceTo: (self nonEmpty size+2) paddingStartWith: ( element ).
	
	"verify content of 'result' : "
	1 to: 2   do:
		[:i | self assert: ( element ) = ( result at:(i) ) ].
	
	3 to: result size do:
		[:i | self assert: ( result at:i ) = ( self nonEmpty at:(i-2) ) ].

	"verify size of 'result' :"
	self assert: result size = (self nonEmpty size + 2).
]

{
	#category : #'tests - copying with or without',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithOrWithoutSpecificElements>>testForceToPaddingWith [

	| result element |
	element := self nonEmpty at: self indexInNonEmpty .
	result := self nonEmpty forceTo: (self nonEmpty size+2) paddingWith: ( element ).
	
	"verify content of 'result' : "
	1 to: self nonEmpty  size do:
		[:i | self assert: ( self nonEmpty at: i ) = ( result at:(i) ). ].
	
	(result size - 1) to: result size do:
		[:i | self assert: ( result at:i ) = ( element ) ].

	"verify size of 'result' :"
	self assert: result size = (self nonEmpty size + 2).
]
