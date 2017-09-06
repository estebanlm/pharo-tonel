"
I am an acceptor in the case a class definition has been entered.
My action is then to compile the definition as a class object
"
Class {
	#name : #ClassDefinitionAcceptor,
	#superclass : #AbstractAcceptor,
	#category : #Nautilus-Acceptors,
	#timestamp : '<historical>'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassDefinitionAcceptor>>accept: aText notifying: aController [

	(self isClassDefinitionExpression: aText)
		ifFalse: [ ^ self notifyNoClassDefintion ].
		
	self model compileAClassFrom: aText notifying: aController
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassDefinitionAcceptor>>isClassDefinitionExpression: aSource [
	[ RBParser parseExpression: aSource ]
		on: Notification
		do: [ ^ false ].
	^ true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassDefinitionAcceptor>>notifyNoClassDefintion [
	"if this was not a class definition, the user has tried to
	define a method without selecting a class"

	^ UIManager default alert: 'No class selected'
]
