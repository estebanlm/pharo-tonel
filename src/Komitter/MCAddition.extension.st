Extension {
	#name : #MCAddition
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCAddition>>isMethodPatch [

	^ definition isMethodDefinition
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCAddition>>koClass [
	| klass |
	klass := definition koClass.
	klass ifNil: [ ^ nil ].
	definition addOperation: self on: klass.
	self isClassPatch
		ifTrue: [ klass added: true ].
	^ klass
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCAddition>>koDefinition [
	
	^ (KomitDefinition definition: self definition)
		operation: self;
		added: true;
		yourself
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCAddition>>koDestinationText [
	
	^ definition koDestinationText
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCAddition>>koMethod [
	
	^ (KomitMethod method: self definition)
		operation: self;
		added: true;
		yourself
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCAddition>>koSourceText [
	
	^ ''
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCAddition>>selector [

	^ definition selector
]
