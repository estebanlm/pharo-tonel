"
I'm an util to answer module libraries that can have different names in different platforms. 
I just implement a double dispatch with platform.
"
Class {
	#name : #FFILibrary,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #UnifiedFFI-Libraries,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILibrary class>>asFFILibrary [
	^ self uniqueInstance
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILibrary class>>new [
	self error: 'Use #uniqueInstance'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILibrary class>>uniqueInstance  [
	self = FFILibrary 
		ifTrue: [ self error: 'I''m an abstract class, use one of my children.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILibrary>>asFFILibrary  [
	^ self
]

{
	#category : #'library path',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILibrary>>ffiLibraryName [
	^ self moduleName
]

{
	#category : #'accessing platform',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILibrary>>macModuleName  [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILibrary>>moduleName  [
	^ Smalltalk platform ffiModuleName: self
]

{
	#category : #'accessing platform',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILibrary>>unix32ModuleName [
	"Point to #unixModuleName to keep backward compatibility." 
	^ self unixModuleName
]

{
	#category : #'accessing platform',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILibrary>>unix64ModuleName [
	"Point to #unixModuleName to keep backward compatibility." 
	^ self unixModuleName
]

{
	#category : #'accessing platform',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILibrary>>unixModuleName [
	"Kept for backward compatibility. 
	 Users should use unix32* or unix64*"
	^ self subclassResponsibility
]

{
	#category : #'accessing platform',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILibrary>>win32ModuleName  [
	^ self subclassResponsibility
]
