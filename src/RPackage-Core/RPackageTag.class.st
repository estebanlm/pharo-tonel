"
I'm a class tag for an RPackage. 
Class tags can be any kind of metadata the user needs, but they are for now equivalent to class categories. 
"
Class {
	#name : #RPackageTag,
	#superclass : #Object,
	#instVars : [
		'package',
		'name',
		'classNames'
	],
	#category : #RPackage-Core,
	#timestamp : 'MartinWalk 7/12/2014 17:09'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag class>>new  [
	self error: 'Use #package:name:'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag class>>package: aPackage name: aString  [
	^ self basicNew 
		initializePackage: aPackage name: aString;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>addClass: aClass [
	aClass category: self categoryName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>addClassNamed: aSymbol  [
	(classNames includes: aSymbol) ifTrue: [ ^ self ].
	^ classNames add: aSymbol.
]

{
	#category : #'private ',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>asRPackage [
	"Create a new RPackage with the same contents as this rpackage tag"
	| newRPackage |
	
	newRPackage := RPackage named: self categoryName.
	self classes 
		do: [ :className | newRPackage importClass: className ].
	(self package extensionsForTag: self) 
		do: [ :extensionMethod | newRPackage addMethod: extensionMethod ].
	
	^ newRPackage
]

{
	#category : #'private ',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>basicRenameTo: aString [
	name := aString.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>categoryName  [
	"Answer this tag as a SystemCategory. 
    That would be RPackage, '-', RPackageTag, unless tag is root (same name as RPackage)"
	^ self toCategoryName: self name

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>classNames  [
	^ classNames
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>classes [
	^ self classNames collect: [ :each | self class environment at: each ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>ensureSystemCategory  [
	SystemOrganization addCategory: self categoryName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>extensionCategoriesForClass: aClass  [
	^ self package extensionCategoriesForClass: aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>extensionClasses  [
	^ #()
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>hasClass: aClass  [
	^  self hasClassNamed: aClass name
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>hasClassNamed: aSymbol  [
	^ self classNames includes: aSymbol
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>includesClass: aClass  [
	^ self hasClassNamed: aClass name
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>includesMethodCategory: aProtocol ofClass: aClass  [
	^ self package 
		includesMethodCategory: aProtocol 
		ofClass: aClass 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>includesSelector: aSelector ofClass: aClass [
	^ self package 
		includesSelector: aSelector 
		ofClass: aClass
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>initialize  [
	super initialize.
	classNames := Set new.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>initializePackage: aPackage name: aString  [
	package := aPackage.
	name := aString.
	self initialize.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>isEmpty [
	^ self classNames isEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>isRoot [
	^ self name = self packageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>name  [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>orderedClasses [
^ self package orderedClasses select:[:c | c category = self categoryName]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>package  [
	^ package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>packageName  [
	^ self package name
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>printOn: aStream  [
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: self name.
	aStream nextPut: $)
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>promoteAsRPackage [
	"This method converts this rpackage tag into an rpackage, removes the tag from the parent package with all classes included and registers the new package in the system.
	The tag has to be removed before registering to avoid conflicts.
	Smells like we could have an error and lose package tags! registerPackage should not fail because names Package-Tag are unique in the system."
	| newRPackage |
	
	newRPackage := self asRPackage.
	self classes do: [ :each | self package removeClass: each  ].
	self package removeClassTag: self name.
	self package removeMethods: newRPackage extensionMethods.
	RPackage organizer registerPackage: newRPackage.
	
	newRPackage classes do: [ :each | 
		SystemAnnouncer uniqueInstance 
			classRepackaged: each 
			from: self package
			to:  newRPackage ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>removeClass: aClass [
	^ self removeClassNamed: aClass name.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>removeClassNamed: aSymbol  [
	^ classNames remove: aSymbol ifAbsent: [].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>removeFromPackage [
	self 
		assert: self isEmpty 
		description: 'Package tag is not empty'.
		
	self package basicRemoveTag: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>renameTo: newTagName [
	| oldName categoryName tagName |
	tagName := self name.
	oldName := self toCategoryName: tagName.
	categoryName := self toCategoryName: newTagName. 
	
	oldName = categoryName ifTrue: [ ^ self ].
	
	self basicRenameTo: newTagName.
	SystemAnnouncer uniqueInstance suspendAllWhile: [
		self classes do: [ :each | each category: categoryName ].
		self class environment organization 
			renameCategory: oldName 
			toBe: categoryName].
	SystemAnnouncer uniqueInstance 
		classTagRenamed: tagName 
		inPackage: self package 
		to: newTagName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>renameTo: aString category: categoryName [
	| oldName |
	
	oldName := self toCategoryName: self name.
	oldName = categoryName ifTrue: [ ^ self ].
	
	self basicRenameTo: aString.
	SystemAnnouncer uniqueInstance suspendAllWhile: [
		self classes do: [ :each | each category: categoryName ].
		self class environment organization 
			renameCategory: oldName 
			toBe: categoryName. ].
]

{
	#category : #'private ',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>toCategoryName: aString  [
	^ aString = self packageName
		ifTrue: [ aString ]
		ifFalse: [ self packageName, '-', aString ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageTag>>updateDefinedClassNamed: oldString withNewName: newString [
	(self hasClassNamed: oldString)
		ifFalse: [ ^ self ].
	self removeClassNamed: oldString.
	self addClassNamed: newString
]
