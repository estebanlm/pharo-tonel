"
I am an inspector dedicated to the visualization of file systems
"
Class {
	#name : #EyeFileSystemInspector,
	#superclass : #EyeTreeInspector,
	#category : #Spec-Inspector,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeFileSystemInspector class>>label [
	^ 'FileReference Tree Inspector'
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeFileSystemInspector>>childrenForObject: aFileReference [
	aFileReference isDirectory ifFalse: [^#()].
	^ aFileReference children collect: [ :each |
		DynamicEyeElement
			host: aFileReference
			value: each
		 ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeFileSystemInspector>>roots [
	^ self childrenForObject: self object
]
