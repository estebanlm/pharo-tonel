"
I am a public announcement sent when a new RPackage is renamed
"
Class {
	#name : #RPackageRenamed,
	#superclass : #RPackageAnnouncement,
	#instVars : [
		'oldName',
		'newName'
	],
	#category : #RPackage-Core,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageRenamed class>>to: aPackage oldName: aSymbol newName: anotherSymbol [

	^ (self to: aPackage) 
		oldName: aSymbol;
		newName: anotherSymbol;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageRenamed>>newName [

	^ newName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageRenamed>>newName: anObject [

	newName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageRenamed>>oldName [

	^ oldName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageRenamed>>oldName: anObject [

	oldName := anObject
]
