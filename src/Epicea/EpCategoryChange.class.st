"
I represent a change in the categories of a package.
"
Class {
	#name : #EpCategoryChange,
	#superclass : #EpCodeChange,
	#instVars : [
		'classCategoryName',
		'affectedPackageName'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:47'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryChange class>>named: aName [

	^ self named: aName packageName: (self packageNameFromCategoryName: aName)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryChange class>>named: aName packageName: aPackageName [

	^ self basicNew 
		initializeNamed: aName packageName: aPackageName;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryChange class>>packageNameFromCategoryName: aName [

	self flag: #todo. "Is it really necessary to know the package name?"
	^ (RPackage organizer packageMatchingExtensionName: aName) 
		ifNotNil: [ :package | package name ]
		ifNil: [ aName ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryChange>>affectedPackageName  [

	^ affectedPackageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryChange>>categoryName [

	^ classCategoryName 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryChange>>doesOverride: aCodeChange  [

	^ aCodeChange isEpCategoryChange and: [
		aCodeChange affectedPackageName = self affectedPackageName ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryChange>>initializeNamed: aName packageName: aPackageName [

	self initialize.
	classCategoryName := aName.
	affectedPackageName := aPackageName.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryChange>>isEpCategoryChange [

	^ true
]
