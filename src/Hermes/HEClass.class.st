"

"
Class {
	#name : #HEClass,
	#superclass : #HEMethodContainer,
	#instVars : [
		'className',
		'superclass',
		'instanceVariables',
		'classInstancevariables',
		'classVariables',
		'sharedPools',
		'layoutClass'
	],
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass class>>for: aClass [
	^ self new
		fromClass: aClass;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>classInstancevariables [
	^ classInstancevariables
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>classInstancevariables: anObject [
	classInstancevariables := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>className [
	^ className
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>className: anObject [
	className := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>classVariables [
	^ classVariables
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>classVariables: anObject [
	classVariables := anObject
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>doReadHeaderFrom: aReader [
	className := aReader readByteSymbol.
	superclass := aReader readByteSymbol.
	instanceVariables := aReader readByteString.
	classInstancevariables := aReader readByteString.
	classVariables := aReader readByteString.
	sharedPools := aReader readByteString.
	layoutClass := aReader readByteSymbol
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>doWriteHeaderInto: aWriter [
	aWriter writeByteString: className.
	aWriter writeByteString: superclass.
	aWriter writeByteString: instanceVariables.
	aWriter writeByteString: classInstancevariables.
	aWriter writeByteString: classVariables.
	aWriter writeByteString: sharedPools.
	aWriter writeByteString: layoutClass
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>fromClass: aClass [
	className := aClass name.
	superclass := aClass superclass name.
	instanceVariables := (aClass slots collect: #name) joinUsing: ' '.
	classInstancevariables := (aClass class slots collect: #name) joinUsing: ' '.
	classVariables := aClass classPool keys joinUsing: ' '.
	sharedPools := (aClass sharedPools collect: #name) joinUsing: ' '.
	layoutClass := aClass classLayout class name.

	self doFromMethodContainer: aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>instanceVariables [
	^ instanceVariables
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>instanceVariables: anObject [
	instanceVariables := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>layoutClass [
	^ layoutClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>layoutClass: anObject [
	layoutClass := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>printOn: aStream [
	aStream
		nextPutAll: 'HEClass ( ';
		nextPutAll: className asString;
		nextPutAll: ' )'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>sharedPools [
	^ sharedPools
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>sharedPools: anObject [
	sharedPools := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>superclass [
	^ superclass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClass>>superclass: anObject [
	superclass := anObject
]
