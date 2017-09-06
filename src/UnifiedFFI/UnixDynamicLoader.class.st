"
I'm a unix platform (works in mac too) dynamic library loader.
"
Class {
	#name : #UnixDynamicLoader,
	#superclass : #DynamicLoader,
	#category : #UnifiedFFI-Libraries,
	#timestamp : 'EstebanLorenzano 3/6/2017 11:52'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
UnixDynamicLoader class>>isAvailable [
	^ Smalltalk os isUnix 
		or: [ Smalltalk os isMacOS ]
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:10'
}
UnixDynamicLoader>>lastError [
	^ self ffiCall: #(String dlerror(void))
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:10'
}
UnixDynamicLoader>>loadLibrary: path [
	^ self loadLibrary: path flag: 0 
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:10'
}
UnixDynamicLoader>>loadLibrary: filename flag: flag [
	^ self ffiCall: #(void *dlopen(const char *filename, int flag))
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:10'
}
UnixDynamicLoader>>loadSymbolFrom: handle name: symbol [
	^ self ffiCall: #(void *dlsym(void *handle, String symbol))

]
