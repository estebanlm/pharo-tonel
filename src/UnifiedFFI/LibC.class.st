"
I'm a module defining access to standard LibC. 
I'm available under Linux and OSX, but not under Windows for obvious reasons :)
"
Class {
	#name : #LibC,
	#superclass : #FFILibrary,
	#category : #UnifiedFFI-Libraries,
	#timestamp : '<historical>'
}

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:10'
}
LibC class>>memCopy: from to: to size: size [
	^ self uniqueInstance  
		memCopy: from 
		to: to 
		size: size
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:10'
}
LibC class>>system: command [
	^ self uniqueInstance system: command
]

{
	#category : #'accessing platform',
	#timestamp : ' 8/31/2017 05:26:10'
}
LibC>>macModuleName [
	^ 'libc.dylib'
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:10'
}
LibC>>memCopy: src to: dest size: n [
	^ self ffiCall: #(void *memcpy(void *dest, const void *src, size_t n))
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:10'
}
LibC>>system: command [
	^ self ffiCall: #(int system #(char * command))
]

{
	#category : #'accessing platform',
	#timestamp : ' 8/31/2017 05:26:10'
}
LibC>>unixModuleName [
	^ 'libc.so.6'
]

{
	#category : #'accessing platform',
	#timestamp : ' 8/31/2017 05:26:10'
}
LibC>>win32ModuleName [
	"While this is not a 'libc' properly, msvcrt has the functions we are defining here"
	^ 'msvcrt.dll'
]
