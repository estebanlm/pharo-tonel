"
I am a specialized OSEnvironment version for *nix systems (Linux, OSX).
"
Class {
	#name : #UnixEnvironment,
	#superclass : #OSEnvironment,
	#category : #System-OSEnvironments,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
UnixEnvironment class>>isDefaultFor: aPlatform  [
	^  aPlatform isUnix 
		or: [ aPlatform isMacOSX 
		or: [ aPlatform isMacOS ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
UnixEnvironment>>environ [
	"Return the address of the array holding the environment variables"
	^ FFIExternalArray 
		fromPointer: (ExternalAddress loadSymbol: 'environ' from: LibC)
		type: String
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:17'
}
UnixEnvironment>>environAt: index [
	^ self environ at: index
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 05:26:17'
}
UnixEnvironment>>keysAndValuesDo: aBlock [
	| index associationString  |
	index := 1	.
	[ 
		associationString := self environAt: index.
		associationString ifNil: [ ^ self ].
		self keysAndValuesDo: aBlock withAssociationString: associationString.
		index := index + 1
	] repeat.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:17'
}
UnixEnvironment>>setEnv: nameString value: valueString [
	"This method calls the Standard C Library getenv() function"
	^ self ffiCall: #( int setenv (String nameString, String valueString, 1) ) module: LibC
]
