"
I am the root class of the Ring meta-model.
A Ring definition has a name, can be annotated and knows its environment
"
Class {
	#name : #RGDefinition,
	#superclass : #Object,
	#instVars : [
		'annotations',
		'name'
	],
	#category : #Ring-Core-Kernel,
	#timestamp : 'MarcusDenker 9/30/2014 10:03'
}

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition class>>authorKey [

	^#author
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition class>>fullNameKey [

	^#fullName
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition class>>named: aName [

	^self new
		name: aName asSymbol;
		yourself
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition class>>timeStampKey [

	^#timestamp
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>annotationNamed: annotationName  [
	"Answer the value of the annotation named <annotationName>, or 
	nil if the annotation is not defined for the receiver."
	
	^ self
		annotationNamed: annotationName
		ifAbsent: [ nil ]
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>annotationNamed: annotationName ifAbsent: exceptionBlock  [
	"Answer the value of the annotation named <annotationName>. If the 
	annotation is not defined for the receiver, answer the result of 
	evaluating the <exceptionBlock>."

	self hasAnnotations
		ifFalse: [ ^exceptionBlock value ].

	^self annotations
			at: annotationName
			ifAbsent: [ exceptionBlock value ]
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>annotationNamed: annotationName ifAbsentPut: blockValue  [

	^self annotations
		at: annotationName
		ifAbsentPut: blockValue
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>annotationNamed: annotationName put: value  [

	self annotations
		at: annotationName
		put: value
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>annotationNames [
	
	self hasAnnotations
		ifFalse:[ ^OrderedCollection new ].
	^annotations keys
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>annotations [

	^annotations ifNil:[ annotations:= IdentityDictionary new ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>asRingDefinition [
	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>environment [
	"If the receiver has not namespace assigned the default is used"
	"self class environment = Smalltalk globals"

	^ self annotationNamed: #environment ifAbsent: [ self class environment ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>environment: namespace [

	namespace = self class environment
		ifFalse:[ self annotationNamed: #environment put: namespace ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>fullName [

	^self name
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>hasAnnotationNamed: annotationName [
	"Answer <true> if the receiver contains the annotation named <annotationName>. "
	
	self hasAnnotations	
		ifFalse:[ ^false ].
	^annotations includesKey: annotationName
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>hasAnnotations [

	^annotations notNil
]

{
	#category : #'testing types',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>isAccess  [

	^false
]

{
	#category : #'testing types',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>isComment [

	^false
]

{
	#category : #'testing types',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>isGlobalVariable [

	^false
]

{
	#category : #'testing types',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>isInheritance [

	^false
]

{
	#category : #'testing types',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>isInvocation [

	^false
]

{
	#category : #'testing types',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>isMethod [

	^false
]

{
	#category : #'testing types',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>isNamespace [

	^false
]

{
	#category : #'testing types',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>isOrganization  [

	^false
]

{
	#category : #'testing types',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>isPackage [

	^false
]

{
	#category : #'testing types',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>isPool [

	^false
]

{
	#category : #'testing types',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>isReference  [

	^false
]

{
	#category : #'testing types',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>isRingObject [

	^true
]

{
	#category : #'testing types',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>isSlice [

	^false
]

{
	#category : #'testing types',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>isVariable [

	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>name [

	^name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>name: anObject [
	"a symbol or a string should be expected"
	
	name:= anObject
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>removeAnnotationNamed: annotationName  [
	"Remove the annotation named <annotationName>. Fails quietly if there 
	is no annotation with the given name."
	
	(self hasAnnotationNamed: annotationName)
		ifTrue:[ annotations removeKey: annotationName ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGDefinition>>rootEnvironment [
	"Retrieves the runtime environment of an RGObject"
	"If the receiver is defined in an RGContainer the runtime environment is the one associated to its container"
	| parent |
	
	parent:= self environment.
	[ parent isRingObject ]
		whileTrue:[ parent:= parent environment ].

	^parent
]
