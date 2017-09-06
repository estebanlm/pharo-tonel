Extension {
	#name : #MCRemoval
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCRemoval>>isMethodPatch [

	^ definition isMethodDefinition
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCRemoval>>koClass [
	| klass |
	klass := definition koClass.
	klass ifNil: [ ^ nil ].
	definition addOperation: self on: klass.
	self isClassPatch
		ifTrue: [ klass removed: true ].
	^ klass
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCRemoval>>koDefinition [
	
	^  (KomitDefinition definition: self definition)
		operation: self;
		removed: true;
		yourself
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCRemoval>>koDestinationText [

	^ ''
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCRemoval>>koMethod [
	
	^ (KomitMethod method: self definition)
		operation: self;
		removed: true;
		yourself
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCRemoval>>koSourceText [
	^ definition koSourceText 
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCRemoval>>selector [

	^ definition selector
]
