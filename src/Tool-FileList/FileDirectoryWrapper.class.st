"

"
Class {
	#name : #FileDirectoryWrapper,
	#superclass : #ListItemWrapper,
	#instVars : [
		'itemName',
		'balloonText',
		'hasContents'
	],
	#category : #Tool-FileList,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
FileDirectoryWrapper class>>with: anObject name: aString model: aModel [

	^self new 
		setItem: anObject name: aString model: aModel
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:25'
}
FileDirectoryWrapper>>asString [
	 ^itemName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
FileDirectoryWrapper>>balloonText [

	^balloonText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
FileDirectoryWrapper>>balloonText: aStringOrNil [

	balloonText := aStringOrNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
FileDirectoryWrapper>>contents [

	^((model directoriesFor: item) 
		sort: [ :a :b | a basename caseInsensitiveLessOrEqual: b basename]) 
		collect: [ :directory| 
			self class with: directory name: directory basename model: self ]

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
FileDirectoryWrapper>>directoriesFor: anItem [
	^model directoriesFor: anItem
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
FileDirectoryWrapper>>hasContents [
	"Return whether this directory has subfolders. The value is cached to 
	avoid a performance penalty.	Also for performance reasons, the code 
	below will just assume that the directory does indeed have contents in a 
	few of cases:  
	1. If the item is not a FileDirectory (thus avoiding the cost 
	of refreshing directories that are not local) 
	2. If it's the root directory of a given volume 
	3. If there is an error computing the FileDirectory's contents
	"
	hasContents ifNil: [
		hasContents := [ 
				item isDirectory 
				and: [ item isReadable 
				and: [ item hasDirectories ]]
			] on: Error do: [ :error | false ]].
	^ hasContents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
FileDirectoryWrapper>>icon [
	"Answer a form to be used as icon"

	"^ item isRemoteDirectory
		ifTrue: [ Smalltalk ui icons smallRemoteOpenIcon]
		ifFalse: [Smalltalk ui icons smallOpenIcon]"

	^ self iconNamed: #smallOpenIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
FileDirectoryWrapper>>setItem: anObject name: aString model: aModel [

	item := anObject.
	model := aModel.
	itemName := aString.
	hasContents := nil.

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
FileDirectoryWrapper>>settingSelector [

	^#setSelectedDirectoryTo:
]
