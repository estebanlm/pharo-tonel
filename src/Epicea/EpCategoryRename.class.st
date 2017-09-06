"
I represent the rename of a category in a package.
"
Class {
	#name : #EpCategoryRename,
	#superclass : #EpCategoryChange,
	#instVars : [
		'oldCategoryName'
	],
	#category : #Epicea-Model,
	#timestamp : 'SkipLentz 9/15/2015 10:37'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryRename class>>oldName: oldName newName: newName [

	^self
		oldName: oldName
		newName: newName
		packageName: (self packageNameFromCategoryName: newName)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryRename class>>oldName: oldName newName: newName packageName: packageName [

	^ self basicNew
		initializeOldName: oldName newName: newName packageName: packageName;
		yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryRename>>accept: aVisitor [
	^ aVisitor visitCategoryRename: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryRename>>initializeOldName: theOldName newName: theNewName packageName: aPackageName [

	self initializeNamed: theNewName packageName: aPackageName.
	oldCategoryName := theOldName.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryRename>>newCategoryName [

	^ self categoryName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryRename>>oldCategoryName [

	^ oldCategoryName
]
