"
I represent a change in the category of a class or a trait.
"
Class {
	#name : #EpBehaviorCategoryChange,
	#superclass : #EpBehaviorChange,
	#instVars : [
		'oldCategory',
		'newCategory',
		'class'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:42'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCategoryChange class>>oldCategory: anOldCategory newCategory: aNewCategory class: aClass [

	^ self basicNew 
		initializeOldCategory: anOldCategory newCategory: aNewCategory class: aClass;
		yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCategoryChange>>accept: aVisitor [

	^ aVisitor visitBehaviorCategoryChange: self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCategoryChange>>behaviorAffected [
	^ self classAffected
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCategoryChange>>behaviorAffectedName [
	^ self classAffected name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCategoryChange>>classAffected [

	^ class
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCategoryChange>>initializeOldCategory: anOldCategory newCategory: aNewCategory class: aClass [

	self initialize.
	oldCategory := anOldCategory.
	newCategory := aNewCategory.
	class := aClass asEpiceaRingDefinition.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCategoryChange>>newCategory [

	^ newCategory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCategoryChange>>oldCategory [

	^ oldCategory
]
