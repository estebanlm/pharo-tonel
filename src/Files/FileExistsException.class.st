"
Notify when file exists
"
Class {
	#name : #FileExistsException,
	#superclass : #FileException,
	#instVars : [
		'fileClass'
	],
	#category : #Files-Core,
	#timestamp : 'TorstenBergmann 2/3/2014 23:37'
}

{
	#category : #exceptioninstantiator,
	#timestamp : ' 8/31/2017 07:16:12'
}
FileExistsException class>>fileName: aFileName fileClass: aClass  [
	^ self new
		fileName: aFileName;
		fileClass: aClass
]

{
	#category : #exceptiondescription,
	#timestamp : ' 8/31/2017 07:16:12'
}
FileExistsException>>defaultAction [
	"The default action taken if the exception is signaled."

	^ UIManager default fileExistsDefaultAction: self

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
FileExistsException>>fileClass [
	^ fileClass ifNil: [StandardFileStream]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
FileExistsException>>fileClass: aClass [
	fileClass := aClass
]
