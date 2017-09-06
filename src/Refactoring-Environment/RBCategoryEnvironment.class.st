"
I am a RBBrowserEnvironment on a set of category names.
I containt all entities using this category name.
I am more restricted to the exact category name compared
to a package environment.

Example, all Morph subclasses in category Morphic-Base-Menus

(RBBrowserEnvironment new forClasses: Morph withAllSubclasses) forCategories: {#'Morphic-Base-Menus'}
"
Class {
	#name : #RBCategoryEnvironment,
	#superclass : #RBBrowserEnvironmentWrapper,
	#instVars : [
		'categories'
	],
	#category : #Refactoring-Environment,
	#timestamp : 'NicolaiHess 4/27/2015 21:22'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment class>>categories: aCollection [
	^ self
		onEnvironment: self default
		categories: aCollection
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment class>>category: aCategory [
	^ self categories: { aCategory }
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment class>>onEnvironment: anEnvironment categories: aCollection [
	^(self onEnvironment: anEnvironment)
		categories: aCollection;
		yourself
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment>>addCategory: aSymbol [
	categories add: aSymbol
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment>>categories: aCollection [
	categories addAll: aCollection
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment>>classNames [
	^ self categories 
		inject: IdentitySet new
		into: [ :answer :each | 
			answer
				addAll: (self classNamesFor: each);
				yourself ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment>>defaultLabel [
	| stream |
	stream := String new writeStream.
	categories do: [:each | stream nextPutAll: each; nextPut: $ ].
	^stream contents
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment>>definesClass: aClass  [
	^ (super definesClass: aClass) and: [ categories includes: aClass theNonMetaClass category ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment>>includesCategory: aCategory [
	^(categories includes: aCategory)
		and: [super includesCategory: aCategory]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment>>includesClass: aClass  [
	^ (super includesClass: aClass) and: [ categories includes: aClass theNonMetaClass category ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment>>initialize [
	super initialize.
	categories := IdentitySet new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment>>isEmpty [
	^categories isEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment>>packages [
	^ self classes collect: #package
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment>>postCopy [
	super postCopy.
	categories := categories copy
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBCategoryEnvironment>>storeOn: aStream [
	aStream nextPut: $(.
	super storeOn: aStream.
	aStream nextPutAll: ' categories: '.
	categories asArray storeOn: aStream.
	aStream nextPut: $)
]
