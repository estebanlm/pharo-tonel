"

"
Class {
	#name : #HEExtendedEnvironment,
	#superclass : #Object,
	#instVars : [
		'inner',
		'newMethod',
		'newClass',
		'newSelector'
	],
	#category : #Hermes-ClassInstaller,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExtendedEnvironment>>classNamed: aClassName [
	^ newClass name = aClassName
		ifTrue: [ newClass ]
		ifFalse: [ inner classNamed: aClassName ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExtendedEnvironment>>inner [
	^ inner
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExtendedEnvironment>>inner: anObject [
	inner := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExtendedEnvironment>>newClass [
	^ newClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExtendedEnvironment>>newClass: anObject [
	newClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExtendedEnvironment>>newMethod [
	^ newMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExtendedEnvironment>>newMethod: anObject [
	newMethod := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExtendedEnvironment>>newSelector [
	^ newSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExtendedEnvironment>>newSelector: anObject [
	newSelector := anObject
]
