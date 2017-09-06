"
I am used to temporarily store a version for a package while a cherry-picked slice is committed
"
Class {
	#name : #KomitterManager,
	#superclass : #Object,
	#instVars : [
		'versions'
	],
	#classInstVars : [
		'instance'
	],
	#category : #Komitter-Support,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitterManager class>>current [

	^ instance ifNil: [ instance := super new ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitterManager class>>new [

	^ self shouldNotImplement
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitterManager>>initialize [

	super initialize.

	versions := Dictionary new.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitterManager>>reset [

	versions := Dictionary new
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitterManager>>storeVersion: aVersion for: aPackage [

	versions 
		at: aPackage
		put: aVersion
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitterManager>>versionFor: aPackage [

	^ versions 
		at: aPackage
]
