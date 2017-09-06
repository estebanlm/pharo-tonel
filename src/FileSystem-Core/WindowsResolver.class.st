"
I am an expert on Windows filesystem conventions. I resolve origins according to these conventions.
"
Class {
	#name : #WindowsResolver,
	#superclass : #PlatformResolver,
	#category : #FileSystem-Core-Implementation,
	#timestamp : 'cwp 11/18/2009 11:57'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
WindowsResolver class>>platformName [
	^ 'Win32'
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
WindowsResolver>>cache [
	"Because Windows does not define any location for putting cache files, we chose to use the preference directory. http://libertyboy.free.fr/computing/reference/envariables/"
	^ self preferences
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
WindowsResolver>>desktop [
	^ self home / 'Desktop'
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
WindowsResolver>>documents [
	^ self home / 'Documents'
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
WindowsResolver>>home [
	"Value of the $USERPROFILE environment variable."

	^ self directoryFromEnvVariableNamed: 'USERPROFILE'
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
WindowsResolver>>preferences [
	^ self directoryFromEnvVariableNamed: 'APPDATA' or: [ self home ]
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
WindowsResolver>>temp [
	^ self directoryFromEnvVariableNamed: 'TEMP' or: [ FileLocator C / 'windows' / 'temp' ]
]
