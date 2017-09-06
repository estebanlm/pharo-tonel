"

"
Class {
	#name : #ObjectsAsMethodsExample,
	#superclass : #AbstractObjectsAsMethod,
	#category : #Tests-ObjectsAsMethods,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
ObjectsAsMethodsExample>>add: a with: b [
	^a + b
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
ObjectsAsMethodsExample>>answer42 [
	^42
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
ObjectsAsMethodsExample>>run: oldSelector with: arguments in: aReceiver [
	^self perform: oldSelector withArguments: arguments
]
