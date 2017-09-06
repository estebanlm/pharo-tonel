"
A SourceMessageConverter is a wrapper wich display the source code of the provided message
"
Class {
	#name : #SourceMethodConverter,
	#superclass : #AbstractMethodConverter,
	#category : #Tool-Base,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SourceMethodConverter>>internalGetText [

	^ method sourceCode
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SourceMethodConverter>>shouldShout [

	^ true.
]
