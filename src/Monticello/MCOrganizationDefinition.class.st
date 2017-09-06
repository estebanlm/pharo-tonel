"
A MCOrganizationDefinition represents a category change. 
"
Class {
	#name : #MCOrganizationDefinition,
	#superclass : #MCDefinition,
	#instVars : [
		'categories'
	],
	#category : #Monticello-Modeling,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition class>>categories: anArray [
	^ self instanceLike: (self new categories: anArray)
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>= aDefinition [

	^ (super = aDefinition)
		and: [ self categories size = aDefinition categories size and: [ self categories includesAll: aDefinition categories ] ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>accept: aVisitor [
	^ aVisitor visitOrganizationDefinition: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>basicCommonPrefix [
	"Answers the minimum common denominator on package names contained in the monticello package. 
	 It can answer a package in the form X-Y-, with a minus at end..."
	| stream  |
	categories isEmpty ifTrue: [ ^ '' ].
	
	stream := String new writeStream.
	categories first withIndexDo: [:c :index |
		categories do: [:each |
			(each at: index ifAbsent: []) = c 
				ifFalse: [ ^ stream contents ] ].
		stream nextPut: c ].
	
	^stream contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>categories [
	"ensure the categories are sorted alphabetically, so the merge don't take it as a conflict"
	^ categories
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>categories: anArray [
	categories := anArray sort
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>commonPrefix [
	"Answer the package common name. 
	 In ancient times, this was answering X-Y-, with a minus at the end... this was useful for the 
	 old PackageInfo framework. RPackage does not do pattern matching, thus this is not needed anymore 
	 (and provoques an error)"
	| prefix |
	prefix := self basicCommonPrefix.
	^(prefix notEmpty and: [ prefix endsWith: '-' ])
		ifTrue: [ prefix allButLast ]
		ifFalse: [ prefix ].
	

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>description [
	^ Array with: #organization with: self fullDescription
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>fullDescription [
	self categories ifEmpty: [ ^ self commonPrefix ].
	^ String
		streamContents: [ :stream | 
			| first |
			first := self categories first.
			stream << first.
			self categories allButFirst
				do: [ :c | 
					| part |
					part := c withoutPrefix: first.
					stream << $| << part ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>isOrganizationDefinition [
	^ true
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>postloadOver: oldDefinition [
	SystemOrganization categories:
		(self
			reorderCategories: SystemOrganization categories
			original: (oldDefinition ifNil: [#()] ifNotNil: [oldDefinition categories]))
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>reorderCategories: allCategories original: oldCategories [
	| first |
	first := allCategories detect: [:ea | categories includes: ea] ifNone: [^ allCategories].
	^ 	((allCategories copyUpTo: first) copyWithoutAll: oldCategories, categories),
		categories,
		((allCategories copyAfter: first) copyWithoutAll: oldCategories, categories)

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>shortSummaryPrefix [

	^ self definition description last
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>sortKey [
	^ '<organization>'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>source [
	^ String streamContents:
		[:s |
		categories do: [:ea | s nextPutAll: ea] separatedBy: [s cr]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>summary [
	^ categories asArray printString
]

{
	#category : #unloading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCOrganizationDefinition>>unload [
	categories
		do: [ :category | 
			(SystemOrganization isEmptyCategoryNamed: category)
				ifTrue: [ SystemOrganization removeCategory: category ] ]
]
