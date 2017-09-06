"
I am an acceptor in the context of method definition
"
Class {
	#name : #MethodDefinitionAcceptor,
	#superclass : #AbstractAcceptor,
	#category : #Nautilus-Acceptors,
	#timestamp : '<historical>'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodDefinitionAcceptor>>accept: source notifying: aController [
	| protocol method |

	protocol := self model selectedCategory.
	method := self model selectedMethod.
	
	protocol ifNil: [
		protocol := method 
			ifNil: [ Protocol unclassified ]
			ifNotNil: [ method protocol ] ].

	self model
		compileAMethodFromCategory: protocol
		withSource: source
		notifying: aController
]
