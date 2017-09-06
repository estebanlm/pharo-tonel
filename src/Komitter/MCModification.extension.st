Extension {
	#name : #MCModification
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCModification>>isMethodPatch [

	^ obsoletion isMethodDefinition
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCModification>>koClass [
	| klass |
	klass := obsoletion koClass.
	klass ifNil: [ ^ nil ].
	obsoletion addOperation: self on: klass.
	self isClassPatch
		ifTrue: [ klass modified: true ].
	^ klass
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCModification>>koDefinition [
	
	^  (KomitDefinition definition: self definition)
		operation: self;
		modified: true;
		yourself
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCModification>>koDestinationText [

	^ modification koDestinationText
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCModification>>koMethod [
	
	^ (KomitMethod method: self definition)
		operation: self;
		modified: true;
		yourself
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCModification>>koSourceText [

	^ obsoletion koSourceText
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCModification>>selector [

	^ obsoletion selector
]
