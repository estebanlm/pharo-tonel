"
I am an expert on Mac OS X filesystem conventions. I resolve origins according to these conventions.
"
Class {
	#name : #MacOSResolver,
	#superclass : #PlatformResolver,
	#category : #FileSystem-Core-Implementation,
	#timestamp : 'cwp 11/18/2009 11:57'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
MacOSResolver class>>platformName [
	^  'Mac OS'
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
MacOSResolver>>cache [
	^ self library / 'Caches'
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
MacOSResolver>>desktop [
	^ self home / 'Desktop'
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
MacOSResolver>>documents [
	^ self home / 'Documents'
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
MacOSResolver>>home [
	^ self directoryFromEnvVariableNamed: 'HOME'
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
MacOSResolver>>library [
	^ self userLibrary
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
MacOSResolver>>preferences  [
	^ self home / 'Library' / 'Preferences'
]

{
	#category : #resolving,
	#timestamp : ' 8/31/2017 07:16:22'
}
MacOSResolver>>supportedOrigins [
	^ super supportedOrigins , #(userApplicationSupport systemApplicationSupport systemLibrary userLibrary)
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
MacOSResolver>>systemApplicationSupport [
	^ self systemLibrary / 'Application Support'
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
MacOSResolver>>systemLibrary [
	^  FileSystem disk root / 'Library'
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
MacOSResolver>>temp [
	^ '/tmp' asFileReference
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
MacOSResolver>>userApplicationSupport [
	^self userLibrary / 'Application Support'
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
MacOSResolver>>userLibrary [
	^  self home / 'Library'
]
