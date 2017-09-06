"
I am an inspector showing abstract syntax trees. 
Instead of showing the full complexity, show the structure of the code by only showing the nodes.

As an example, inspect 

	(Object>>#halt) ast

"
Class {
	#name : #EyeSyntaxTreeInspector,
	#superclass : #EyeTreeInspector,
	#category : #Spec-Inspector,
	#timestamp : 'MarcusDenker 8/4/2014 16:22'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeSyntaxTreeInspector class>>label [
	^ 'AST Inspector'
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeSyntaxTreeInspector>>childrenForObject: aNode [
	^ aNode children collect: [ :each | 
			DynamicEyeElement
				host: aNode
				label: each class name
				description: [ :node | node formattedCode ]
				value: [each] ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeSyntaxTreeInspector>>roots [
	^ self childrenForObject: self object
]
