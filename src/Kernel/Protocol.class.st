"
A Protocol is a simple value holder representing a protocol.
It's composed of a name and a set of method selectors
"
Class {
	#name : #Protocol,
	#superclass : #Object,
	#instVars : [
		'methods',
		'name'
	],
	#category : #Kernel-Protocols,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol class>>ambiguous [
	^ #ambiguous
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol class>>defaultName [

	^  self unclassified
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol class>>empty [
	 ^ self name: #''
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol class>>name: nm [

	^ self new
		name: nm;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol class>>name: nm methods: methods [

	^ self new
		methods: methods;
		name: nm;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol class>>nullCategory [

	^ #'no messages'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol class>>unclassified [
	^ #'as yet unclassified'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>addAllMethodsFrom: aProtocol [

	aProtocol methods do: [ :each | self addMethod: each ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>addMethod: aSymbol [
	^ methods add: aSymbol
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>canBeRemoved [
	^ self isEmpty 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>canBeRenamed [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>includesSelector: selector [

	^ methods includes: selector
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>initialize [

	super initialize.

	methods := IdentitySet new.
	name := self class defaultName.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>isEmpty [

	^ self methods isEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>isExtensionProtocol [
	^ self name first = $*.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>isVirtualProtocol [
	"A virtual protocol is a calculated one (it does not have any methods by it self)"
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>methods [

	^ methods
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>methods: anObject [
	
	methods := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>name [

	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>name: anObject [
	name := anObject asSymbol
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>printOn: aStream [

	aStream 
		nextPutAll: (self class name);
		nextPutAll: ' (';
		nextPutAll: (self name);
		nextPutAll: ') - ';
		nextPutAll: (self methods size asString);
		nextPutAll: ' selector(s)'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>removeAllMethods [

	^ methods removeAll.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>removeMethod: aSymbol [

	^ methods remove: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Protocol>>rename: newName [

	self name: newName
]
