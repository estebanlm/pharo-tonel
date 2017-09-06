"
I am an abstract superclass for platform-specific resolvers.
"
Class {
	#name : #PlatformResolver,
	#superclass : #FileSystemResolver,
	#category : #FileSystem-Core-Implementation,
	#timestamp : 'cwp 11/18/2009 11:56'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
PlatformResolver class>>forCurrentPlatform [
	| platformName |
	platformName :=  Smalltalk os platformName.
	^ (self allSubclasses detect: [:ea | ea platformName = platformName]) new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
PlatformResolver class>>platformName [
	^ nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:22'
}
PlatformResolver class>>primitiveGetUntrustedUserDirectory [
	<primitive: 'primitiveGetUntrustedUserDirectory' module: 'SecurityPlugin'>
	self primitiveFailed.
	self flag: 'use a more decent way to get a path in the users home directory'.
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
PlatformResolver>>cache [
	"Operating Systems often define standard locations for a personal cache directory. The cache directory is a user-specific non-essential (cached) place where data should be written."
	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:22'
}
PlatformResolver>>cantFindOriginError [
	^ Error signal: 'Can''t find the requested origin' 
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
PlatformResolver>>desktop [
	^ self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:22'
}
PlatformResolver>>directoryFromEnvVariableNamed: aString [
	^ self directoryFromEnvVariableNamed: aString or: [ self cantFindOriginError ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:22'
}
PlatformResolver>>directoryFromEnvVariableNamed: aString or: aBlock [
	| envValue |
	envValue := [ Smalltalk os environment at: aString ifAbsent: [ nil ] ]
		on: Error
		do: [ ^ aBlock value ].
	^ envValue isEmptyOrNil
		ifTrue: [ aBlock value ]
		ifFalse: [ self resolveString: envValue ]
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
PlatformResolver>>documents [
	^ self subclassResponsibility
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
PlatformResolver>>home [
	^ self subclassResponsibility
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
PlatformResolver>>preferences [
	^ self subclassResponsibility
]

{
	#category : #resolving,
	#timestamp : ' 8/31/2017 07:16:22'
}
PlatformResolver>>supportedOrigins [
	^ #(home desktop documents preferences cache temp)
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
PlatformResolver>>temp [
	"Where to put files that are not supposed to last long"
	^ self subclassResponsibility 
]
