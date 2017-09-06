"
I'm a class to load libraries and symbols from system.
I provide dlopen in linux and mac and LoadLibrary in windows.
"
Class {
	#name : #DynamicLoader,
	#superclass : #FFILibrary,
	#category : #UnifiedFFI-Libraries,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
DynamicLoader class>>forCurrentPlatform [
	^ (self allSubclasses 
		detect: [ :each | each isAvailable ])
		uniqueInstance
		
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
DynamicLoader class>>isAvailable [
	^ self subclassResponsibility
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:10'
}
DynamicLoader class>>lastError [
	^ self forCurrentPlatform lastError
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:10'
}
DynamicLoader class>>loadLibrary: path [
	^ self forCurrentPlatform loadLibrary: path
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:10'
}
DynamicLoader class>>loadLibrary: path flag: flag [
	^ self forCurrentPlatform 
		loadLibrary: path 
		flag: flag
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:10'
}
DynamicLoader>>lastError [
	^ self subclassResponsibility
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:10'
}
DynamicLoader>>loadLibrary: path [
	^ self subclassResponsibility
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:10'
}
DynamicLoader>>loadSymbolFrom: handle name: symbol [
	^ self subclassResponsibility
]

{
	#category : #'accessing platform',
	#timestamp : ' 8/31/2017 05:26:10'
}
DynamicLoader>>macModuleName [
	^ 'libc.dylib'
]

{
	#category : #'accessing platform',
	#timestamp : ' 8/31/2017 05:26:10'
}
DynamicLoader>>unixModuleName [
	^ 'libdl.so'
]
